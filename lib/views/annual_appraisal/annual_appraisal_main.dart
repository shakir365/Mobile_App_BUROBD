import 'package:buro_employee/localization/Language/languages.dart';
import 'package:buro_employee/repository/bloc/annual_appraisal/apa_employee_list_cubit.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:buro_employee/theme/colors.dart';
import 'package:buro_employee/theme/styles.dart';
import 'package:buro_employee/views/annual_appraisal/input_key_performance.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app.dart';
import '../../bloc/branch_list/branch_list_cubit.dart';
import '../../repository/bloc/area_list/area_list_cubit.dart';
import '../../repository/bloc/department_list/department_list_cubit.dart';
import '../../repository/bloc/designation_list/designation_list_cubit.dart';
import '../../repository/bloc/division_list_cubit/division_list_cubit.dart';
import '../../repository/bloc/fiscal_year_list/fiscal_year_list_cubit.dart';
import '../../repository/bloc/grade_list/grade_list_cubit.dart';
import '../../repository/bloc/liability_list/liability_list_cubit.dart';
import '../../repository/bloc/recommendation_list/recommendation_list_cubit.dart';
import '../../repository/bloc/zone_list/zone_list_cubit.dart';
import '../../utilities/analytics.dart';
import '../../utilities/asset_paths.dart';
import 'employee_search_filter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnnualAppraisalMain extends StatefulWidget {
  static const routeName = '/annualAppraisalMain';

  final SearchFilter arguments;

  // ForgotPassVerification(this.arguments, {Key? key}) : super(key: key);

  AnnualAppraisalMain(this.arguments, {Key? key}) : super(key: key);

  @override
  _AnnualAppraisalMainState createState() => _AnnualAppraisalMainState();
}

class _AnnualAppraisalMainState extends State<AnnualAppraisalMain> {
  late AnnualAppraisalCubit bloc;

  var _searchController = TextEditingController();
  var count = 0;

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

