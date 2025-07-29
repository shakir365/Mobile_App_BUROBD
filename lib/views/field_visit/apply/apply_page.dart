import 'package:buro_employee/localization/Language/languages.dart';

import 'package:buro_employee/repository/bloc/apply_cubit/apply_cubit.dart';
import 'package:buro_employee/repository/database/database_handler.dart';
import 'package:buro_employee/repository/models/ApprovedPlan.dart';
import 'package:buro_employee/repository/models/apply_request.dart';
import 'package:buro_employee/repository/models/branch.dart';
import 'package:buro_employee/repository/network/buro_repository.dart';
import 'package:buro_employee/sessionmanager/session_manager.dart';
import 'package:buro_employee/theme/colors.dart';
import 'package:buro_employee/theme/styles.dart';
import 'package:buro_employee/utilities/analytics.dart';
import 'package:buro_employee/utilities/common_methods.dart';
import 'package:buro_employee/widgets/white_text_field.dart';
import 'package:intl/intl.dart';
import 'package:buro_employee/views/field_visit/apply/apply_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/date_picker.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class Apply extends StatefulWidget {
  late final ApplyRequest? arguments;

  static const routeName = '/apply';

  Apply([this.arguments]) : super();

  @override
  State<StatefulWidget> createState() => _ApplyPageState();
}

class _ApplyPageState extends State<Apply> {
  final dateFormat = DateFormat("yyyy-MM-dd");
  final timeFormat = DateFormat("hh:mm a");
  late DateTime? startDate;
  String startTime = '';
  late DateTime? endDate;
  String endTime = '';
  String startPlace = '';
  String endPlace = '';
  String fromBranch = '';
  String fromOther = '';
  String toBranch = '';
  String toOther = '';
  String reason = '';
  String transportBy = '';
  late DataBaseHandler handler;
  String superVisorInfo = '';
  bool isChecked = false;
  final startDateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endDateController = TextEditingController();
  final endTimeController = TextEditingController();
  final startFormController = TextEditingController();
  final endFormController = TextEditingController();
  final reasonController = TextEditingController();
  final transportController = TextEditingController();

  final fromBranchController = TextEditingController();
  final fromOtherController = TextEditingController();
  final toBranchController = TextEditingController();
  final toOtherController = TextEditingController();

  final transportFaireController = TextEditingController();
  final morningController = TextEditingController();
  final afternoonController = TextEditingController();
  final nightController = TextEditingController();
  final hotelController = TextEditingController();
  final dailyAllowanceController = TextEditingController();
  final specialAllowanceController = TextEditingController();

  var repository = BuroRepository();
  var planList;
  late ApplyCubit bloc;

  List<NameIDModel> planDropdownList = [];
  List<NameIDModel> placeDropDownList = [];

  List<String> placeDropDownTest = [];
  var planId = 0;
  var planName = '';
  var previousPlanId;
  var position = 0;
  int _currentIndex = 0;
  int _placeCurrentIndex = 0;
  var name = NameIDModel(name: '', id: 0);
  var namePlace = PlaceWithPrice(name: 'M', id: 2, price: 100);

  var _currentSelectedValue = NameIDModel(name: '', id: -1);

  //var _currentSelectedValuePlaceMorning = PlaceWithPrice( name : 'M',id: 2,price: 100);
  //var _currentSelectedValuePlaceMorning = PlaceWithPrice(name: 'Select', id: -1, price: 100);
  var _currentSelectedValuePlaceMorning = null;
  var _currentSelectedValuePlaceEvening = null;
  var _currentSelectedValuePlaceNight = null;
  var _currentSelectedValuePlaceResidence = null;
  var _dailyAllowanceCheckBox = false;
  var _specialAllowanceCheckBox = false;

  int morningPlaceID = 0;
  int eveningPlaceID = 0;
  int nightPlaceID = 0;
  int hotelPlaceID = 0;
  int dailyAllowanceISChecked = 0;
  int specialAllowanceISChecked = 0;

  //M price 100 amount 2

  List<Item> branchSuggestion = [];
  GlobalKey<AutoCompleteTextFieldState<Item>> keyFromPlace = GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<Item>> keyToPlace = GlobalKey();
  TextEditingController controller = TextEditingController();
  late BuroRepository buroRepository;

  int gradeID = 0;

  @override
  void initState() {
    super.initState();

    print('Apply Page initState Called');

    bloc = context.read<ApplyCubit>();

    this.handler = DataBaseHandler.instance;

    //addBillInfoCubit.getBreakFastBill(1);
    try {
      getPlanId().then((value) => {
                previousPlanId = value,
                getPlan().then((value) => {
                      value!.data.asMap().forEach((key, value) {
                        planDropdownList.add(
                            NameIDModel(name: value.tourDetails, id: value.planID));

                        if (previousPlanId == value.planID) {
                          position = key;
                        } else {
                          if (widget.arguments == null) {
                            _currentSelectedValue = planDropdownList[0];
                          }
                        }
                      }),

                  _currentSelectedValue = planDropdownList[position],
                  planId = planDropdownList[position].id,
                  planName = planDropdownList[position].name,

                }),
              });
    } catch (e) {
      print(e);
    }

    getSupervisorInfo().then((value) => {
          superVisorInfo = value,
          setState(() {}),
        });

    getBranchListFromDatabase().then((value) => () {
          value.asMap().forEach((key, value) {});
        });

    getGradeId().then(
        (value) => {gradeID = int.parse(value), print('GradeID $gradeID')});

    print('Grade ID ${gradeID}');

    // if(gradeID > 105){

    if (bloc.dailyNSpecialBill.length < 1) bloc.getBreakFastBill();
    if (bloc.lunchNDinnerDropDownList.length < 1) bloc.getLunchNDinnerBill();
    if (bloc.residenceDropDownList.length < 1) bloc.getResidenceBill();

    // }

    bloc.getDailyNSpecial();
  }

