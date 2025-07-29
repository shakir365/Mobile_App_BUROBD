

import 'package:buro_employee/repository/bloc/bill_report_bloc/bill_report_bloc_cubit.dart';
import 'package:buro_employee/repository/models/bill_request.dart';
import 'package:buro_employee/sessionmanager/session_manager.dart';
import 'package:buro_employee/views/field_visit/bill_report/search_report.dart';
import 'package:buro_employee/views/field_visit/field_visit_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../localization/Language/languages.dart';
import '../../../repository/bloc/annual_appraisal/apa_employee_list_cubit.dart';
import '../../../theme/colors.dart';
import '../../../theme/styles.dart';
import '../../../utilities/asset_paths.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';



class BillReport extends StatefulWidget {

  static const routeName = '/billReport';
  final  ReportFilter arguments;

  const BillReport(this.arguments,{Key? key}) : super(key: key);

  @override
  _BillReportState createState() => _BillReportState();
}

class _BillReportState extends State<BillReport> {

  var searchController = TextEditingController();
  var count = 0;
  late String activityStatus;

  late BillReportBlocCubit billReportBlocCubit;


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:_willPopCallback,
      child: Scaffold(
        appBar: AppBar(title: Text('Bill Report'),
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
                    'Search Report',
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
                        padding: const EdgeInsets.only(left: 8,right: 8),
                        child: Container(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            enableSuggestions: true,
                            controller: searchController,
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
                              //prefixIcon: Icon(Icons.search),
                              hintText: 'Search by PIN',

                              hintStyle: Styles.hintTextStyle,
                              contentPadding: EdgeInsets.all(20),



                            ),
                              onChanged:(val){


                              }

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
                                SearchFilterReport.routeName,
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
                                    color: ColorResources.TEXT_FIELD_BORDER_COLOR,
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
                BlocConsumer<BillReportBlocCubit,
                    BillReportBlocState>(
                  listener: (context, state) {
                    if (state is AnnualAppraisalErrorState) {
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

                    if (state is BillReportBlocInitialState) {
                      return SizedBox();
                    } else if (state is BillReportBlocLoadingState) {
                      return SizedBox();
                    } else if (state is BillReportBlocLoadedState) {
                      var employeeList = state.data;
                      count = employeeList.length;

                      return employeeList.isNotEmpty
                          ? Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Text('Total ${count.toString()}',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: ColorResources
                                  .GREY_NINETY,
                            )
                        ),
                      )
                          : Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Text('Total ${count.toString()}'),
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
                Expanded(
                  child: Container(
                      child: BlocConsumer<BillReportBlocCubit,
                          BillReportBlocState>(
                        listener: (context, state) {
                          if (state is AnnualAppraisalErrorState) {
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

                          if (state is BillReportBlocInitialState) {
                            return Center(child: Text(Languages.of(context)!.noDataFound));
                          } else if (state is BillReportBlocLoadingState) {
                            return Center(child: Text(Languages.of(context)!.noDataFound));
                          } else if (state is BillReportBlocLoadedState) {
                            var employeeList = state.data!;

                            return employeeList.isNotEmpty
                                ? RefreshIndicator(
                              onRefresh: refresh,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: employeeList.length,
                                  itemBuilder: (context, index) {
                                    var item = employeeList[index];
                                    String formattedStartDate =
                                    DateFormat.yMMMMd('en_US')
                                        .format(DateTime.parse(item.startDate!));

                                    String startTime = DateFormat('yyyy-MM-dd hh:mm:ss a').format(DateTime.parse(item.startDate!));
                                    String formattedStartTime = startTime.substring(11,22);
                                    String formattedEndDate =
                                    DateFormat.yMMMMd('en_US')
                                        .format(DateTime.parse(item.endDate!));
                                    String endTime = DateFormat('yyyy-MM-dd hh:mm:ss a').format(DateTime.parse(item.endDate!));
                                    String formattedEndTime = endTime.substring(11,22);

                                    print('formattedStartDate  $formattedStartDate   ');
                                    print('startTime  $formattedStartTime   ');

                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        left: 5,
                                        right: 5,
                                        top: 20,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: ColorResources.WHITE,
                                          border: Border.all(
                                              color: ColorResources.LIST_BORDER_WHITE,
                                              width: 1),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(
                                            10,
                                          )),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16, right: 16, top: 17),
                                              child: Wrap(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          '${item.employeeCode} - ${item.employeeName}',
                                                          style: Styles
                                                              .approveListHeaderTextStyle,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          '${item.designationName} , ${item.siteName}',
                                                          style: Styles
                                                              .approveListTextStyle,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('Application Holder : ',
                                                              style: GoogleFonts.inter(
                                                                fontWeight:
                                                                FontWeight.w500,
                                                                fontSize: 14,
                                                                color: ColorResources
                                                                    .GREY_NINETY,
                                                              ),
                                                            ),
                                                            SizedBox(height: 5,),
                                                            Text('${item.requestHolder}')

                                                          ],),
                                                        SizedBox(
                                                          height: 10,
                                                        ),

                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('Status : ',
                                                              style: GoogleFonts.inter(
                                                                fontWeight:
                                                                FontWeight.w500,
                                                                fontSize: 14,
                                                                color: ColorResources
                                                                    .GREY_NINETY,
                                                              ),
                                                            ),
                                                            SizedBox(height: 5,),
                                                            Text('${item.activityName}')

                                                          ],),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.date_range,
                                                              size: 18,
                                                              color: ColorResources
                                                                  .GREY_DARK_SIXTY,
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                '$formattedStartDate to $formattedEndDate',
                                                                style: Styles
                                                                    .mediumTextStyle,
                                                                maxLines: 1,
                                                                softWrap: false,
                                                                overflow: TextOverflow
                                                                    .ellipsis,
                                                              ),
                                                            ),
                                                          ],
                                                        ),

                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.timer,
                                                              size: 18,
                                                              color: ColorResources
                                                                  .GREY_DARK_SIXTY,
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                '$formattedStartTime to ${formattedEndTime}',
                                                                style: Styles
                                                                    .mediumTextStyle,
                                                                maxLines: 1,
                                                                softWrap: false,
                                                                overflow: TextOverflow
                                                                    .ellipsis,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.place,
                                                              size: 18,
                                                              color: ColorResources
                                                                  .GREY_DARK_SIXTY,
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                '${item.places}',
                                                                style: Styles
                                                                    .mediumTextStyle,
                                                                maxLines: 1,
                                                                softWrap: false,
                                                                overflow: TextOverflow
                                                                    .ellipsis,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.label_important,
                                                              size: 18,
                                                              color: ColorResources
                                                                  .GREY_DARK_SIXTY,
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                '${item.reason}',
                                                                style: Styles
                                                                    .mediumTextStyle,
                                                                maxLines: 1,
                                                                softWrap: false,
                                                                overflow: TextOverflow
                                                                    .ellipsis,
                                                              ),
                                                            ),
                                                          ],
                                                        ),


                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 10),

                                          /*  Container(
                                              height: 40,
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  SizedBox(
                                                    width: 16,
                                                  ),
                                                  Expanded(
                                                    child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        elevation: 0,
                                                        backgroundColor:
                                                        ColorResources
                                                            .GREY_THIRTY,
                                                        minimumSize:
                                                        const Size.fromHeight(
                                                            50), // NEW
                                                      ),
                                                      onPressed: () {

                                                      },
                                                      child: Container(
                                                        height: 36,
                                                        child: Center(
                                                          child: Text(
                                                              Languages.of(context)!
                                                                  .viewDetails,
                                                              style: Styles
                                                                  .editBillButtonTextStyle),
                                                        ),
                                                      ),
                                                    ),
                                                    flex: 2,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        elevation: 0,
                                                        backgroundColor: ColorResources
                                                            .ACCEPT_COLOR_BACKGROUND,
                                                        minimumSize:
                                                        const Size.fromHeight(
                                                            50), // NEW
                                                      ),
                                                      onPressed: () async {

                                                      },
                                                      child: Center(
                                                          child: Icon(
                                                            Icons.done,
                                                            size: 25,
                                                            color: ColorResources
                                                                .ACCEPT_ICON_COLOR,
                                                          )),
                                                    ),
                                                    flex: 1,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        elevation: 0,
                                                        backgroundColor: ColorResources
                                                            .REJECT_COLOR_BACKGROUND,
                                                        minimumSize:
                                                        const Size.fromHeight(
                                                            50), // NEW
                                                      ),
                                                      onPressed: () async {

                                                      },
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.clear,
                                                          size: 20,
                                                          color: ColorResources
                                                              .CANCEL_BUTTON_TEXT_COLOR,
                                                        ),
                                                      ),
                                                    ),
                                                    flex: 1,
                                                  ),
                                                  SizedBox(
                                                    width: 16,
                                                  )
                                                ],
                                              ),
                                            ),*/
                                            SizedBox(
                                              height: 16,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            )
                                : Center(
                              child: Text(''));
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            billReportBlocCubit.employeeCode = searchController.text;
            /*billReportBlocCubit.activityStatus = 'Pending';
            billReportBlocCubit.startDateFrom = '';
            billReportBlocCubit.startDateTo = '';

            billReportBlocCubit.endDateFrom = '';
            billReportBlocCubit.endDateTo = '';*/

            billReportBlocCubit.getPlanSummary(ReportFilter(searchController.text, 'Pending', billReportBlocCubit.startDateFrom, billReportBlocCubit.startDateTo, billReportBlocCubit.endDateFrom, billReportBlocCubit.endDateTo));
          },
          child: Icon(Icons.search_outlined),
          backgroundColor: ColorResources.APP_THEME_COLOR,

        ),
      ),
    );
  }

  Future refresh() {
    return Future.delayed(
      Duration(seconds: 1),
          () {
        //bloc.getApaEmployeeList(0,'',0,0,0,0,0,0,0,0,0,0,0);
      },
    );
  }

  @override
  void initState() {
    billReportBlocCubit = context.read<BillReportBlocCubit>();



    activityStatus = widget.arguments.status.isEmpty ? 'Pending' :widget.arguments.status;

   if(billReportBlocCubit.employeeCode.isEmpty) {

     print('In First Condition');

     getUserId().then((value) =>
     {
       searchController.text = value,
       print('Value $value'),
       billReportBlocCubit.getPlanSummary(ReportFilter(value, activityStatus, widget.arguments.startDateFrom, widget.arguments.startDateTo, widget.arguments.endDateFrom, widget.arguments.endDateTo))

     });

   } else {
     print('In Second Condition');
     searchController.text = billReportBlocCubit.employeeCode;
     billReportBlocCubit.getPlanSummary(ReportFilter(billReportBlocCubit.employeeCode, billReportBlocCubit.activityStatus, billReportBlocCubit.startDateFrom, billReportBlocCubit.startDateTo, billReportBlocCubit.endDateFrom, billReportBlocCubit.endDateTo));

   }



    super.initState();
  }


  @override
  void dispose(){


    billReportBlocCubit.clear();


    super.dispose();
  }

  Future<bool> _willPopCallback() async {
    Navigator.pushNamedAndRemoveUntil(
        context, FieldVisitMain.routeName, (r) => false);
    return true;
  }

  Future<String> getUserId() async {
    return await sessionManager.userID;
  }
}