  @override
  void initState() {
    print('tttttttt Init State called');
    bloc = context.read<AnnualAppraisalCubit>();

    bloc.getApaEmployeeList(
        widget.arguments.designationId!,
        '',
        widget.arguments.departmentId!,
        widget.arguments.branchId!,
        widget.arguments.zoneId!,
        widget.arguments.statusId!,
        widget.arguments.gradeId!,
        widget.arguments.liabilityId!,
        widget.arguments.fiscalYear!,
        widget.arguments.divisionId!,
        widget.arguments.areaId!,
        widget.arguments.recomId!,
        widget.arguments.recomCount!);

    print('Count ${bloc.count}');

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
    /* if(filterDataLoad == false){*/
    designationListCubit.getDesignationList();
    zoneListCubit.getZoneList();
    gradeListCubit.getGradeList();
    liabilityListCubit.getLiabilityList();
    branchListCubit.getBranchList();
    fiscalYearListCubit.getFiscalYear();
    departmentListCubit.getDepartmentList();
    divisionListCubit.getDivisionList();
    areaListCubit.getAreaList();
    recommendationListCubit.getRecommendationList();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    analytics.setCurrentScreen('Annual Appraisal Main page', 'StatefulWidget');
    /*  print('tttttttt didChangeDependencies called');
    print('Apa >>>>> select designation Id ${widget.arguments.designationId}\n'
        ' select zone Id ${widget.arguments.zoneId}\n'
        ' select status Id ${ widget.arguments.statusId}\n'
        ' select  grade Id ${widget.arguments.gradeId}\n'
        ' select Liability Id ${widget.arguments.liabilityId}\n'
        ' select branch Id ${widget.arguments.branchId}\n'
        ' select fiscal year ${widget.arguments.fiscalYear}');*/

    // bloc.getApaEmployeeList(widget.arguments.designationId ?? 0,
    //     '',widget.arguments.branchId?? 0,
    //     widget.arguments.zoneId?? 0,
    //     widget.arguments.statusId?? 0,
    //     widget.arguments.gradeId?? 0,
    //     widget.arguments.liabilityId?? 0,
    //     widget.arguments.fiscalYear?? 0
    //
    // );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //final bloc = context.read<AnnualAppraisalCubit>();
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorResources.APP_THEME_COLOR,
          iconTheme: IconThemeData(color: ColorResources.WHITE),
          title: Center(
            child: Text(
              '${Languages.of(context)!.annualAppraisal}',
              style: Styles.appBarTextStyle,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            bloc.getApaEmployeeList(0, _searchController.text.trim(), 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0);
          },
          child: Icon(
            Icons.search,
            color: ColorResources.WHITE,
          ),
          backgroundColor: ColorResources.APP_THEME_COLOR,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    Languages.of(context)!.searchEmployee,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Container(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            enableSuggestions: true,
                            controller: _searchController,
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
                                    color:
                                        ColorResources.TEXT_FIELD_BORDER_COLOR,
                                    width: 0.0),
                              ),
                              //prefixIcon: Icon(Icons.search),
                              hintText: 'Search by PIN',
                              hintStyle: Styles.hintTextStyle,
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: TextFormField(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                EmployeeSearchFilter.routeName,
                              );
                            },
                            autofocus: false,
                            readOnly: true,
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
                                    color:
                                        ColorResources.TEXT_FIELD_BORDER_COLOR,
                                    width: 0.0),
                              ),
                              prefixIcon: Center(
                                child: Container(
                                  height: 23,
                                  width: 23,
                                  child: SvgPicture.asset(
                                    assetsPath.FILTER_ICON,
                                  ),
                                ),
                              ),
                              hintText: '',
                              hintStyle: Styles.hintTextStyle,
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Container(
                      child: BlocConsumer<AnnualAppraisalCubit,
                          AnnualAppraisalState>(
                    listener: (context, state) {
                      if (state is AnnualAppraisalErrorState) {
                        final snackBar = SnackBar(
                          content:
                              Text(Languages.of(context)!.internetErrorText),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    buildWhen: (previous, current) => previous != current,
                    builder: (context, state) {
                      //print('Home page State ${state}');

                      if (state is AnnualAppraisalInitialState) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is AnnualAppraisalLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is AnnualAppraisalLoadedState) {
                        var employeeList = state.apaEmployeeList.data!;

                        return employeeList.isNotEmpty
                            ? Column(
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Text(
                                          'No of Item(s): ${state.apaEmployeeList.data!.length}',
                                          textAlign: TextAlign.end,
                                        ),
                                      )),
                                  Expanded(
                                      child: RefreshIndicator(
                                    onRefresh: refresh,
                                    child: ListView.builder(
                                        itemCount: employeeList.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          var employeeItem =
                                              employeeList[index];

                                          int? firstYear =
                                              employeeItem.fiscalYear! - 1;
                                          int? secondYear =
                                              employeeItem.fiscalYear;

                                          var qQetSession =
                                              '01-JUL-$firstYear to 30-JUN-$secondYear';

                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: ColorResources.WHITE,
                                                border: Border.all(
                                                    color: ColorResources
                                                        .LIST_BORDER_WHITE,
                                                    width: 1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                  10,
                                                )),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15,
                                                    top: 15,
                                                    right: 15),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '${employeeItem.employeePin} - ${employeeItem.employeeName}',
                                                          style:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 14,
                                                            color: ColorResources
                                                                .GREY_NINETY,
                                                          ),
                                                          textDirection:
                                                              TextDirection.ltr,
                                                          textAlign:
                                                              TextAlign.left,
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          '${employeeItem.designationName}',
                                                          style:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 12,
                                                            color: ColorResources
                                                                .GREY_NINETY,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Question set',
                                                              style: GoogleFonts
                                                                  .inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 12,
                                                                color: ColorResources
                                                                    .GREY_NINETY,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 3,
                                                            ),
                                                            Text(
                                                              '${employeeItem.qsetName}',
                                                              style: GoogleFonts
                                                                  .inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 12,
                                                                color: ColorResources
                                                                    .GREY_SIXTY,
                                                              ),
                                                              maxLines: 1,
                                                              softWrap: false,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Question set session:',
                                                              style: GoogleFonts
                                                                  .inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 12,
                                                                color: ColorResources
                                                                    .GREY_NINETY,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 3,
                                                            ),
                                                            Text(
                                                              qQetSession,
                                                              style: GoogleFonts
                                                                  .inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 12,
                                                                color: ColorResources
                                                                    .GREY_SIXTY,
                                                              ),
                                                              maxLines: 1,
                                                              softWrap: false,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Work Station',
                                                              style: GoogleFonts
                                                                  .inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 12,
                                                                color: ColorResources
                                                                    .GREY_NINETY,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 3,
                                                            ),
                                                            Text(
                                                              '${employeeItem.siteName}',
                                                              style: GoogleFonts
                                                                  .inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 12,
                                                                color: ColorResources
                                                                    .GREY_SIXTY,
                                                              ),
                                                              maxLines: 1,
                                                              softWrap: false,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        elevation: 0,
                                                        backgroundColor:
                                                            ColorResources
                                                                .GREY_THIRTY,
                                                        minimumSize: const Size
                                                            .fromHeight(
                                                            50), // NEW
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                            context,
                                                            InputKeyPerformance
                                                                .routeName,
                                                            arguments:
                                                                employeeItem);
                                                      },
                                                      child: Container(
                                                        height: 36,
                                                        child: Center(
                                                          child: Text(
                                                              'Input KPI',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 12,
                                                                color: ColorResources
                                                                    .GREY_NINETY,
                                                              )),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 16,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ))
                                ],
                              )
                            : Center(
                                child: Text(Languages.of(context)!.noDataFound),
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
                ),
              ]),
        ),
      ),
    );
  }

  @override
  dispose() {
    print('Annual Appraisal Dispose called');
    //filterDataLoad = false;
    super.dispose();
    _searchController.dispose();
  }

  Future<bool> _willPopCallback() async {
    Navigator.pushNamedAndRemoveUntil(
        context, LandingScreen.routeName, (r) => false);
    return true;
  }

  Future refresh() {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        bloc.getApaEmployeeList(0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
      },
    );
  }
}
