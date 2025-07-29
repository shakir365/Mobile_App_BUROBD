import 'package:buro_employee/localization/Language/languages.dart';
import 'package:buro_employee/repository/bloc/leave_bloc/leave_bloc_cubit.dart';
import 'package:buro_employee/repository/models/Leaveinfo.dart';
import 'package:buro_employee/repository/models/leave.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../repository/network/buro_api_provider.dart';
import '../../repository/network/buro_repository.dart';
import '../../sessionmanager/session_manager.dart';
import '../../theme/colors.dart';
import '../../theme/styles.dart';
import '../../utilities/common_methods.dart';
import '../../widgets/alert.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';

class ApplyLeave extends StatefulWidget {
  static const String routeName = '/applyleave';

  static route() => MaterialPageRoute(builder: (_) => ApplyLeave());

  // const FormScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return ApplyLeaveState();
  }
}

class ApplyLeaveState extends State<ApplyLeave> {
  DateTimeRange dtrange = new DateTimeRange(
      start: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      end: DateTime(2025, 12, 31));

  ValueNotifier<List<DistrictLeaveData>> _districtListNotifier =
      ValueNotifier([]);

  final ValueNotifier<List<DivisionLeaveData>> _divisionListNotifier =
      ValueNotifier([]);
  final List<DivisionLeaveData> _divisionList = [
    // Add your DivisionLeaveData list here
  ];

  String? _reason;
  String? _address;
  String? selectedValueforleavetype = null;
  String? selectedValuefordelegateusers = null;
  String supervisorName = '';

  late SessionManager sessionManager;

  var selectedLang;

  var _currentSelectedValueDivision = null;
  var _currentSelectedValueDistrict = null;
  var _currentSelectedValueLeave = null;
  var _currentSelectedValueCountry = null;

  String? divisionName = '';
  String? districtName = 'not selected';
  String? thanaName = '';
  String? villageName;

  bool isChecked = true;
  bool showErrorMessage = false;
  String? _diff;

  DateTime? firstdate;
  DateTime? seconddate;
  var repository = BuroRepository();

  String? countryID = "BGD";
  String? countryName = "BANGLADESH";
  String? Countrynumber;
  String? divisionID = "";
  String? districtID = "";
  String? selectedDivisionCode;
  late LeaveBlocCubit bloc;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? uploadedFileName;
  bool isUploading = false;
  late FormData formData;

  @override
  void initState() {
    bloc = context.read<LeaveBlocCubit>();

    sessionManager = SessionManager();
    getSuperVisorInfo().then((value) => {
          supervisorName = value,
          setState(() {}),
        });

    getSelectedLang().then((value) => {
          selectedLang = value,
          print('Apply Leave Selected Language ${value.toString()}')
        });

    print('bloc.countryLeaveList  ${bloc.countryLeaveList.length}');
    _currentSelectedValueCountry = bloc.countryLeaveList[18];

    _divisionListNotifier.value = bloc.divisionDropDownList;
    _currentSelectedValueDivision = null;

    super.initState();
  }

  Future<String> getSuperVisorInfo() async {
    return await sessionManager.supervisorInfo;
  }

