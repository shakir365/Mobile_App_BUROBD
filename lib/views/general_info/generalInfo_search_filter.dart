import 'package:buro_employee/repository/models/employee_general_info.dart';
import 'package:buro_employee/views/general_info/employee_general_info_list.dart';
import 'package:flutter/material.dart';

import '../../bloc/branch_list/branch_list_cubit.dart';
import '../../localization/Language/languages.dart';
import '../../repository/bloc/designation_list/designation_list_cubit.dart';
import '../../repository/bloc/liability_list/liability_list_cubit.dart';
import '../../repository/models/annual_appraisal.dart';
import '../../repository/models/branch.dart';
import '../../theme/colors.dart';
import '../../theme/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class GeneralInfoSearchFilter extends StatefulWidget {
  static const routeName = '/generalInfoSearchFilter';

  static route() =>
      MaterialPageRoute(builder: (_) => GeneralInfoSearchFilter());

  GeneralInfoSearchFilter({Key? key}) : super(key: key);

  @override
  State<GeneralInfoSearchFilter> createState() =>
      _GeneralInfoSearchFilterState();
}

class _GeneralInfoSearchFilterState extends State<GeneralInfoSearchFilter> {
  var designationList = [];
  late DesignationListCubit designationListCubit;
  late LiabilityListCubit liabilityListCubit;
  late BranchListCubit branchListCubit;
  late DesignationData selectedDesignation;
  late DepartmentData selectedDepartment;
  late DivisionData selectedDivision;
  late AreaListData selectedArea;
  late RecomListData selectRecom;

  //late DesignationData firstDesignation ;
  late GradeData selectGrade;
  late ZoneData selectedZone;

  late GradeData selectedGrade;
  late FiscalYearData selectFiscalYear;
  late LiabilityData selectedLiability;

  String selectedStatus = 'Regular';
  String selectedBloodGroup = 'Select';
  late BranchData selectedBranch;

  /*  <asp:ListItem Selected="True" Value="0">All</asp:ListItem>
  <asp:ListItem Value="A+">A+</asp:ListItem>
  <asp:ListItem Value="A-">A-</asp:ListItem>
  <asp:ListItem Value="AB+">AB+</asp:ListItem>
  <asp:ListItem Value="AB-">AB-</asp:ListItem>
  <asp:ListItem Value="B+">B+</asp:ListItem>
  <asp:ListItem Value="B-">B-</asp:ListItem>
  <asp:ListItem Value="O+">O+</asp:ListItem>
  <asp:ListItem Value="O-">O-</asp:ListItem>*/

  var bloodGroupList = [
    'Select', // All
    'A+',
    'A-',
    'AB+',
    'AB-',
    'B+',
    'B-',
    'O+',
    'O-'
  ];
  int selectDesignationId = 0;
  int selectZoneId = 0;
  int selectStatusId = 0;
  int selectGradeId = 0;
  int selectLiabilityId = 0;
  int selectBranchId = 0;
  int selectFiscalYearId = 0;
  int selectDepartmentId = 0;

