import 'package:buro_employee/bloc/branch_list/branch_list_cubit.dart';
import 'package:buro_employee/localization/Language/languages.dart';
import 'package:buro_employee/repository/bloc/area_list/area_list_cubit.dart';
import 'package:buro_employee/repository/bloc/department_list/department_list_cubit.dart';
import 'package:buro_employee/repository/bloc/designation_list/designation_list_cubit.dart';
import 'package:buro_employee/repository/bloc/division_list_cubit/division_list_cubit.dart';
import 'package:buro_employee/repository/bloc/fiscal_year_list/fiscal_year_list_cubit.dart';
import 'package:buro_employee/repository/bloc/grade_list/grade_list_cubit.dart';
import 'package:buro_employee/repository/bloc/liability_list/liability_list_cubit.dart';
import 'package:buro_employee/repository/bloc/recommendation_list/recommendation_list_cubit.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:buro_employee/repository/network/buro_repository.dart';
import 'package:buro_employee/theme/colors.dart';
import 'package:buro_employee/theme/styles.dart';
import 'package:buro_employee/views/annual_appraisal/annual_appraisal_main.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/bloc/zone_list/zone_list_cubit.dart';
import 'package:buro_employee/repository/models/branch.dart';
import 'package:intl/intl.dart';

class EmployeeSearchFilter extends StatefulWidget {
  static const routeName = '/employeeSearchFilter';



  const EmployeeSearchFilter({Key? key}) : super(key: key);

  @override
  _EmployeeSearchFilterState createState() => _EmployeeSearchFilterState();
}

class _EmployeeSearchFilterState extends State<EmployeeSearchFilter> {
  var repo = BuroRepository();