  @override
  Widget build(BuildContext context) {
    String leaveType;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorResources.WHITE),
        backgroundColor: ColorResources.APP_THEME_COLOR,
        title: Text(
          Languages.of(context)!.applyLeave,
          style: TextStyle(color: ColorResources.WHITE),
        ),
      ),
      body: BlocConsumer<LeaveBlocCubit, LeaveBlocState>(
        listener: (context, state) {
          if (state is LeaveBlocErrorState) {
            final snackBar = SnackBar(
              content: Text(Languages.of(context)!.internetErrorText),
              backgroundColor: Colors.red,
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          //print('Home page State ${state}');

          if (state is LeaveBlocInitialState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LeaveBlocLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LeaveBlocLoadedState) {
            //print('List Count ${bloc.remainingLeaveList.length}');

            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _recipient(),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        Languages.of(context)!.leaveDetails,
                        style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: ColorResources.GREY_NINETY),
                      ),
                      Divider(
                        color: ColorResources.GREY_FOURTY,
                      ),
                      _calendar(),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        Languages.of(context)!.leaveType,
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: ColorResources.GREY_NINETY),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      bloc.remainingLeaveList.length > 0
                          ? Visibility(
                              visible: true,
                              child: DropdownButtonFormField<
                                  RemainingLeaveInfoData>(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: ColorResources.TEXT_FIELD_COLOR,
                                  hintStyle: TextStyle(
                                      color: ColorResources.GREY_SEVENTY),
                                  contentPadding: EdgeInsets.only(
                                      left: 10.0,
                                      right: 5.0,
                                      top: 16.0,
                                      bottom: 16.0),
                                  hintText: 'Select Leave Type',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: ColorResources.GREY_FOURTY,
                                      // Change this to the desired focused border color
                                      width: 1,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: ColorResources.APP_THEME_COLOR,
                                      // Border color when not focused
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: ColorResources
                                          .TEXT_FIELD_BORDER_COLOR,
                                      // Change this to the desired enabled border color
                                      width: 0.0,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: ColorResources.REJECT_COLOR,
                                      // Change this to the desired error border color
                                      width: 1,
                                    ),
                                  ),
                                ),
                                value: _currentSelectedValueLeave,
                                //isDense: true,
                                isExpanded: true,

                                validator: (value) {
                                  if (value == null) {
                                    return 'Leave Type is Required';
                                  }
                                },
                                onChanged: (value) {
                                  _currentSelectedValueLeave = value!;

                                  setState(() {
                                    selectedValueforleavetype =
                                        value.leaveTypeId.toString();
                                    leaveType = value.leaveTypeName!;
                                  });
                                },
                                items: bloc.remainingLeaveList
                                    .map((RemainingLeaveInfoData item) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      "${item.leaveTypeName!} (${item.remaining})",
                                      style: TextStyle(color: Colors.black),
                                      textAlign: TextAlign.left,
                                    ),
                                    value: item,
                                  );
                                }).toList(),
                              ),
                            )
                          : Container(
                              child: Text('Test'),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        Languages.of(context)!.reason,
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: ColorResources.GREY_NINETY),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorResources.TEXT_FIELD_COLOR,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                  color: ColorResources.APP_THEME_COLOR,
                                  style: BorderStyle.solid,
                                  width: 2)),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: ColorResources.TEXT_FIELD_BORDER_COLOR,
                                width: 0.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: ColorResources.REJECT_COLOR,
                              // Change this to the desired error border color
                              width: 1,
                            ),
                          ),
                          hintStyle:
                              TextStyle(color: ColorResources.GREY_SEVENTY),
                          contentPadding: EdgeInsets.only(
                              left: 10.0, right: 5.0, top: 16.0, bottom: 16.0),
                        ),
                        maxLength: 50,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Leave Reason is Required';
                          }
                        },
                        onSaved: (String? value) {
                          _reason = value;
                        },
                      ),

                      ///Leave reason

                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        Languages.of(context)!.attachment,
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: ColorResources.GREY_NINETY),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                            color:
                                                ColorResources.GREY_FOURTY))),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        ColorResources.GREY_TWENTY),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        ColorResources.GREY_TWENTY),
                              ),
                              onPressed: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles();

                                if (result != null &&
                                    result.files.single.path != null) {
                                  String filePath = result.files.single.path!;
                                  String fileName = result.files.single.name;

                                  setState(() {
                                    isUploading = true;
                                    uploadedFileName = fileName;
                                  });

                                  if (uploadedFileName != null ){
                                    formData = FormData.fromMap({
                                      "files": await MultipartFile.fromFile(
                                          filePath,
                                          filename: fileName),
                                      "moduleName":'Leave'
                                    });

                                  }


/*
  formData = FormData.fromMap({
                                    "files": await MultipartFile.fromFile(
                                        filePath,
                                        filename: fileName),
                                  });
*/


                                 print('Form Data ${formData}');




                                }
                              },
                              child: Text(
                                'Choose File',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: ColorResources.GREY_NINETY,
                                ),
                              )),
                          SizedBox(width: 20,),
                          Text(
                            uploadedFileName != null
                                ? "$uploadedFileName"
                                : 'No File Chosen',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        Languages.of(context)!.destination,
                        style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: ColorResources.GREY_NINETY),
                      ),
                      Divider(
                        color: ColorResources.GREY_FOURTY,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      _location(context),
                      SizedBox(height: 30),
                      ElevatedButton(
                        child: Text(
                          Languages.of(context)!.submitButton,
                          style: Styles.buttonTextStyle,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorResources.APP_THEME_COLOR,
                          elevation: 0,

                          minimumSize: const Size.fromHeight(50), // NEW
                        ),
                        onPressed: () async{




                          if (!_formKey.currentState!.validate()) {
                            return;
                          }

                          if (isChecked) {
                            CommonMethods.showLoaderDialog(context);

                            _formKey.currentState!.save();
                            dynamic converted1 = dtrange.start.toString();
                            dynamic startDate = converted1.substring(0, 10);
                            dynamic covered2 = dtrange.end.toString();
                            dynamic endDate = covered2.substring(0, 10);

                            var divisionId = 0;
                            var districtId = 0;

                            if (divisionID.toString().isNotEmpty) {
                              divisionId =
                                  int.parse(divisionID.toString().trim());
                            }
                            if (districtID.toString().isNotEmpty) {
                              districtId =
                                  int.parse(districtID.toString().trim());
                            }

                            int leaveTypeID = 0;
                            if (selectedValueforleavetype != null) {
                              print('In Condition 1');
                              leaveTypeID = int.parse(
                                  selectedValueforleavetype.toString());
                            } else {
                              print('In Condition 2');
                              return;
                            }


                            int? fileID = 0;

                            print(' uploadedFileName $uploadedFileName');

                            if(uploadedFileName != null){
                              FileUploadModel fileUploadModel = await  repository.fileUpload(formData);
                              fileID = fileUploadModel.data!.fileId;
                            }

                            Map<String, dynamic> json = {
                              "leavetypeId": leaveTypeID,
                              "Reason": _reason.toString(),
                              "beginDate": startDate.toString(),
                              "endDate": endDate.toString(),

                              ///dtrange.start.toString(),
                              "countryCode": countryID.toString(),
                              "divisionID": divisionId,
                              "destination": countryName.toString() +
                                  "," +
                                  divisionName.toString(),
                              "mailing_Address": _address.toString(),
                              "districtID": districtId,
                              "attachmentInfoId": fileID,
                            };

                           // print(json);

                            repository
                                .createLeaveRequest(json)
                                .then((response) {
                              if (response.success == true) {
                                CommonMethods.showMessage(
                                    context,
                                    "Application Submitted",
                                    ColorResources.APP_THEME_COLOR);
                                Navigator.pop(context);

                                Navigator.pop(context);
                              } else {
                                Navigator.pop(context);
                                CommonMethods.showMessage(
                                    context, response.messageEn, Colors.red);
                              }
                            });
                          } else {
                            print('please Accept terms and condistion');
                            Alert(
                                    message:
                                        'please Accept terms and condistion',
                                    shortDuration: true)
                                .show();
                          }

                          //print('Form Data $formData');


                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          } else if (state is LeaveBlocErrorState) {
            return Center(
              child: Container(
                child: Text('Something Went Wrong'),
              ),
            );
          } else {
            // (state is WeatherError)
            return Center(
              child: Container(
                child: Text('Network Error'),
              ),
            );
          }
        },
      ),
    );
  }

  Future<String> getSelectedLang() async {
    return await sessionManager.selectedLang;
  }

  Widget _recipient() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorResources.RECEIPIENT_BACKGROUD,
              border:
                  Border.all(color: ColorResources.APP_THEME_COLOR, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(
                10,
              )),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recipient',
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: ColorResources.GREY_DARK_SIXTY),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    ' $supervisorName ',
                    style: Styles.listHeaderTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _calendar() {
    final strt = dtrange.start;
    final dend = dtrange.end;
    final daydiff = dtrange.duration;

    Future pickDaterange() async {
      DateTimeRange? newdatetimerng = await showDateRangePicker(
          context: context,
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
          initialDateRange: dtrange);
      if (newdatetimerng == null) return;
      setState(() => (dtrange = newdatetimerng));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 5),
            Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          Languages.of(context)!.fromDate,
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              color: ColorResources.GREY_NINETY),
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 0.0, right: 5.0, top: 16.0, bottom: 16.0),
                      child: OutlinedButton(
                        onPressed: pickDaterange,
                        child: Text(
                          '${strt.year}/${strt.month}/${strt.day}',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              color: ColorResources.GREY_SEVENTY),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorResources.GREY_TWENTY,
                          elevation: 0,
                          minimumSize: const Size.fromHeight(50), // NEW
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(
              width: 10,
            ),
            Flexible(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      Languages.of(context)!.toDate,
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: ColorResources.GREY_NINETY),
                    )),
                Padding(
                  padding: EdgeInsets.only(
                      left: 0.0, right: 5.0, top: 16.0, bottom: 16.0),
                  child: OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorResources.GREY_TWENTY,
                        elevation: 0,

                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                      onPressed: (() => {}),
                      child: Text(
                        '${dend.year}/${dend.month}/${dend.day}',
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: ColorResources.GREY_SEVENTY),
                      )),
                )
              ],
            )),
            const SizedBox(height: 16),
          ],
        ),
      ],
    );
  }

  Widget _location(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            Languages.of(context)!.country,
            style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                color: ColorResources.GREY_NINETY),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        bloc.countryLeaveList.length > 0
            ? Visibility(
                visible: true,
                child: DropdownButtonFormField<LeaveCountryData>(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorResources.TEXT_FIELD_COLOR,
                    contentPadding: EdgeInsets.only(
                        left: 10.0, right: 5.0, top: 16.0, bottom: 16.0),
                    hintStyle: TextStyle(color: ColorResources.GREY_SEVENTY),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 13.0),
                    hintText: 'Select Country',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: ColorResources.GREY_FOURTY,
                        // Change this to the desired focused border color
                        width: 1,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: ColorResources.GREY_FOURTY,
                        // Border color when not focused
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: ColorResources.GREY_FOURTY,
                        // Change this to the desired enabled border color
                        width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.red,
                        // Change this to the desired error border color
                        width: 2,
                      ),
                    ),
                  ),
                  value: _currentSelectedValueCountry,
                  isExpanded: true,
                  onChanged: (value) {
                    _currentSelectedValueCountry = value!;
                    if (value.countryName == "BANGLADESH") {
                      countryID = value.countryCode.toString();
                      countryName = value.countryName.toString();
                      _divisionListNotifier.value = bloc.divisionDropDownList;
                    } else {
                      countryID = value.countryCode.toString();
                      countryName = value.countryName.toString();
                      _divisionListNotifier.value = [];
                      _districtListNotifier.value = [];
                      print('In Else');
                      /*setState(() {
                        print('In setState');
                        _currentSelectedValueDivision = null;
                        _currentSelectedValueDistrict = null;
                      });*/
                    }
                  },
                  items: bloc.countryLeaveList.map((LeaveCountryData item) {
                    return DropdownMenuItem(
                      child: Text(item.countryName!,
                          style: TextStyle(color: Colors.black)),
                      value: item,
                    );
                  }).toList(),
                ),
              )
            : Container(
                child: CommonMethods.emptyListDropDownView(),
              ),
        SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            Languages.of(context)!.division,
            style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                color: ColorResources.GREY_NINETY),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ValueListenableBuilder<List<DivisionLeaveData>>(
          valueListenable: _divisionListNotifier,
          builder: (context, divisionList, child) {
            return divisionList.isNotEmpty
                ? Visibility(
                    visible: true,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: DropdownButtonFormField<DivisionLeaveData>(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorResources.TEXT_FIELD_COLOR,
                          contentPadding: EdgeInsets.only(
                              left: 10.0, right: 5.0, top: 16.0, bottom: 16.0),
                          hintStyle:
                              TextStyle(color: ColorResources.GREY_SEVENTY),
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 13.0),
                          hintText: 'Select Division',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: ColorResources.GREY_FOURTY,
                              // Change this to the desired focused border color
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: ColorResources.GREY_FOURTY,
                              // Border color when not focused
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: ColorResources.GREY_FOURTY,
                              // Change this to the desired enabled border color
                              width: 1,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.red,
                              // Change this to the desired error border color
                              width: 2,
                            ),
                          ),
                        ),
                        value: _currentSelectedValueDivision,
                        isExpanded: true,
                        onChanged: (value) {
                          _currentSelectedValueDivision = value!;
                          selectedDivisionCode = value.divisionCode;

                          // Update the district list without setState
                          bloc
                              .getDistrictListByDivision(selectedDivisionCode)
                              .then((value) => {
                                    if (value!.data!.isNotEmpty)
                                      {
                                        _districtListNotifier.value =
                                            value!.data!,
                                        _currentSelectedValueDistrict =
                                            value.data![0],
                                      }
                                  });
                          divisionID = value.id.toString(); //newly Added
                          //selectedDivisionCode = value?.divisionCode.toString();
                          divisionName = value?.divisionName.toString();
                        },
                        items: divisionList.map((DivisionLeaveData item) {
                          return DropdownMenuItem(
                            child: Text(item.divisionName!,
                                style: TextStyle(color: Colors.black)),
                            value: item,
                          );
                        }).toList(),
                      ),
                    ),
                  )
                : Container(
                    child: CommonMethods.emptyListDropDownView(),
                  );
          },
        ),

        /*bloc.divisionDropDownList.length > 0
            ? Visibility(
                visible: true,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: DropdownButtonFormField<DivisionLeaveData>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorResources.TEXT_FIELD_COLOR,
                      contentPadding: EdgeInsets.only(
                          left: 10.0, right: 5.0, top: 16.0, bottom: 16.0),
                      hintStyle: TextStyle(color: ColorResources.GREY_SEVENTY),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 13.0),
                      hintText: 'Select Division',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: ColorResources.GREY_FOURTY,
                          // Change this to the desired focused border color
                          width: 1,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: ColorResources.GREY_FOURTY,
                          // Border color when not focused
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: ColorResources.GREY_FOURTY,
                          // Change this to the desired enabled border color
                          width: 1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.red,
                          // Change this to the desired error border color
                          width: 2,
                        ),
                      ),
                    ),
                    value: _currentSelectedValueDivision,
                    isExpanded: true,

                    onChanged: (value) {
                      _currentSelectedValueDivision = value!;
                      selectedDivisionCode = value.divisionCode;

                      // Update the district list without setState
                      bloc.getDistrictListByDivision(selectedDivisionCode)
                          .then((value) => {

                            if(value!.data!.isNotEmpty){
                              districtListNotifier.value = value!.data!,
                              _currentSelectedValueDistrict = value.data![0],
                            }


                              });
                      divisionID = value.id.toString(); //newly Added
                      //selectedDivisionCode = value?.divisionCode.toString();
                      divisionName = value?.divisionName.toString();
                    },
                    items: bloc.divisionDropDownList.map((DivisionLeaveData item) {
                      return DropdownMenuItem(
                        child: Text(item.divisionName!,
                            style: TextStyle(color: Colors.black)),
                        value: item,
                      );
                    }).toList(),
                  ),
                ),
              )
            : Container(
                child: CommonMethods.emptyListDropDownView(),
              ),*/
        SizedBox(height: 30),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            Languages.of(context)!.district,
            style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                color: ColorResources.GREY_NINETY),
          ),
        ),
        SizedBox(height: 10),
        ValueListenableBuilder<List<DistrictLeaveData>>(
          valueListenable: _districtListNotifier,
          builder: (context, districtList, child) {
            return districtList.isNotEmpty
                ? Visibility(
                    visible: true,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: DropdownButtonFormField<DistrictLeaveData>(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorResources.TEXT_FIELD_COLOR,
                          contentPadding: EdgeInsets.only(
                              left: 10.0, right: 5.0, top: 16.0, bottom: 16.0),
                          hintStyle:
                              TextStyle(color: ColorResources.GREY_SEVENTY),
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 13.0),
                          hintText: 'Select District',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: ColorResources.GREY_FOURTY,
                              // Change this to the desired focused border color
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: ColorResources.GREY_FOURTY,
                              // Border color when not focused
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: ColorResources.GREY_FOURTY,
                              // Change this to the desired enabled border color
                              width: 1,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.red,
                              // Change this to the desired error border color
                              width: 2,
                            ),
                          ),
                        ),
                        value: _currentSelectedValueDistrict,
                        isExpanded: true,
                        onChanged: (value) {
                          _currentSelectedValueDistrict = value!;
                          districtID = value.id.toString();
                          districtName = value.districtName;
                          //setState(() {}); // If you need to do additional UI updates, you can still call setState
                        },
                        items: districtList.map((DistrictLeaveData item) {
                          return DropdownMenuItem(
                            child: Text(item.districtName!,
                                style: TextStyle(color: Colors.black)),
                            value: item,
                          );
                        }).toList(),
                      ),
                    ),
                  )
                : Container(
                    child: CommonMethods.emptyListDropDownView(),
                  );
          },
        ),
        SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            Languages.of(context)!.address,
            style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                color: ColorResources.GREY_NINETY),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorResources.TEXT_FIELD_COLOR,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                    color: ColorResources.APP_THEME_COLOR,
                    style: BorderStyle.solid,
                    width: 2)),
            enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(
                  color: ColorResources.TEXT_FIELD_BORDER_COLOR, width: 0.0),
            ),
            hintStyle: Styles.apaHintTextStyle,
            contentPadding: EdgeInsets.only(
                left: 10.0, right: 5.0, top: 16.0, bottom: 16.0),
          ),
          maxLength: 50,
          onSaved: (String? value) {
            _address = value;
          },
        )
      ],
    );
  }
}