  int selectDivisionId = 0;
  int selectAreaId = 0;
  int selectRecomId = 0;
  int selectRecomCount = 0;
  bool filterDataLoad = false;
  var _mobileNumberController = TextEditingController();
  var _searchControllerBranchCode = TextEditingController();
  var _employeeName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorResources.APP_THEME_COLOR,
            iconTheme: IconThemeData(color: ColorResources.WHITE),
            title: Center(
              child: Text(
                Languages.of(context)!.apaSearchFilter,
                style: Styles.appBarTextStyle,
              ),
            ),
          ),
          body: BlocConsumer<BranchListCubit, BranchListState>(
            listener: (context, state) {
              if (state is BranchListErrorState) {
                final snackBar = SnackBar(
                  content: Text(Languages.of(context)!.internetErrorText),
                  backgroundColor: Colors.red,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              if (state is BranchListInitialState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is BranchListLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is BranchListLoadedState) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    onTap: () {},
                                    controller: _employeeName,
                                    enableSuggestions: true,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: ColorResources.TEXT_FIELD_COLOR,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: BorderSide(
                                                color: ColorResources
                                                    .APP_THEME_COLOR,
                                                style: BorderStyle.solid,
                                                width: 2)),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: ColorResources
                                                  .TEXT_FIELD_BORDER_COLOR,
                                              width: 0.0),
                                        ),
                                        hintText: '',
                                        hintStyle: Styles.hintTextStyle,
                                        contentPadding: EdgeInsets.all(20),
                                        labelText: 'Employee Name'),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    Languages.of(context)!.branch,
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: ColorResources.GREY_NINETY,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 60,
                                    child: DropdownButtonFormField<BranchData>(
                                      isExpanded: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor:
                                            ColorResources.TEXT_FIELD_COLOR,
                                        contentPadding: EdgeInsets.only(
                                            left: 10.0,
                                            right: 5.0,
                                            top: 16.0,
                                            bottom: 16.0),
                                        hintStyle: TextStyle(
                                            color: ColorResources.GREY_SEVENTY),
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
                                      hint: Text('Select'),
                                      onChanged: (BranchData? value) {
                                        branchListCubit.selectBranch = value!;
                                        selectBranchId = value.branchID!;

                                        setState(() {
                                          selectedBranch = value;
                                        });
                                      },
                                      items: branchListCubit.branchList != null
                                          ? branchListCubit.branchList
                                              .map((item) {
                                              return DropdownMenuItem<
                                                  BranchData>(
                                                child: Text(
                                                    item.branchName.toString()),
                                                value: item,
                                              );
                                            }).toList()
                                          : null,
                                      value: branchListCubit.selectBranch,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    Languages.of(context)!.designation,
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: ColorResources.GREY_NINETY,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 60,
                                    child: DropdownButtonFormField<
                                        DesignationData>(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor:
                                            ColorResources.TEXT_FIELD_COLOR,
                                        contentPadding: EdgeInsets.only(
                                            left: 10.0,
                                            right: 5.0,
                                            top: 16.0,
                                            bottom: 16.0),
                                        hintStyle: TextStyle(
                                            color: ColorResources.GREY_SEVENTY),
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
                                      isExpanded: true,
                                      hint: Text('Select Designation'),
                                      onChanged: (DesignationData? value) {
                                        designationListCubit.selectDesignation =
                                            value!;
                                        setState(() {
                                          selectedDesignation = value;
                                        });
                                        selectDesignationId = value.id!;
                                      },
                                      items: designationListCubit
                                                  .designationList !=
                                              null
                                          ? designationListCubit.designationList
                                              .map((item) {
                                              return DropdownMenuItem<
                                                  DesignationData>(
                                                child: Text(item.dasignationName
                                                    .toString()),
                                                value: item,
                                              );
                                            }).toList()
                                          : null,
                                      value: designationListCubit
                                          .selectDesignation,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Blood group',
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: ColorResources.GREY_NINETY,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 60,
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor:
                                            ColorResources.TEXT_FIELD_COLOR,
                                        contentPadding: EdgeInsets.only(
                                            left: 10.0,
                                            right: 5.0,
                                            top: 16.0,
                                            bottom: 16.0),
                                        hintStyle: TextStyle(
                                            color: ColorResources.GREY_SEVENTY),
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
                                      isExpanded: true,
                                      hint: Text('Select'),
                                      onChanged: (String? value) {
                                        selectedBloodGroup = value!;
                                        // selectRecomCount = int.parse(value);
                                        setState(() {
                                          selectedBloodGroup = value;
                                        });
                                      },
                                      items: bloodGroupList != null
                                          ? bloodGroupList.map((item) {
                                              return DropdownMenuItem<String>(
                                                child: Text(item.toString()),
                                                value: item,
                                              );
                                            }).toList()
                                          : null,
                                      value: selectedBloodGroup,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 50,
                                  )
                                ],
                              ),
                            ),
                          ), // Designation
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
                                  elevation: 0,
                                  backgroundColor:
                                      ColorResources.APP_THEME_COLOR,
                                  minimumSize: const Size.fromHeight(50), // NEW
                                ),
                                onPressed: () {
                                  var bloodGroup = '';
                                  if (selectedBloodGroup != 'Select') {
                                    bloodGroup = selectedBloodGroup;
                                  }

                                  Navigator.pushNamed(context,
                                      EmployeeGeneralInfoList.routeName,
                                      arguments: GeneralInfoSearchFilterModel(
                                          siteID: selectBranchId ?? 0,
                                          designationID: selectDesignationId,
                                          liabilityID: selectLiabilityId,
                                          bloodGroup: bloodGroup,
                                          mobile: _mobileNumberController.text
                                              .trim(),
                                          employeeName:
                                              _employeeName.text.trim()));
                                },
                                child: Container(
                                    height: 56,
                                    child: Center(
                                        child: Text(
                                      Languages.of(context)!.searchButton,
                                      style: Styles.buttonTextStyle,
                                    )))),
                          ),
                        ),
                      ),
                    ),
                  ],
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
          )),
    );
  }

  @override
  void initState() {
    designationListCubit = context.read<DesignationListCubit>();

    liabilityListCubit = context.read<LiabilityListCubit>();
    branchListCubit = context.read<BranchListCubit>();

 print('branchListCubit.selectBranch ${branchListCubit.selectBranch}');

   // branchListCubit.selectBranch = BranchData(branchID:0,branchCode: '00',branchName: 'Select');

    print('BranchListCount  ${branchListCubit.branchList.length}');

    super.initState();
  }

  @override
  void dispose() {
    print('EMPLOYEE Dispose called Filter');
    super.dispose();
  }

  Future<bool> _willPopCallback() async {
    Navigator.pop(context);
    return true;
  }
}