  var designationList = [];
  late DesignationListCubit designationListCubit;
  late ZoneListCubit zoneListCubit;
  late GradeListCubit gradeListCubit;
  late LiabilityListCubit liabilityListCubit;
  late BranchListCubit branchListCubit;
  late FiscalYearListCubit fiscalYearListCubit;
  late DivisionListCubit divisionListCubit;
  late AreaListCubit areaListCubit;
  late RecommendationListCubit recommendationListCubit;
  late DepartmentListCubit departmentListCubit;

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
  String selectedRecomCount = 'Select';
  late BranchData selectedBranch;
  var statusList = ['Regular', 'Suspended'];
  var recomCountList = [
    'Select', // All
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
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

  @override
  void initState() {
    designationListCubit = context.read<DesignationListCubit>();
    zoneListCubit = context.read<ZoneListCubit>();
    gradeListCubit = context.read<GradeListCubit>();
    liabilityListCubit = context.read<LiabilityListCubit>();
    branchListCubit = context.read<BranchListCubit>();
    fiscalYearListCubit = context.read<FiscalYearListCubit>();
    departmentListCubit = context.read<DepartmentListCubit>();
    divisionListCubit = context.read<DivisionListCubit>();
    areaListCubit = context.read<AreaListCubit>();
    recommendationListCubit = context.read<RecommendationListCubit>();
   /* designationListCubit.getDesignationList();
      zoneListCubit.getZoneList();
      gradeListCubit.getGradeList();
      liabilityListCubit.getLiabilityList();
      branchListCubit.getBranchList();
      fiscalYearListCubit.getFiscalYear();
      departmentListCubit.getDepartmentList();
      divisionListCubit.getDivisionList();
      areaListCubit.getAreaList();
      recommendationListCubit.getRecommendationList();
      filterDataLoad = true;*/

    /*designationListCubit.getDesignationList();
    zoneListCubit.getZoneList();
    gradeListCubit.getGradeList();
    liabilityListCubit.getLiabilityList();
    branchListCubit.getBranchList();
    fiscalYearListCubit.getFiscalYear();
    departmentListCubit.getDepartmentList();
    divisionListCubit.getDivisionList();
    areaListCubit.getAreaList();
    recommendationListCubit.getRecommendationList();*/

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print('Build state called');

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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 2,
                              ),
                            ],
                          ),
                          Container(
                            height: 5,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: ColorResources.GREY_THIRTY,
                                  width: 1.0,
                                ),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  ColorResources.GREY_THIRTY,
                                  ColorResources.GREY_TWENTY,
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BlocConsumer<DesignationListCubit,
                                      DesignationListState>(
                                    listener: (context, state) {
                                      if (state is DesignationListErrorState) {
                                        final snackBar = SnackBar(
                                          content: Text(Languages.of(context)!
                                              .internetErrorText),
                                          backgroundColor: Colors.red,
                                        );

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    },
                                    buildWhen: (previous, current) =>
                                        previous != current,
                                    builder: (context, state) {
                                      //print('Home page State ${state}');

                                      if (state
                                          is DesignationListInitialState) {
                                        return Center(child: SizedBox());
                                      } else if (state
                                          is DesignationListLoadingState) {
                                        return Center(child: SizedBox());
                                      } else if (state
                                          is DesignationListLoadedState) {
                                        List<DesignationData> designationList =
                                            state.designation;
                                        selectedDesignation =
                                            designationList.first;
                                        print(
                                            'selectedDesignation ${selectedDesignation.dasignationName}');
                                        return designationList.isNotEmpty
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    Languages.of(context)!.designation,
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14,
                                                      color: ColorResources
                                                          .GREY_NINETY,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    height: 60,
                                                    child:
                                                        DropdownButtonFormField<
                                                            DesignationData>(
                                                      decoration: InputDecoration(
                                                        filled: true,
                                                        fillColor: ColorResources
                                                            .TEXT_FIELD_COLOR,
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10.0,
                                                                right: 5.0,
                                                                top: 16.0,
                                                                bottom: 16.0),
                                                        hintStyle: TextStyle(
                                                            color: ColorResources
                                                                .GREY_SEVENTY),
                                                        errorStyle: TextStyle(
                                                            color: Colors
                                                                .redAccent,
                                                            fontSize: 13.0),
                                                        hintText:
                                                            'Select Place',
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Change this to the desired focused border color
                                                            width: 1,
                                                          ),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Border color when not focused
                                                            width: 1,
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Change this to the desired enabled border color
                                                            width: 1,
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.red,
                                                            // Change this to the desired error border color
                                                            width: 2,
                                                          ),
                                                        ),
                                                      ),
                                                      isExpanded: true,
                                                      hint: Text(
                                                          'Select Designation'),
                                                      onChanged: (DesignationData? value) {
                                                        designationListCubit.selectDesignation = value!;
                                                        setState(() {
                                                          selectedDesignation =
                                                              value;
                                                        });
                                                        selectDesignationId = value.id!;
                                                        },
                                                      items: designationList != null
                                                          ? designationList
                                                              .map((item) {
                                                              return DropdownMenuItem<
                                                                  DesignationData>(
                                                                child: Text(item
                                                                    .dasignationName
                                                                    .toString()),
                                                                value: item,
                                                              );
                                                            }).toList()
                                                          : null,
                                                      value: designationListCubit
                                                          .selectDesignation,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  )
                                                ],
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 60,
                                                    right: 24,
                                                    bottom: 10),
                                                child: SizedBox(),
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
                                  SizedBox(
                                    height: 20,
                                  ),
                                  BlocConsumer<DepartmentListCubit,
                                      DepartmentListState>(
                                    listener: (context, state) {
                                      if (state is DepartmentListErrorState) {
                                        final snackBar = SnackBar(
                                          content: Text(Languages.of(context)!
                                              .internetErrorText),
                                          backgroundColor: Colors.red,
                                        );

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    },
                                    buildWhen: (previous, current) =>
                                        previous != current,
                                    builder: (context, state) {
                                      //print('Home page State ${state}');

                                      if (state is DepartmentListInitialState) {
                                        return Center(child: SizedBox());
                                      } else if (state
                                          is DepartmentListLoadingState) {
                                        return Center(child: SizedBox());
                                      } else if (state
                                          is DepartmentListLoadedState) {
                                        List<DepartmentData> departmentList = state.data;
                                        selectedDepartment = departmentList.first;

                                        return departmentList.isNotEmpty
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    Languages.of(context)!.department,
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14,
                                                      color: ColorResources
                                                          .GREY_NINETY,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    height: 60,
                                                    child:
                                                        DropdownButtonFormField<
                                                            DepartmentData>(
                                                      decoration: InputDecoration(
                                                        filled: true,
                                                        fillColor: ColorResources
                                                            .TEXT_FIELD_COLOR,
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10.0,
                                                                right: 5.0,
                                                                top: 16.0,
                                                                bottom: 16.0),
                                                        hintStyle: TextStyle(
                                                            color: ColorResources
                                                                .GREY_SEVENTY),
                                                        errorStyle: TextStyle(
                                                            color: Colors
                                                                .redAccent,
                                                            fontSize: 13.0),
                                                        hintText:
                                                            'Select Place',
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Change this to the desired focused border color
                                                            width: 1,
                                                          ),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Border color when not focused
                                                            width: 1,
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Change this to the desired enabled border color
                                                            width: 1,
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.red,
                                                            // Change this to the desired error border color
                                                            width: 2,
                                                          ),
                                                        ),
                                                      ),
                                                      isExpanded: true,
                                                      hint: Text('fjggjg'),
                                                      onChanged: (DepartmentData? value) {
                                                        departmentListCubit.selectDepartment = value!;
                                                        setState(() {
                                                          selectedDepartment = value;
                                                        });
                                                        selectDepartmentId = value.id!;
                                                      },
                                                      items: departmentList != null ? departmentList.map((item) {
                                                                  return DropdownMenuItem<
                                                                      DepartmentData>(
                                                                    child: Text(item
                                                                        .departmentName
                                                                        .toString()),
                                                                    value: item,
                                                                  );
                                                                }).toList()
                                                              : null,
                                                      value: departmentListCubit
                                                          .selectDepartment,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  )
                                                ],
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 60,
                                                    right: 24,
                                                    bottom: 10),
                                                child: SizedBox(),
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
                                  SizedBox(
                                    height: 20,
                                  ),
                                  BlocConsumer<AreaListCubit, AreaListState>(
                                    listener: (context, state) {
                                      if (state is AreaListErrorState) {
                                        final snackBar = SnackBar(
                                          content: Text(Languages.of(context)!
                                              .internetErrorText),
                                          backgroundColor: Colors.red,
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    },
                                    buildWhen: (previous, current) =>
                                        previous != current,
                                    builder: (context, state) {
                                      if (state is AreaListInitialState) {
                                        return Center(child: SizedBox());
                                      } else if (state
                                          is AreaListLoadingState) {
                                        return Center(child: SizedBox());
                                      } else if (state is AreaListLoadedState) {
                                        List<AreaListData> areaList = state.data;
                                        return areaList.isNotEmpty
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    Languages.of(context)!.area,
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14,
                                                      color: ColorResources
                                                          .GREY_NINETY,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    height: 60,
                                                    child: DropdownButtonFormField<AreaListData>(
                                                      decoration: InputDecoration(
                                                        filled: true,
                                                        fillColor: ColorResources
                                                            .TEXT_FIELD_COLOR,
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10.0,
                                                                right: 5.0,
                                                                top: 16.0,
                                                                bottom: 16.0),
                                                        hintStyle: TextStyle(
                                                            color: ColorResources
                                                                .GREY_SEVENTY),
                                                        errorStyle: TextStyle(
                                                            color: Colors
                                                                .redAccent,
                                                            fontSize: 13.0),
                                                        hintText:
                                                            'Select Place',
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Change this to the desired focused border color
                                                            width: 1,
                                                          ),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Border color when not focused
                                                            width: 1,
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Change this to the desired enabled border color
                                                            width: 1,
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.red,
                                                            // Change this to the desired error border color
                                                            width: 2,
                                                          ),
                                                        ),
                                                      ),
                                                      isExpanded: true,
                                                      hint: Text('Select'),
                                                      onChanged: (AreaListData?
                                                          value) {
                                                        areaListCubit.selectArea = value!;
                                                        selectAreaId = value.id!;
                                                        setState(() {
                                                          selectedArea = value;
                                                        });

                                                     },
                                                      items: areaList != null ? areaList
                                                              .map((item) {
                                                              return DropdownMenuItem<
                                                                  AreaListData>(
                                                                child: Text(item
                                                                    .areaName
                                                                    .toString()),
                                                                value: item,
                                                              );
                                                            }).toList()
                                                          : null,
                                                      value: areaListCubit
                                                          .selectArea,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  )
                                                ],
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 60,
                                                    right: 24,
                                                    bottom: 10),
                                                child: SizedBox(),
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
                                  SizedBox(
                                    height: 20,
                                  ),
                                  BlocConsumer<DivisionListCubit,
                                      DivisionListState>(
                                    listener: (context, state) {
                                      if (state is DivisionListErrorState) {
                                        final snackBar = SnackBar(
                                          content: Text(Languages.of(context)!
                                              .internetErrorText),
                                          backgroundColor: Colors.red,
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    },
                                    buildWhen: (previous, current) =>
                                        previous != current,
                                    builder: (context, state) {
                                      if (state is ZoneListInitialState) {
                                        return Center(child: SizedBox());
                                      } else if (state
                                          is ZoneListLoadingState) {
                                        return Center(child: SizedBox());
                                      } else if (state
                                          is DivisionListLoadedState) {
                                        List<DivisionData> divisionList = state.data;
                                        selectedDivision = divisionList.first;
                                        return divisionList.isNotEmpty
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    Languages.of(context)!.division,
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14,
                                                      color: ColorResources
                                                          .GREY_NINETY,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    height: 60,
                                                    child:
                                                        DropdownButtonFormField<
                                                            DivisionData>(
                                                      decoration:
                                                          InputDecoration(
                                                        filled: true,
                                                        fillColor: ColorResources
                                                            .TEXT_FIELD_COLOR,
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10.0,
                                                                right: 5.0,
                                                                top: 16.0,
                                                                bottom: 16.0),
                                                        hintStyle: TextStyle(
                                                            color: ColorResources
                                                                .GREY_SEVENTY),
                                                        errorStyle: TextStyle(
                                                            color: Colors
                                                                .redAccent,
                                                            fontSize: 13.0),
                                                        hintText:
                                                            'Select Place',
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Change this to the desired focused border color
                                                            width: 1,
                                                          ),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Border color when not focused
                                                            width: 1,
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Change this to the desired enabled border color
                                                            width: 1,
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.red,
                                                            // Change this to the desired error border color
                                                            width: 2,
                                                          ),
                                                        ),
                                                      ),
                                                      isExpanded: true,
                                                      hint: Text('Select'),
                                                      onChanged: (DivisionData?
                                                          value) {
                                                        divisionListCubit.selectDivision = value!;
                                                        selectDivisionId = value.id!;
                                                        setState(() {
                                                          selectedDivision = value;
                                                        });

                                                       },
                                                      items:
                                                          divisionList != null
                                                              ? divisionList
                                                                  .map((item) {
                                                                  return DropdownMenuItem<
                                                                      DivisionData>(
                                                                    child: Text(item
                                                                        .divisionName
                                                                        .toString()),
                                                                    value: item,
                                                                  );
                                                                }).toList()
                                                              : null,
                                                      value: divisionListCubit
                                                          .selectDivision,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  )
                                                ],
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 60,
                                                    right: 24,
                                                    bottom: 10),
                                                child: SizedBox(),
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
                                  SizedBox(
                                    height: 20,
                                  ),
                                  BlocConsumer<BranchListCubit,
                                      BranchListState>(
                                    listener: (context, state) {
                                      if (state is BranchListErrorState) {
                                        final snackBar = SnackBar(
                                          content: Text(Languages.of(context)!
                                              .internetErrorText),
                                          backgroundColor: Colors.red,
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    },
                                    buildWhen: (previous, current) =>
                                        previous != current,
                                    builder: (context, state) {
                                      if (state is BranchListInitialState) {
                                        return Center(child: SizedBox());
                                      } else if (state
                                          is BranchListLoadingState) {
                                        return Center(child: SizedBox());
                                      } else if (state
                                          is BranchListLoadedState) {
                                        List<BranchData> branchList = state.data.data;
                                        selectedBranch = branchList.first;
                                        return branchList.isNotEmpty
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    Languages.of(context)!.branch,
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14,
                                                      color: ColorResources
                                                          .GREY_NINETY,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    height: 60,
                                                    child: DropdownButtonFormField<BranchData>(
                                                      isExpanded: true,
                                                      decoration: InputDecoration(
                                                        filled: true,
                                                        fillColor: ColorResources
                                                            .TEXT_FIELD_COLOR,
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10.0,
                                                                right: 5.0,
                                                                top: 16.0,
                                                                bottom: 16.0),
                                                        hintStyle: TextStyle(
                                                            color: ColorResources
                                                                .GREY_SEVENTY),
                                                        errorStyle: TextStyle(
                                                            color: Colors
                                                                .redAccent,
                                                            fontSize: 13.0),
                                                        hintText:
                                                            'Select Place',
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Change this to the desired focused border color
                                                            width: 1,
                                                          ),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Border color when not focused
                                                            width: 1,
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Change this to the desired enabled border color
                                                            width: 1,
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
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
                                                          selectedBranch =
                                                              value;
                                                        });

                                                       },
                                                      items: branchList != null ? branchList
                                                              .map((item) {
                                                              return DropdownMenuItem<
                                                                  BranchData>(
                                                                child: Text(item
                                                                    .branchName
                                                                    .toString()),
                                                                value: item,
                                                              );
                                                            }).toList()
                                                          : null,
                                                      value: branchListCubit
                                                          .selectBranch,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  )
                                                ],
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 60,
                                                    right: 24,
                                                    bottom: 10),
                                                child: SizedBox(),
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
                                  SizedBox(
                                    height: 20,
                                  ),
                                  BlocConsumer<ZoneListCubit, ZoneListState>(
                                    listener: (context, state) {
                                      if (state is ZoneListErrorState) {
                                        final snackBar = SnackBar(
                                          content: Text(Languages.of(context)!
                                              .internetErrorText),
                                          backgroundColor: Colors.red,
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    },
                                    buildWhen: (previous, current) =>
                                        previous != current,
                                    builder: (context, state) {
                                      if (state is ZoneListInitialState) {
                                        return Center(child: SizedBox());
                                      } else if (state
                                          is ZoneListLoadingState) {
                                        return Center(child: SizedBox());
                                      } else if (state is ZoneListLoadedState) {
                                        List<ZoneData> zoneList = state.zone;
                                        selectedZone = zoneList.first;
                                        return zoneList.isNotEmpty
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    Languages.of(context)!.zone,
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14,
                                                      color: ColorResources
                                                          .GREY_NINETY,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    height: 60,
                                                    child: DropdownButtonFormField<ZoneData>(
                                                      decoration: InputDecoration(
                                                        filled: true,
                                                        fillColor: ColorResources
                                                            .TEXT_FIELD_COLOR,
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10.0,
                                                                right: 5.0,
                                                                top: 16.0,
                                                                bottom: 16.0),
                                                        hintStyle: TextStyle(
                                                            color: ColorResources
                                                                .GREY_SEVENTY),
                                                        errorStyle: TextStyle(
                                                            color: Colors
                                                                .redAccent,
                                                            fontSize: 13.0),
                                                        hintText:
                                                            'Select Place',
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Change this to the desired focused border color
                                                            width: 1,
                                                          ),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Border color when not focused
                                                            width: 1,
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Change this to the desired enabled border color
                                                            width: 1,
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.red,
                                                            // Change this to the desired error border color
                                                            width: 2,
                                                          ),
                                                        ),
                                                      ),
                                                      isExpanded: true,
                                                      hint: Text('Select'),
                                                      onChanged: (ZoneData? value) {
                                                        zoneListCubit.selectDesignation = value!;
                                                        selectZoneId =
                                                            value.id!;
                                                        setState(() {
                                                          selectedZone = value;
                                                        });
                                                       },
                                                      items: zoneList != null ? zoneList
                                                              .map((item) {
                                                              return DropdownMenuItem<
                                                                  ZoneData>(
                                                                child: Text(item
                                                                    .zoneName
                                                                    .toString()),
                                                                value: item,
                                                              );
                                                            }).toList()
                                                          : null,
                                                      value: zoneListCubit
                                                          .selectDesignation,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  )
                                                ],
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 60,
                                                    right: 24,
                                                    bottom: 10),
                                                child: SizedBox(),
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
                                  SizedBox(
                                    height: 20,
                                  ),
                                  BlocConsumer<RecommendationListCubit,
                                      RecommendationListState>(
                                    listener: (context, state) {
                                      if (state
                                          is RecommendationListErrorState) {
                                        final snackBar = SnackBar(
                                          content: Text(Languages.of(context)!
                                              .internetErrorText),
                                          backgroundColor: Colors.red,
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    },
                                    buildWhen: (previous, current) =>
                                        previous != current,
                                    builder: (context, state) {
                                      if (state
                                          is RecommendationListInitialState) {
                                        return Center(child: SizedBox());
                                      } else if (state
                                          is RecommendationListLoadingState) {
                                        return Center(child: SizedBox());
                                      } else if (state
                                          is RecommendationListLoadedState) {
                                        List<RecomListData> recomList = state.data;
                                        return recomList.isNotEmpty
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    Languages.of(context)!.recommendation,
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14,
                                                      color: ColorResources
                                                          .GREY_NINETY,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    height: 60,
                                                    child: DropdownButtonFormField<RecomListData>(
                                                      decoration: InputDecoration(
                                                        filled: true,
                                                        fillColor: ColorResources
                                                            .TEXT_FIELD_COLOR,
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10.0,
                                                                right: 5.0,
                                                                top: 16.0,
                                                                bottom: 16.0),
                                                        hintStyle: TextStyle(
                                                            color: ColorResources
                                                                .GREY_SEVENTY),
                                                        errorStyle: TextStyle(
                                                            color: Colors
                                                                .redAccent,
                                                            fontSize: 13.0),
                                                        hintText:
                                                            'Select Place',
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Change this to the desired focused border color
                                                            width: 1,
                                                          ),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Border color when not focused
                                                            width: 1,
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Change this to the desired enabled border color
                                                            width: 1,
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.red,
                                                            // Change this to the desired error border color
                                                            width: 2,
                                                          ),
                                                        ),
                                                      ),
                                                      isExpanded: true,
                                                      hint: Text('Select'),
                                                      onChanged: (RecomListData? value) {
                                                        recommendationListCubit.selectRecom = value!;
                                                        selectRecomId = value.recomId!;
                                                        setState(() {
                                                          selectRecom = value;
                                                        });

                                                      },
                                                      items: recomList != null ? recomList.map((item) {
                                                              return DropdownMenuItem<
                                                                  RecomListData>(
                                                                child: Text(item
                                                                    .recommendation
                                                                    .toString()),
                                                                value: item,
                                                              );
                                                            }).toList()
                                                          : null,
                                                      value:
                                                          recommendationListCubit
                                                              .selectRecom,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  )
                                                ],
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 60,
                                                    right: 24,
                                                    bottom: 10),
                                                child: SizedBox(),
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
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(Languages.of(context)!.recommendationCount,
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
                                        selectedRecomCount = value!;
                                        selectRecomCount = int.parse(value);
                                        setState(() {
                                          selectedRecomCount = value;
                                        });
                                       },
                                      items: recomCountList != null ? recomCountList.map((item) {
                                              return DropdownMenuItem<String>(
                                                child: Text(item.toString()),
                                                value: item,
                                              );
                                            }).toList()
                                          : null,
                                      value: selectedRecomCount,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    Languages.of(context)!.status,
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
                                        selectedStatus = value!;
                                        selectStatusId = value == 'Regular' ? 0 : 5;
                                        setState(() {
                                          selectedStatus = value;
                                        });
                                       },
                                      items: statusList != null ? statusList.map((item) {
                                              return DropdownMenuItem<String>(
                                                child: Text(item.toString()),
                                                value: item,
                                              );
                                            }).toList()
                                          : null,
                                      value: selectedStatus,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  BlocConsumer<GradeListCubit, GradeListState>(
                                    listener: (context, state) {
                                      if (state is GradeListErrorState) {
                                        final snackBar = SnackBar(
                                          content: Text(Languages.of(context)!
                                              .internetErrorText),
                                          backgroundColor: Colors.red,
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    },
                                    buildWhen: (previous, current) =>
                                        previous != current,
                                    builder: (context, state) {
                                      if (state is GradeListInitialState) {
                                        return Center(child: SizedBox());
                                      } else if (state
                                          is GradeListLoadingState) {
                                        return Center(child: SizedBox());
                                      } else if (state
                                          is GradeListLoadedState) {
                                        List<GradeData> gradeList = state.grade;
                                        selectGrade = gradeList.first;
                                        return gradeList.isNotEmpty
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(Languages.of(context)!.grade,
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14,
                                                      color: ColorResources
                                                          .GREY_NINETY,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    height: 60,
                                                    child: DropdownButtonFormField<GradeData>(
                                                      decoration: InputDecoration(
                                                        filled: true,
                                                        fillColor: ColorResources
                                                            .TEXT_FIELD_COLOR,
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10.0,
                                                                right: 5.0,
                                                                top: 16.0,
                                                                bottom: 16.0),
                                                        hintStyle: TextStyle(
                                                            color: ColorResources
                                                                .GREY_SEVENTY),
                                                        errorStyle: TextStyle(
                                                            color: Colors
                                                                .redAccent,
                                                            fontSize: 13.0),
                                                        hintText:
                                                            'Select Place',
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Change this to the desired focused border color
                                                            width: 1,
                                                          ),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Border color when not focused
                                                            width: 1,
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Change this to the desired enabled border color
                                                            width: 1,
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.red,
                                                            // Change this to the desired error border color
                                                            width: 2,
                                                          ),
                                                        ),
                                                      ),
                                                      isExpanded: true,
                                                      hint: Text('Select'),
                                                      onChanged: (GradeData? value) {
                                                        gradeListCubit.selectGrade = value!;
                                                        selectGradeId = value.id!;
                                                        setState(() {
                                                          selectGrade = value;
                                                        });

                                                        },
                                                      items: gradeList != null ? gradeList.map((item) {
                                                              return DropdownMenuItem<
                                                                  GradeData>(
                                                                child: Text(item
                                                                    .gradeName
                                                                    .toString()),
                                                                value: item,
                                                              );
                                                            }).toList()
                                                          : null,
                                                      value: gradeListCubit
                                                          .selectGrade,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  )
                                                ],
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 60,
                                                    right: 24,
                                                    bottom: 10),
                                                child: SizedBox(),
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
                                  SizedBox(
                                    height: 20,
                                  ),
                                  BlocConsumer<LiabilityListCubit,
                                      LiabilityListState>(
                                    listener: (context, state) {
                                      if (state is LiabilityListErrorState) {
                                        final snackBar = SnackBar(
                                          content: Text(Languages.of(context)!
                                              .internetErrorText),
                                          backgroundColor: Colors.red,
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    },
                                    buildWhen: (previous, current) =>
                                        previous != current,
                                    builder: (context, state) {
                                      if (state is LiabilityListInitialState) {
                                        return Center(child: SizedBox());
                                      } else if (state
                                          is GradeListLoadingState) {
                                        return Center(child: SizedBox());
                                      } else if (state is LiabilityListLoadedState) {
                                        List<LiabilityData> liabilityList = state.liability;
                                        selectedLiability = liabilityList.first;
                                        return liabilityList.isNotEmpty
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    Languages.of(context)!.liability,
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14,
                                                      color: ColorResources
                                                          .GREY_NINETY,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    height: 60,
                                                    child: DropdownButtonFormField<LiabilityData>(
                                                      isExpanded: true,
                                                      decoration: InputDecoration(
                                                        filled: true,
                                                        fillColor: ColorResources
                                                            .TEXT_FIELD_COLOR,
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10.0,
                                                                right: 5.0,
                                                                top: 16.0,
                                                                bottom: 16.0),
                                                        hintStyle: TextStyle(
                                                            color: ColorResources
                                                                .GREY_SEVENTY),
                                                        errorStyle: TextStyle(
                                                            color: Colors
                                                                .redAccent,
                                                            fontSize: 13.0),
                                                        hintText:
                                                            'Select Place',
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                                width: 1,
                                                          ),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                                width: 1,
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Change this to the desired enabled border color
                                                            width: 1,
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.red,
                                                            // Change this to the desired error border color
                                                            width: 2,
                                                          ),
                                                        ),
                                                      ),
                                                      hint: Text('Select'),
                                                      onChanged: (LiabilityData? value) {
                                                        liabilityListCubit.selectLiability = value!;
                                                        selectLiabilityId = value.id!;
                                                        setState(() {
                                                          selectedLiability =
                                                              value;
                                                        });

                                                        },
                                                      items: liabilityList != null ? liabilityList
                                                                  .map((item) {
                                                                  return DropdownMenuItem<
                                                                      LiabilityData>(
                                                                    child: Text(item
                                                                        .liabilityName
                                                                        .toString()),
                                                                    value: item,
                                                                  );
                                                                }).toList()
                                                              : null,
                                                      value: liabilityListCubit
                                                          .selectGrade,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  )
                                                ],
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 60,
                                                    right: 24,
                                                    bottom: 10),
                                                child: SizedBox(),
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
                                  SizedBox(
                                    height: 20,
                                  ),
                                  BlocConsumer<FiscalYearListCubit,
                                      FiscalYearListState>(
                                    listener: (context, state) {
                                      if (state is FiscalYearListErrorState) {
                                        final snackBar = SnackBar(
                                          content: Text(Languages.of(context)!
                                              .internetErrorText),
                                          backgroundColor: Colors.red,
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    },
                                    buildWhen: (previous, current) =>
                                        previous != current,
                                    builder: (context, state) {
                                      if (state is FiscalYearListInitialState) {
                                        return Center(child: SizedBox());
                                      } else if (state
                                          is FiscalYearListLoadingState) {
                                        return Center(child: SizedBox());
                                      } else if (state is FiscalYearListLoadedState) {
                                        List<FiscalYearData> fiscalYearList = state.data;
                                        selectFiscalYear = fiscalYearList.first;
                                        return fiscalYearList.isNotEmpty
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    Languages.of(context)!.fiscalYear,
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14,
                                                      color: ColorResources
                                                          .GREY_NINETY,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    height: 60,
                                                    child:
                                                        DropdownButtonFormField<FiscalYearData>(
                                                      decoration: InputDecoration(
                                                        filled: true,
                                                        fillColor: ColorResources
                                                            .TEXT_FIELD_COLOR,
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10.0,
                                                                right: 5.0,
                                                                top: 16.0,
                                                                bottom: 16.0),
                                                        hintStyle: TextStyle(
                                                            color: ColorResources
                                                                .GREY_SEVENTY),
                                                        errorStyle: TextStyle(
                                                            color: Colors
                                                                .redAccent,
                                                            fontSize: 13.0),
                                                        hintText:
                                                            'Select Place',
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Change this to the desired focused border color
                                                            width: 1,
                                                          ),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Border color when not focused
                                                            width: 1,
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: ColorResources
                                                                .GREY_FOURTY,
                                                            // Change this to the desired enabled border color
                                                            width: 1,
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.red,
                                                            // Change this to the desired error border color
                                                            width: 2,
                                                          ),
                                                        ),
                                                      ),
                                                      isExpanded: true,
                                                      hint: Text('Select'),
                                                      onChanged: (FiscalYearData? value) {
                                                        fiscalYearListCubit.selectFiscalYear = value!;
                                                        selectFiscalYearId = value.fiscalYear!;
                                                        setState(() {
                                                          selectFiscalYear = value;
                                                        });

                                                      },
                                                      items: fiscalYearList != null ? fiscalYearList
                                                                  .map((item) {
                                                                  return DropdownMenuItem<
                                                                      FiscalYearData>(
                                                                    child: Text(
                                                                        "${DateFormat.yMMMMd('en_US').format(DateTime.parse(item.dateFrom!))} to ${DateFormat.yMMMMd('en_US').format(DateTime.parse(item.dateTo!))}"),
                                                                    value: item,
                                                                  );
                                                                }).toList()
                                                              : null,
                                                      value: fiscalYearListCubit
                                                          .selectFiscalYear,
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  )
                                                ],
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 60,
                                                    right: 24,
                                                    bottom: 10),
                                                child: SizedBox(),
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
                                  SizedBox(
                                    height: 50,
                                  )
                                ],
                              ),
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
                                  elevation: 0,
                                  backgroundColor:
                                      ColorResources.APP_THEME_COLOR,
                                  minimumSize: const Size.fromHeight(50), // NEW
                                ),
                                onPressed: () {
                                  /*print(
                                      'select designation Id ${selectDesignationId}\n'
                                      ' select zone Id ${selectZoneId}\n'
                                      ' select status Id ${selectStatusId}\n'
                                      ' select  grade Id ${selectGradeId}\n'
                                      ' select Liability Id ${selectLiabilityId}\n'
                                      ' select branch Id ${selectBranchId}\n'
                                      ' select fiscal year ${selectFiscalYearId}');*/
                                  /*this._designationId,
                            this._zoneId,
                            this._statusId,
                            this._gradeId,
                            this._liabilityId,
                            this._branchId,
                            this._fiscalYear*/
                                  Navigator.pushNamed(
                                      context, AnnualAppraisalMain.routeName,
                                      arguments: SearchFilter(
                                          selectDesignationId,
                                          selectDepartmentId,
                                          selectZoneId,
                                          selectStatusId,
                                          selectGradeId,
                                          selectLiabilityId,
                                          selectBranchId,
                                          selectFiscalYearId,
                                          selectDivisionId,
                                          selectAreaId,
                                          selectRecomId,
                                          selectRecomCount));
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

  Future<bool> _willPopCallback() async {
    Navigator.pop(context);
    return true;
  }
}
