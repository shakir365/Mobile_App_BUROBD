import 'dart:io';

import 'package:buro_employee/localization/Language/languages.dart';
import 'package:buro_employee/repository/bloc/plan_approval_cubit/plan_approval_cubit.dart';
import 'package:buro_employee/repository/models/ApprovalRequestInfo.dart';
import 'package:buro_employee/sessionmanager/session_manager.dart';
import 'package:buro_employee/theme/colors.dart';
import 'package:buro_employee/theme/styles.dart';
import 'package:buro_employee/utilities/common_methods.dart';
import 'package:buro_employee/utilities/constants.dart';
import 'package:buro_employee/views/field_visit/planApprovalRequst/plan_approval_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../field_visit_main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanApprovalList extends StatefulWidget {
  static const routeName = '/planApprovalList';

  //const BillSubmit({Key? key}) : super(key: key);
  static route() => MaterialPageRoute(builder: (_) => PlanApprovalList());

  const PlanApprovalList({Key? key}) : super(key: key);

  @override
  _PlanApprovalListState createState() => _PlanApprovalListState();
}

class _PlanApprovalListState extends State<PlanApprovalList> {
  var selectedLang;
  late PlanApprovalCubit bloc;

  @override
  void initState()  {
    bloc = context.read<PlanApprovalCubit>();



    getPlanApprovalList();

    getSelectedLang().then((value) => {
          selectedLang = value,
          print('Selected Lang in plan submit ${value.toString()}')
        });

    super.initState();
  }


  void getPlanApprovalList() async{

    try {
      final result =
      await InternetAddress.lookup('google.com');
      if (result.isNotEmpty &&
          result[0].rawAddress.isNotEmpty) {
        bloc.getPlanApprovalList();
      }
    } on SocketException catch (_) {
      // print('not connected');
      //status = false;
      CommonMethods.showMessage(
          context,
          Languages.of(context)!.internetErrorText,
          Colors.red);
    }

  }

  Future<String> getSelectedLang() async {
    return await sessionManager.selectedLang;
  }

  Future<bool> _willPopCallback() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => FieldVisitMain()));
    return true;
  }

  Future refresh() {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        bloc.getPlanApprovalList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: ColorResources.WHITE),
            backgroundColor: ColorResources.APP_THEME_COLOR,
            title: Center(
              child: Text(
                Languages.of(context)!.planApprovalList,
                style: Styles.appBarTextStyle,
              ),
            ),
          ),
          body: BlocConsumer<PlanApprovalCubit, PlanApprovalState>(
            listener: (context, state) {
              if (state is PlanApprovalErrorState) {
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

              if (state is PlanApprovalInitialState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is PlanApprovalLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is PlanApprovalLoadedState) {
                var approvalList = state.planApprovalRequest.data;

                return approvalList.isNotEmpty
                    ? RefreshIndicator(
                        onRefresh: refresh,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: approvalList.length,
                            itemBuilder: (context, index) {
                              var item = approvalList[index];
                              String formattedStartDate =
                                  DateFormat.yMMMMd('en_US')
                                      .format(DateTime.parse(item.startDate));

                              String startTime = DateFormat('yyyy-MM-dd hh:mm:ss a').format(DateTime.parse(item.startDate));
                              String formattedStartTime = startTime.substring(11,22);
                              String formattedEndDate =
                                  DateFormat.yMMMMd('en_US')
                                      .format(DateTime.parse(item.endDate));
                              String endTime = DateFormat('yyyy-MM-dd hh:mm:ss a').format(DateTime.parse(item.endDate));
                              String formattedEndTime = endTime.substring(11,22);

                              print('formattedStartDate  $formattedStartDate   ');
                              print('startTime  $formattedStartTime   ');

                              return Padding(
                                padding: const EdgeInsets.only(
                                  left: 25,
                                  right: 25,
                                  top: 25,
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
                                                    '${item.designationName}',
                                                    style: Styles
                                                        .approveListTextStyle,
                                                  ),
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

                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
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
                                                  var info =
                                                      ApprovalRequestInfo(
                                                          item.planID,
                                                          item.employeeCode,
                                                          item.employeeName,
                                                          item.designationName);

                                                  Navigator.pushNamed(
                                                      context,
                                                      PlanApprovalDetails
                                                          .routeName,
                                                      arguments: info);
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
                                                  CommonMethods
                                                      .showLoaderDialog(
                                                          context);

                                                  try {
                                                    final result =
                                                        await InternetAddress
                                                            .lookup(
                                                                'google.com');
                                                    if (result.isNotEmpty &&
                                                        result[0]
                                                            .rawAddress
                                                            .isNotEmpty) {
                                                      bloc
                                                          .planApprovalActionAll(
                                                              item.planID,
                                                              constants
                                                                  .KEY_APPROVAL_APPROVE)
                                                          .then((value) => {
                                                                Navigator.pop(
                                                                    context),


                                                                    //print('Value.... ${value!.messageEn}'),
                                                                    CommonMethods.showMessage(
                                                                        Scaffold.of(context)
                                                                            .context,
                                                                        'Application approved successfully',
                                                                        Colors
                                                                            .green),

                                                                 // getPlanApprovalList()
                                                        refresh()



                                                              });

                                                      //print('connected');
                                                    }
                                                  } on SocketException catch (_) {
                                                    print('not connected');
                                                    Navigator.pop(context);
                                                    CommonMethods.showMessage(
                                                        context,
                                                        Languages.of(context)!
                                                            .internetErrorText,
                                                        Colors.red);
                                                  }
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
                                                  CommonMethods
                                                      .showLoaderDialog(
                                                          context);
                                                  try {
                                                    final result =
                                                        await InternetAddress
                                                            .lookup(
                                                                'google.com');
                                                    if (result.isNotEmpty &&
                                                        result[0]
                                                            .rawAddress
                                                            .isNotEmpty) {
                                                      bloc
                                                          .planApprovalActionAll(
                                                              item.planID,
                                                              constants
                                                                  .KEY_APPROVAL_REJECT)
                                                          .then((value) => {

                                                            //print('Selected Lang $selectedLang'),

                                                                Navigator.pop(
                                                                    context),
                                                               /* if (selectedLang
                                                                    .toString()
                                                                    .isEmpty)
                                                                  {*/
                                                                    //print("Value ${value!.success}"),
                                                                    CommonMethods.showMessage(
                                                                        Scaffold.of(context)
                                                                            .context,
                                                                       "Application rejected successfully",
                                                                        Colors
                                                                            .red),
                                                                      refresh()
                                                                    //getPlanApprovalList()
                                                                 /* }
                                                                else
                                                                  {
                                                                    CommonMethods.showMessage(
                                                                        context,
                                                                        selectedLang ==
                                                                                'en'
                                                                            ? value!
                                                                                .messageEn
                                                                            : value!
                                                                                .messageBn,
                                                                        Colors
                                                                            .red),

                                                                    getPlanApprovalList()
                                                                  }*/
                                                              });
                                                    }
                                                  } on SocketException catch (_) {
                                                    print('not connected');
                                                    Navigator.pop(context);
                                                    CommonMethods.showMessage(
                                                        context,
                                                        Languages.of(context)!
                                                            .internetErrorText,
                                                        Colors.red);
                                                  }
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
                                      ),
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
                        child: Text(Languages.of(context)!.noDataFound),
                      );
              } else if (state is PlanApprovalErrorState) {
                return Center(
                  child: Container(
                    child: Text(Languages.of(context)!.noDataFound),
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
          )),
    );
  }
}