  Future<List<Item>> getBranchListFromDatabase() async {
    // Get Branch List from database
    final db = await handler.initializeDBBranch();
    late List<Map<String, dynamic>> maps;
    try {
      maps = await db.query('branch');
      var nameList;
      var item;
      maps.asMap().forEach((index, value) => {
            //print("Index $index Value ${value['name']}"),
            item = Item('$index', value['name']),
            branchSuggestion.add(item)
          });
      //print('suggestion length ${branchSuggestion.length}');
    } catch (Exc) {
      print('Exception $Exc');
    }

    return branchSuggestion;
  }

  //Apply item
  Future<void> addApplyItem(ApplyRequest applyRequest) async {
   /* this.handler.insertApplyItem(applyRequest).whenComplete(() async => {

        });*/


    await this.handler.insertApplyItem(applyRequest);
    setState(() {
    //print(handler.)
    });
  }

  //Supervisor
  Future<String> getSupervisorInfo() async {
    return await sessionManager.supervisorInfo;
  }

  //Plan
  Future<ApprovedPlan?> getPlan() async {
    return bloc.getApprovedList();
  }

  Future<int> getPlanId() {
    return sessionManager.planId;
  }

  Future<String> getGradeId() {
    return sessionManager.gardeID;
  }

  @override
  Widget build(BuildContext context) {
    bloc.morningDropDownList.forEach((element) {
      print('Name ${element.name} price ${element.price} amount ${element.id}');
    });

    final List<Container> _placeWidget = [
      Container(
        // from Place
        width: double.infinity,
        height: 240,
        decoration: BoxDecoration(
          color: ColorResources.WHITE,
          border: Border.all(
              color: ColorResources.TEXT_FIELD_BORDER_COLOR, width: 1),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(4), bottomLeft: Radius.circular(4)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Languages.of(context)!.fromBranch,
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: ColorResources.GREY_NINETY)),
              SizedBox(
                height: 5,
              ),
              AutoCompleteTextField<Item>(
                key: keyFromPlace,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorResources.GREY_TWENTY,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: ColorResources.APP_THEME_COLOR,
                            style: BorderStyle.solid,
                            width: 2)),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ColorResources.TEXT_FIELD_BORDER_COLOR,
                          width: 0.0),
                    )),
                suggestions: branchSuggestion,
                itemBuilder: (context, suggestion) => Padding(
                    child: ListTile(
                      title: Text(suggestion.name),
                    ),
                    padding: EdgeInsets.all(8.0)),
                itemSorter: (a, b) => 0,
                /*a.id == b.id
                    ? 0
                    : a.id > b.id
                    ? -1
                    : 1,*/
                itemSubmitted: (item) {
                  print("Item ${item.name}");

                  setState(() {
                    fromBranchController.text = item.name;
                  });
                },
                itemFilter: (suggestion, input) => suggestion.name
                    .toLowerCase()
                    .startsWith(input.toLowerCase()),
                controller: fromBranchController,
                clearOnSubmit: false,
              ),
              SizedBox(
                height: 10,
              ),
              Text(Languages.of(context)!.fromOther,
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: ColorResources.GREY_NINETY)),
              SizedBox(
                height: 5,
              ),
              Container(
                // color: Colors.red,
                // height: 56,
                child: TextFormField(
                  enableSuggestions: true,
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
                    hintText: '',
                    hintStyle: Styles.hintTextStyle,
                    contentPadding: EdgeInsets.all(20),
                  ),
                  controller: fromOtherController,
                ),
              )
            ],
          ),
        ),
      ), //1
      Container(
        // to place
        width: double.infinity,
        height: 240,
        decoration: BoxDecoration(
          color: ColorResources.WHITE,
          border: Border.all(
              color: ColorResources.TEXT_FIELD_BORDER_COLOR, width: 1),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(4), bottomLeft: Radius.circular(4)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Languages.of(context)!.toBranch,
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: ColorResources.GREY_NINETY)),
              SizedBox(
                height: 5,
              ),
              AutoCompleteTextField<Item>(
                key: keyToPlace,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorResources.GREY_TWENTY,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: ColorResources.APP_THEME_COLOR,
                            style: BorderStyle.solid,
                            width: 2)),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ColorResources.TEXT_FIELD_BORDER_COLOR,
                          width: 0.0),
                    )),
                suggestions: branchSuggestion,
                itemBuilder: (context, suggestion) => Padding(
                    child: ListTile(
                      title: Text(suggestion.name),
                    ),
                    padding: EdgeInsets.all(8.0)),
                itemSorter: (a, b) => 0,
                itemSubmitted: (item) {
                  print("Item ${item.name}");

                  setState(() {
                    toBranchController.text = item.name;
                  });
                },
                itemFilter: (suggestion, input) => suggestion.name
                    .toLowerCase()
                    .startsWith(input.toLowerCase()),
                controller: toBranchController,
                clearOnSubmit: false,
              ),
              SizedBox(
                height: 10,
              ),
              Text(Languages.of(context)!.toOther,
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: ColorResources.GREY_NINETY)),
              SizedBox(
                height: 5,
              ),
              Container(
                //height: 56,
                child: TextFormField(
                  enableSuggestions: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorResources.TEXT_FIELD_COLOR,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: ColorResources.APP_THEME_COLOR,
                            style: BorderStyle.solid,
                            width: 2)),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ColorResources.TEXT_FIELD_BORDER_COLOR,
                          width: 0.0),
                    ),
                    hintText: '',
                    hintStyle: Styles.hintTextStyle,
                    contentPadding: EdgeInsets.all(20),
                  ),
                  controller: toOtherController,
                ),
              )
            ],
          ),
        ),
      ), //2
    ];

    final List<Container> _children = [
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
              child: Text('Supervisor Name',
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: ColorResources.GREY_NINETY)),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorResources.WHITE,
                border: Border.all(
                    color: ColorResources.LIST_BORDER_WHITE, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(
                  10,
                )),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 12, top: 18, bottom: 18),
                child: Text(superVisorInfo),
              ),
            ),
            Visibility(
              visible: true,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text(
                      Languages.of(context)!.plan,
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: ColorResources.GREY_NINETY),
                    ),
                  )),
            ),
            Visibility(
              visible: true,
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: FormField<NameIDModel>(
                  initialValue: name,
                  builder: (FormFieldState<NameIDModel> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: 10.0, right: 5.0, top: 3.0, bottom: 3.0),
                        hintStyle: TextStyle(color: Colors.black),
                        errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 13.0),
                        hintText: 'Select a plan',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: ColorResources.GREY_FOURTY,
                                style: BorderStyle.solid,
                                width: 1)),
                      ),
                      isEmpty: _currentSelectedValue == 'Select a plan',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<NameIDModel>(
                          value: _currentSelectedValue,
                          //isDense: true,
                          isExpanded: true,
                          onChanged: position == 0 && previousPlanId == 0
                              ? (newValue) {
                            _currentSelectedValue = newValue!;
                            state.didChange(newValue);

                            setState(() {
                              planId = _currentSelectedValue.id;
                              planName = _currentSelectedValue.name;
                              print(
                                  'Id ${_currentSelectedValue.id} Name ${_currentSelectedValue.name}');
                            });
                          }
                              : null,
                          items: planDropdownList != null
                              ? planDropdownList.map((NameIDModel item) {
                            return DropdownMenuItem(
                              child: Text(
                                item.name,
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.left,
                              ),
                              value: item,
                            );
                          }).toList()
                              : null,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text('${Languages.of(context)!.visitStart}',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: ColorResources.GREY_NINETY)),
                )),
            Container(
                child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        // date
                        flex: 1,
                        fit: FlexFit.loose,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            child: DateTimeField(
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 18),
                                filled: true,
                                fillColor: ColorResources.TEXT_FIELD_COLOR,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: ColorResources.APP_THEME_COLOR,
                                        style: BorderStyle.solid,
                                        width: 2)),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ColorResources
                                          .TEXT_FIELD_BORDER_COLOR,
                                      width: 0.0),
                                ),
                                hintText: Languages.of(context)!.date,
                                hintStyle: Styles.hintTextStyle,
                              ),
                              controller: startDateController,
                              style: Styles.mediumTextStyle,
                              format: dateFormat,
                              onChanged: (date) {
                                print('Date $date');
                                if (date != null)
                                  startDate = date;
                                else
                                  startDate = null;
                              },
                              onShowPicker: (context, currentValue) {
                                return showDatePicker(
                                    context: context,
                                    firstDate: DateTime(1900),
                                    initialDate: currentValue ?? DateTime.now(),
                                    lastDate: DateTime(2100));
                              },
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        // start time
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Container(
                            child: DateTimeField(
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 18),
                                fillColor: ColorResources.TEXT_FIELD_COLOR,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: ColorResources.APP_THEME_COLOR,
                                        style: BorderStyle.solid,
                                        width: 2)),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ColorResources
                                          .TEXT_FIELD_BORDER_COLOR,
                                      width: 0.0),
                                ),
                                hintText: Languages.of(context)!.time,

                                hintStyle: Styles.hintTextStyle,
                                //contentPadding: EdgeInsets.all(0),
                              ),
                              style: Styles.mediumTextStyle,
                              onChanged: (time) {
                                startTime = time.toString();
                              },
                              format: timeFormat,
                              controller: startTimeController,
                              onShowPicker: (context, currentValue) async {
                                final TimeOfDay? time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(
                                      currentValue ?? DateTime.now()),
                                );
                                return time == null
                                    ? null
                                    : DateTimeField.convert(time);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: Text('${Languages.of(context)!.visitEnd}',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: ColorResources.GREY_NINETY)),
                )),
            Container(
                child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            // height: 56,
                            child: DateTimeField(
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 18),
                                filled: true,
                                fillColor: ColorResources.TEXT_FIELD_COLOR,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: ColorResources.APP_THEME_COLOR,
                                        style: BorderStyle.solid,
                                        width: 2)),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ColorResources
                                          .TEXT_FIELD_BORDER_COLOR,
                                      width: 0.0),
                                ),
                                hintText: Languages.of(context)!.date,
                                hintStyle: Styles.hintTextStyle,
                              ),
                              onChanged: (date) {
                                if (date != null)
                                  endDate = date;
                                else
                                  endDate = null;
                              },
                              format: dateFormat,
                              controller: endDateController,
                              style: Styles.mediumTextStyle,
                              onShowPicker: (context, currentValue) {
                                return showDatePicker(
                                    context: context,
                                    firstDate: DateTime(1900),
                                    initialDate: currentValue ?? DateTime.now(),
                                    lastDate: DateTime(2100));
                              },
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, left: 10),
                          child: Container(
                            child: DateTimeField(
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 18),
                                filled: true,
                                fillColor: ColorResources.TEXT_FIELD_COLOR,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: ColorResources.APP_THEME_COLOR,
                                        style: BorderStyle.solid,
                                        width: 2)),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ColorResources
                                          .TEXT_FIELD_BORDER_COLOR,
                                      width: 0.0),
                                ),
                                hintText: Languages.of(context)!.time,
                                hintStyle: Styles.hintTextStyle,
                              ),
                              onChanged: (time) {
                                endTime = time.toString();
                              },
                              format: timeFormat,
                              controller: endTimeController,
                              style: Styles.mediumTextStyle,
                              onShowPicker: (context, currentValue) async {
                                final TimeOfDay? time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(
                                      currentValue ?? DateTime.now()),
                                );
                                return time == null
                                    ? null
                                    : DateTimeField.convert(time);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      color: _placeCurrentIndex == 0
                          ? ColorResources.APP_THEME_COLOR
                          : ColorResources.WHITE,
                      border: Border.all(
                          color: ColorResources.APP_THEME_COLOR, width: 1),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(4),
                          topLeft: Radius.circular(4)),
                    ),
                    child: InkWell(
                      child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              '${Languages.of(context)!.fromPlace}',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: _placeCurrentIndex == 0
                                    ? ColorResources.WHITE
                                    : ColorResources.BLACK,
                              ),
                            ),
                          )),
                      onTap: () {
                        setState(() {
                          _placeCurrentIndex = 0;
                        });
                      },
                    ),
                  ),
                  flex: 1,
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      color: _placeCurrentIndex == 1
                          ? ColorResources.APP_THEME_COLOR
                          : ColorResources.WHITE,
                      border: Border.all(
                          color: ColorResources.APP_THEME_COLOR, width: 1),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(4),
                          topLeft: Radius.circular(4)),
                    ),
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '${Languages.of(context)!.toPlace}',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: _placeCurrentIndex == 1
                                    ? ColorResources.WHITE
                                    : ColorResources.BLACK,
                              ),
                            )),
                      ),
                      onTap: () {
                        setState(() {
                          _placeCurrentIndex = 1;
                        });
                      },
                    ),
                  ),
                  flex: 1,
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 240,
              child: _placeWidget[_placeCurrentIndex],
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text('${Languages.of(context)!.visitReason}',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: ColorResources.GREY_NINETY)),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: WhiteTextField(
                controller: reasonController,
                hint: '',
                maxLines: 2,
                onChanged: (value) {
                  reason = value;
                },
                isNumeric: false,
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text('${Languages.of(context)!.transportType}',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: ColorResources.GREY_NINETY)),
                )),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Container(
                child: WhiteTextField(
                  controller: transportController,
                  hint: '',
                  usernameField: true,
                  onChanged: (value) {
                    transportBy = value;
                  },
                  isNumeric: false,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ), //1
      Container(
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text(
                    Languages.of(context)!.transportFare,
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: ColorResources.GREY_NINETY),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Container(
                child: WhiteTextField(
                  controller: transportFaireController,
                  // label: '',
                  usernameField: true,
                  onChanged: (value) {
                    transportBy = value;
                  },
                  isNumeric: true,
                  hint: '',
                ),
              ),
            ),
            gradeID > 105
                ? Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: Text(
                              Languages.of(context)!.morning,
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  color: ColorResources.GREY_NINETY),
                            ),
                          )),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: bloc.morningDropDownList.length > 0
                                ? Visibility(
                                    visible: true,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: DropdownButtonFormField<
                                          PlaceWithPrice>(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor:
                                              ColorResources.TEXT_FIELD_COLOR,
                                          contentPadding: EdgeInsets.only(
                                              left: 10.0, right: 5.0, top: 16.0, bottom: 16.0),
                                          hintStyle: TextStyle(
                                              color:
                                                  ColorResources.GREY_SEVENTY),
                                          errorStyle: TextStyle(
                                              color: Colors.redAccent,
                                              fontSize: 13.0),
                                          hintText: 'Select Place',
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: ColorResources.GREY_FOURTY,
                                              // Change this to the desired focused border color
                                              width: 1,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: ColorResources.GREY_FOURTY,
                                              // Border color when not focused
                                              width: 1,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: ColorResources.GREY_FOURTY,
                                              // Change this to the desired enabled border color
                                              width: 1,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                              // Change this to the desired error border color
                                              width: 2,
                                            ),
                                          ),
                                        ),

                                        value:
                                            _currentSelectedValuePlaceMorning,
                                        //isDense: true,
                                        isExpanded: true,
                                        onChanged: (value) {
                                          _currentSelectedValuePlaceMorning =
                                              value!;
                                          morningController.text =
                                              value.price.toString();
                                          morningPlaceID = value.id;
                                          setState(() {});
                                        },
                                        items: bloc.morningDropDownList
                                            .map((PlaceWithPrice item) {
                                          return DropdownMenuItem(
                                            child: Text(
                                              item.name,
                                              style: TextStyle(
                                                  color: Colors.black),
                                              textAlign: TextAlign.left,
                                            ),
                                            value: item,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  )
                                : Container(
                                    child: Text('Test'),
                                  ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                child: WhiteTextField(
                                  controller: morningController,
                                  hint: '',
                                  onChanged: (value) {
                                    transportBy = value;
                                  },
                                  isNumeric: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: Text(
                              Languages.of(context)!.afternoon,
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  color: ColorResources.GREY_NINETY),
                            ),
                          )),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: bloc.lunchNDinnerDropDownList.length > 0
                                ? Visibility(
                                    visible: true,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: DropdownButtonFormField<
                                          PlaceWithPrice>(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor:
                                              ColorResources.TEXT_FIELD_COLOR,
                                          contentPadding: EdgeInsets.only(
                                              left: 10.0, right: 5.0, top: 16.0, bottom: 16.0),
                                          hintStyle: TextStyle(
                                              color:
                                                  ColorResources.GREY_SEVENTY),
                                          errorStyle: TextStyle(
                                              color: Colors.redAccent,
                                              fontSize: 13.0),
                                          hintText: 'Select Place',
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: ColorResources.GREY_FOURTY,
                                              // Change this to the desired focused border color
                                              width: 1,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: ColorResources.GREY_FOURTY,
                                              // Border color when not focused
                                              width: 1,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: ColorResources.GREY_FOURTY,
                                              // Change this to the desired enabled border color
                                              width: 1,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                              // Change this to the desired error border color
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                        value:
                                            _currentSelectedValuePlaceEvening,
                                        //isDense: true,
                                        isExpanded: true,
                                        onChanged: (value) {
                                          _currentSelectedValuePlaceEvening =
                                              value!;
                                          afternoonController.text =
                                              value.price.toString();
                                          eveningPlaceID = value.id;
                                          setState(() {});
                                          //state.didChange(newValue);
                                        },
                                        items: bloc.lunchNDinnerDropDownList
                                            .map((PlaceWithPrice item) {
                                          return DropdownMenuItem(
                                            child: Text(
                                              item.name,
                                              style: TextStyle(
                                                  color: Colors.black),
                                              textAlign: TextAlign.left,
                                            ),
                                            value: item,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  )
                                : Container(
                                    child: Text('Test'),
                                  ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: Container(
                                child: WhiteTextField(
                                  controller: afternoonController,
                                  hint: '',
                                  isNumeric: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: Text(Languages.of(context)!.night,
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: ColorResources.GREY_NINETY)),
                          )),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: bloc.lunchNDinnerDropDownList.length > 0
                                ? Visibility(
                                    visible: true,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: DropdownButtonFormField<
                                          PlaceWithPrice>(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor:
                                              ColorResources.TEXT_FIELD_COLOR,
                                          contentPadding: EdgeInsets.only(
                                              left: 10.0, right: 5.0, top: 16.0, bottom: 16.0),
                                          hintStyle: TextStyle(
                                              color:
                                                  ColorResources.GREY_SEVENTY),
                                          errorStyle: TextStyle(
                                              color: Colors.redAccent,
                                              fontSize: 13.0),
                                          hintText: 'Select Place',
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: ColorResources.GREY_FOURTY,
                                              // Change this to the desired focused border color
                                              width: 1,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: ColorResources.GREY_FOURTY,
                                              // Border color when not focused
                                              width: 1,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: ColorResources.GREY_FOURTY,
                                              // Change this to the desired enabled border color
                                              width: 1,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                              // Change this to the desired error border color
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                        value: _currentSelectedValuePlaceNight,
                                        //isDense: true,
                                        isExpanded: true,
                                        onChanged: (value) {
                                          _currentSelectedValuePlaceNight =
                                              value!;
                                          nightController.text =
                                              value.price.toString();
                                          nightPlaceID = value.id;
                                          setState(() {});
                                        },
                                        items: bloc.lunchNDinnerDropDownList
                                            .map((PlaceWithPrice item) {
                                          return DropdownMenuItem(
                                            child: Text(
                                              item.name,
                                              style: TextStyle(
                                                  color: Colors.black),
                                              textAlign: TextAlign.left,
                                            ),
                                            value: item,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  )
                                : Container(
                                    child: Text('Test'),
                                  ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: Container(
                                child: WhiteTextField(
                                  controller: nightController,
                                  hint: '',
                                  isNumeric: true,
                                  onChanged: (value) {
                                    transportBy = value;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: Text(Languages.of(context)!.hotel,
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: ColorResources.GREY_NINETY)),
                          )),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: bloc.residenceDropDownList.length > 0
                                ? Visibility(
                                    visible: true,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: DropdownButtonFormField<
                                          PlaceWithPrice>(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor:
                                              ColorResources.TEXT_FIELD_COLOR,
                                          contentPadding: EdgeInsets.only(
                                              left: 10.0, right: 5.0, top: 16.0, bottom: 16.0),
                                          hintStyle: TextStyle(
                                              color:
                                                  ColorResources.GREY_SEVENTY),
                                          errorStyle: TextStyle(
                                              color: Colors.redAccent,
                                              fontSize: 13.0),
                                          hintText: 'Select Place',
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: ColorResources.GREY_FOURTY,
                                              // Change this to the desired focused border color
                                              width: 1,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: ColorResources.GREY_FOURTY,
                                              // Border color when not focused
                                              width: 1,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: ColorResources.GREY_FOURTY,
                                              // Change this to the desired enabled border color
                                              width: 1,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                              // Change this to the desired error border color
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                        value:
                                            _currentSelectedValuePlaceResidence,
                                        //isDense: true,
                                        isExpanded: true,
                                        onChanged: (value) {
                                          _currentSelectedValuePlaceResidence =
                                              value!;
                                          hotelController.text =
                                              value.price.toString();
                                          hotelPlaceID = value.id;
                                          setState(() {});
                                        },
                                        items: bloc.residenceDropDownList
                                            .map((PlaceWithPrice item) {
                                          return DropdownMenuItem(
                                            child: Text(
                                              item.name,
                                              style: TextStyle(
                                                  color: Colors.black),
                                              textAlign: TextAlign.left,
                                            ),
                                            value: item,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  )
                                : Container(
                                    child: Text('Test'),
                                  ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: Container(
                                child: WhiteTextField(
                                  controller: hotelController,
                                  hint: '',
                                  isNumeric: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: Text(
                              Languages.of(context)!.morning,
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  color: ColorResources.GREY_NINETY),
                            ),
                          )),
                      Visibility(
                        visible: true,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            child: WhiteTextField(
                              controller: morningController,
                              hint: '',
                              onChanged: (value) {
                                transportBy = value;
                              },
                              isNumeric: true,
                            ),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: Text(
                              Languages.of(context)!.afternoon,
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  color: ColorResources.GREY_NINETY),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: Container(
                          child: WhiteTextField(
                            controller: afternoonController,
                            hint: '',
                            isNumeric: true,
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: Text(Languages.of(context)!.night,
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: ColorResources.GREY_NINETY)),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: Container(
                          child: WhiteTextField(
                            controller: nightController,
                            hint: '',
                            isNumeric: true,
                            onChanged: (value) {
                              transportBy = value;
                            },
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: Text(Languages.of(context)!.hotel,
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: ColorResources.GREY_NINETY)),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: Container(
                          child: WhiteTextField(
                            controller: hotelController,
                            hint: '',
                            isNumeric: true,
                          ),
                        ),
                      ),
                    ],
                  ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(Languages.of(context)!.dailyAllowance,
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: ColorResources.GREY_NINETY)),
                )),
            Row(
              children: [
                Flexible(
                    flex: 1,
                    child: Container(
                      child: Checkbox(
                          value: _dailyAllowanceCheckBox,
                          onChanged: (value) {
                            setState(() {
                              _dailyAllowanceCheckBox = value!;
                            });
                            if (value == true) {
                              dailyAllowanceISChecked = 1;

                              dailyAllowanceController.text = bloc
                                  .dailyNSpecialBill[0].dailyAllowance
                                  .toString();
                            } else {
                              dailyAllowanceISChecked = 0;
                              dailyAllowanceController.text = '';
                            }
                          }),
                    )),
                Flexible(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Container(
                      child: WhiteTextField(
                        controller: dailyAllowanceController,
                        hint: '',
                        isNumeric: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(Languages.of(context)!.specialAllowance,
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: ColorResources.GREY_NINETY)),
                )),
            Row(
              children: [
                Flexible(
                    flex: 1,
                    child: Container(
                      child: Checkbox(
                          value: _specialAllowanceCheckBox,
                          onChanged: (value) {
                            setState(() {
                              _specialAllowanceCheckBox = value!;
                            });
                            if (value == true) {
                              specialAllowanceISChecked = 1;
                              specialAllowanceController.text = bloc
                                  .dailyNSpecialBill[0].specialAllowance
                                  .toString();
                            } else {
                              specialAllowanceISChecked = 0;
                              specialAllowanceController.text = '';
                            }
                          }),
                    )),
                Flexible(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Container(
                      child: WhiteTextField(
                        controller: specialAllowanceController,
                        hint: '',
                        isNumeric: true,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      )
    ];

    // With plan ID
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.APP_THEME_COLOR,
        iconTheme: IconThemeData(color: ColorResources.WHITE),
        title: Center(
          child: Text(
            '${Languages.of(context)!.apply}',
            style: Styles.appBarTextStyle,
          ),
        ),
      ),
      body: BlocConsumer<ApplyCubit, ApplyState>(
        listener: (context, state) {
          if (state is ApplyErrorState) {
            final snackBar = SnackBar(
              content: Text(Languages.of(context)!.internetErrorText),
              backgroundColor: Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          // print('Apply Page State ${state}');
          if (state is ApplyInitialState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ApplyLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ApplyLoadedState) {
            var approvedList = state.approvedPlan.data;
            return approvedList.isNotEmpty
                ? Builder(
                    builder: (context) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 25, right: 25, top: 25, bottom: 10),
                            child: Container(
                              height: 56,
                              decoration: BoxDecoration(
                                color: ColorResources.WHITE,
                                border: Border.all(
                                    color: ColorResources.LIST_BORDER_WHITE,
                                    width: 1),
                                borderRadius: BorderRadius.all(Radius.circular(
                                  10,
                                )),
                              ),
                              child: Row(
                                children: [
                                  Flexible(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          _currentIndex = 0;
                                          setState(() {});
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: _currentIndex == 0
                                                  ? ColorResources
                                                      .APP_THEME_COLOR
                                                  : ColorResources.WHITE,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                10,
                                              )),
                                            ),
                                            child: Center(
                                              child: Text(
                                                Languages.of(context)!
                                                    .applyInfo,
                                                style: _currentIndex == 0
                                                    ? Styles.activeTextColor
                                                    : Styles.inactiveTextColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                  Flexible(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          _currentIndex = 1;
                                          setState(() {});
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Container(
                                            height: 40,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: _currentIndex == 1
                                                  ? ColorResources
                                                      .APP_THEME_COLOR
                                                  : ColorResources.WHITE,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                10,
                                              )),
                                            ),
                                            child: Center(
                                                child: Text(
                                              Languages.of(context)!.billInfo,
                                              style: _currentIndex == 1
                                                  ? Styles.activeTextColor
                                                  : Styles.inactiveTextColor,
                                            )),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24, right: 24, top: 5, bottom: 15),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: _children[_currentIndex],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      // Bill Info Start
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, bottom: 20),
                            child: Container(
                              width: double.infinity,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 56,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0, backgroundColor: ColorResources.APP_THEME_COLOR,
                                        minimumSize:
                                            const Size.fromHeight(50), // NEW
                                      ),
                                      onPressed: () {
                                        if (widget.arguments == null) {
                                          // When added a new field visit Item
                                          print(
                                              'Start Time ${startTimeController.text}');
                                          if (startDateController.text
                                                  .toString()
                                                  .isEmpty ||
                                              endDateController.text
                                                  .toString()
                                                  .isEmpty) {
                                            print('Log  condition 56');
                                            CommonMethods.showMessage(
                                                context,
                                                Languages.of(context)!
                                                    .startEndDateValidationText,
                                                Colors.red);
                                          } else if (startDate!
                                              .isAfter(endDate!)) {
                                            CommonMethods.showMessage(
                                                context,
                                                Languages.of(context)!
                                                    .dateRangeValidationText,
                                                Colors.red);
                                          } else if (startTimeController
                                              .text.isEmpty) {
                                            CommonMethods.showMessage(
                                                context,
                                                Languages.of(context)!
                                                    .startEndTimeValidationText,
                                                Colors.red);
                                          } else if (startDate!
                                                  .isAtSameMomentAs(endDate!) &&
                                              endTimeController
                                                  .text.isNotEmpty &&
                                              (startTime == endTime)) {
                                            print('Same Date ');
                                            CommonMethods.showMessage(
                                                context,
                                                Languages.of(context)!
                                                    .sameTimeValidation,
                                                Colors.red);
                                          } else if (fromBranchController
                                                  .text.isEmpty &&
                                              fromOtherController
                                                  .text.isEmpty) {
                                            CommonMethods.showMessage(
                                                context,
                                                Languages.of(context)!
                                                    .fromPlaceToPlaceValidationText,
                                                Colors.red);
                                          } else if (toBranchController
                                                  .text.isEmpty &&
                                              toOtherController.text.isEmpty) {
                                            CommonMethods.showMessage(
                                                context,
                                                Languages.of(context)!
                                                    .fromPlaceToPlaceValidationText,
                                                Colors.red);
                                          } else if (reasonController
                                              .text.isEmpty) {
                                            CommonMethods.showMessage(
                                                context,
                                                Languages.of(context)!
                                                    .reasonValidationText,
                                                Colors.red);
                                          } else if (transportController
                                              .text.isEmpty) {
                                            CommonMethods.showMessage(
                                                context,
                                                Languages.of(context)!
                                                    .transportValidationText,
                                                Colors.red);
                                          } else {
                                            var startDateSubString = startDate
                                                .toString()
                                                .substring(0, 10);
                                            var endDateSubString = endDate
                                                .toString()
                                                .substring(0, 10);

                                            var rng = new Random();

                                            var item = ApplyRequest(
                                                rng.nextInt(1000),
                                                startDateSubString,
                                                startTimeController.text,
                                                endDateSubString,
                                                endTimeController.text,
                                                fromBranchController.text,
                                                fromOtherController.text,
                                                toBranchController.text,
                                                toOtherController.text,
                                                reasonController.text,
                                                transportController.text.isEmpty
                                                    ? ''
                                                    : transportController.text,
                                                transportFaireController
                                                        .text.isEmpty
                                                    ? ''
                                                    : transportFaireController
                                                        .text,
                                                morningController.text.isEmpty
                                                    ? ''
                                                    : morningController.text,
                                                afternoonController.text.isEmpty
                                                    ? ''
                                                    : afternoonController.text,
                                                nightController.text.isEmpty
                                                    ? ''
                                                    : nightController.text,
                                                hotelController.text.isEmpty
                                                    ? ''
                                                    : hotelController.text,
                                                dailyAllowanceController
                                                        .text.isEmpty
                                                    ? ''
                                                    : dailyAllowanceController
                                                        .text,
                                                specialAllowanceController
                                                        .text.isEmpty
                                                    ? ''
                                                    : specialAllowanceController
                                                        .text,
                                                planId,
                                                planName,
                                                morningPlaceID,
                                                eveningPlaceID,
                                                nightPlaceID,
                                                hotelPlaceID,
                                                dailyAllowanceISChecked,
                                                specialAllowanceISChecked);

                                            print(
                                                'Plan ID When Submit ${planId}');
                                            addApplyItem(item)
                                                .whenComplete(() => {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ApplyList()))
                                                    });
                                          }
                                        } else {
                                          // when update a field visit Item
                                          var startDateFormat;
                                          var endDateFormat;

                                          if ((startDateController
                                                  .text.isNotEmpty &&
                                              endDateController
                                                  .text.isNotEmpty)) {
                                            startDateFormat = DateTime.parse(
                                                '${startDateController.text}T00:00:00');
                                            endDateFormat = DateTime.parse(
                                                '${endDateController.text}T00:00:00');
                                          }

                                          if (startDateController.text
                                                  .toString()
                                                  .isEmpty ||
                                              endDateController.text
                                                  .toString()
                                                  .isEmpty) {
                                            CommonMethods.showMessage(
                                                context,
                                                '${Languages.of(context)!.startEndDateValidationText}',
                                                Colors.red);
                                          } else if ((startDateController
                                                      .text.isNotEmpty &&
                                                  endDateController
                                                      .text.isNotEmpty) &&
                                              startDateFormat
                                                  .isAfter(endDateFormat)) {
                                            CommonMethods.showMessage(
                                                context,
                                                '${Languages.of(context)!.dateRangeValidationText}',
                                                Colors.red);
                                          } else if (startTimeController
                                              .text.isEmpty) {
                                            CommonMethods.showMessage(
                                                context,
                                                Languages.of(context)!
                                                    .startEndTimeValidationText,
                                                Colors.red);
                                          } else if (fromBranchController
                                                  .text.isEmpty &&
                                              fromOtherController
                                                  .text.isEmpty) {
                                            CommonMethods.showMessage(
                                                context,
                                                Languages.of(context)!
                                                    .fromPlaceToPlaceValidationText,
                                                Colors.red);
                                          } else if (toBranchController
                                                  .text.isEmpty &&
                                              toOtherController.text.isEmpty) {
                                            CommonMethods.showMessage(
                                                context,
                                                Languages.of(context)!
                                                    .fromPlaceToPlaceValidationText,
                                                Colors.red);
                                          } else if (reasonController
                                              .text.isEmpty) {
                                            CommonMethods.showMessage(
                                                context,
                                                Languages.of(context)!
                                                    .reasonValidationText,
                                                Colors.red);
                                          } else {
                                            var startDateSubString =
                                                startDateController.text
                                                    .toString()
                                                    .substring(0, 10);
                                            var endDateSubString =
                                                endDateController.text
                                                    .toString()
                                                    .substring(0, 10);
                                            var startTimeSubstring =
                                                startTimeController.text
                                                    .toString()
                                                    .substring(0, 5);
                                            var endTimeSubString = '';
                                            if (endTimeController
                                                .text.isNotEmpty) {
                                              endTimeSubString =
                                                  endTimeController.text
                                                      .toString()
                                                      .substring(0, 5);
                                            } else {
                                              endTimeSubString = '';
                                            }

                                            updateApplyItem(
                                                    widget.arguments!.id,
                                                    startDateSubString,
                                                    startTimeController.text,
                                                    endDateSubString,
                                                    endTimeController.text,
                                                    fromBranchController.text,
                                                    fromOtherController.text,
                                                    toBranchController.text,
                                                    toOtherController.text,
                                                    reasonController.text,
                                                    transportController
                                                            .text.isEmpty
                                                        ? ''
                                                        : transportController
                                                            .text,
                                                    transportFaireController
                                                            .text.isEmpty
                                                        ? ''
                                                        : transportFaireController
                                                            .text,
                                                    morningController
                                                            .text.isEmpty
                                                        ? ''
                                                        : morningController
                                                            .text,
                                                    afternoonController
                                                            .text.isEmpty
                                                        ? ''
                                                        : afternoonController
                                                            .text,
                                                    nightController.text.isEmpty
                                                        ? ''
                                                        : nightController.text,
                                                    hotelController.text.isEmpty
                                                        ? ''
                                                        : hotelController.text,
                                                    dailyAllowanceController
                                                            .text.isEmpty
                                                        ? ''
                                                        : dailyAllowanceController
                                                            .text,
                                                    specialAllowanceController
                                                            .text.isEmpty
                                                        ? ''
                                                        : specialAllowanceController
                                                            .text,
                                                    planId,
                                                    planName,
                                                    morningPlaceID,
                                                    eveningPlaceID,
                                                    nightPlaceID,
                                                    hotelPlaceID,
                                                    dailyAllowanceISChecked,
                                                    specialAllowanceISChecked)
                                                .whenComplete(() => {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ApplyList()))
                                                    });
                                          }
                                        }
                                      },
                                      child: Container(
                                          height: 56,
                                          child: Center(
                                              child: Text(
                                            Languages.of(context)!.saveButton,
                                            style: Styles.buttonTextStyle,
                                          )))),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  )
                : Center(
                    child: Text(Languages.of(context)!.noDataFound),
                  );
          } else {
            return Center(
              child: Container(
                child: Text(Languages.of(context)!.networkError),
              ),
            );
          }
        },
      ),
    );
  }

  Future<void> updateApplyItem(
    int id,
    String startDate,
    String startTime,
    String endDate,
    String endTime,
    String fromBranch,
    String fromOther,
    String toBranch,
    String toOther,
    String reason,
    String transport,
    String transportFare,
    String morning,
    String afternoon,
    String night,
    String hotel,
    String dailyAllowance,
    String specialAllowance,
    int planId,
    String planName,
    int morningPlaceId,
    int eveningPlaceID,
    int nightPlaceID,
    int hotelPlaceID,
    int dailyAllowanceIsCheck,
    int specialAllowanceIsCheck,
  ) async {
   /* this.handler.initializeDB().whenComplete(() async => {

        });*/

    await this.handler.updateItem(
      id,
      startDate,
      startTime,
      endDate,
      endTime,
      fromBranch,
      fromOther,
      toBranch,
      toOther,
      reason,
      transport,
      transportFare,
      morning,
      afternoon,
      night,
      hotel,
      dailyAllowance,
      specialAllowance,
      planId,
      planName,
      morningPlaceId,
      eveningPlaceID,
      nightPlaceID,
      hotelPlaceID,
      dailyAllowanceIsCheck,
      specialAllowanceIsCheck,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    analytics.setCurrentScreen('Field Visit Bill Apply', 'Stateful widget');
    print('Apply Page didChangeDependencies Called');

    if (widget.arguments != null) {
      var item = widget.arguments;

      print(' start Time ${item!.startTime} end Time ${item.endTime}');
      startDateController.text = item.startDate;
      startTimeController.text = item.startTime;
      endDateController.text = item.endDate;
      endTimeController.text = item.endTime;
      /*  startFormController.text = item.startForm;
      endFormController.text = item.endForm;*/
      fromBranchController.text = item.fromBranch;
      fromOtherController.text = item.fromOther;
      toBranchController.text = item.toBranch;
      toOtherController.text = item.toOther;
      reasonController.text = item.reason;
      transportController.text = item.transport;

      transportFaireController.text = item.transportFare;
      morningController.text = item.morning;
      afternoonController.text = item.afternoon;
      nightController.text = item.night;
      hotelController.text = item.hotel;
      dailyAllowanceController.text = item.dailyAllowance;
      specialAllowanceController.text = item.specialAllowance;

      print(
          'Morning Place ID ${item.morningPlaceId} ${bloc.morningDropDownList.length}');
      //_currentSelectedValuePlaceMorning = item.planName;

      bloc.morningDropDownList.length > 0 && item.morningPlaceId != 0
          ? _currentSelectedValuePlaceMorning =
              bloc.morningDropDownList[item.morningPlaceId - 1]
          : null;

      bloc.lunchNDinnerDropDownList.length > 0 && item.eveningPlaceID != 0
          ? _currentSelectedValuePlaceEvening =
              bloc.lunchNDinnerDropDownList[item.eveningPlaceID - 1]
          : null;

      bloc.lunchNDinnerDropDownList.length > 0 && item.nightPlaceID != 0
          ? _currentSelectedValuePlaceNight =
              bloc.lunchNDinnerDropDownList[item.nightPlaceID - 1]
          : null;

      bloc.residenceDropDownList.length > 0 && item.hotelPlaceID != 0
          ? _currentSelectedValuePlaceResidence =
              bloc.residenceDropDownList[item.hotelPlaceID - 1]
          : null;

      morningPlaceID = item.morningPlaceId;
      eveningPlaceID = item.eveningPlaceID;
      nightPlaceID = item.nightPlaceID;
      hotelPlaceID = item.hotelPlaceID;

      dailyAllowanceISChecked = item.dailyAllowanceIsCheck;
      specialAllowanceISChecked = item.specialAllowanceIsCheck;

      _dailyAllowanceCheckBox = item.dailyAllowanceIsCheck == 1 ? true : false;
      _specialAllowanceCheckBox =
          item.specialAllowanceIsCheck == 1 ? true : false;

      print("Plan Id ${widget.arguments!.planId}");
    }
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.green;
  }
}

class NameIDModel {
  late String name;
  late int id;

  NameIDModel({required String name, required int id}) {
    this.name = name;
    this.id = id;
  }
}
