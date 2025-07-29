import 'package:buro_employee/views/leave/leave_authorization_list.dart';
import 'package:flutter/material.dart';

import '../../localization/Language/languages.dart';
import '../../repository/bloc/leave_approval_details/approval_details_cubit.dart';

import '../../theme/colors.dart';
import '../../theme/styles.dart';
import '../../utilities/common_methods.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:date_time_format/date_time_format.dart';

import '../../../utilities/constants.dart';




class LeaveAuthorizationDetail extends StatefulWidget {
 final int arguments;
  static const routeName = '/leaveAuthorizationDetail';

  const LeaveAuthorizationDetail(this.arguments,{Key? key}) : super(key: key);

  @override
  _LeaveAuthorizationDetailState createState() => _LeaveAuthorizationDetailState();
}

class _LeaveAuthorizationDetailState extends State<LeaveAuthorizationDetail> {
  var selectedLang;
  var item;
  late LeaveApprovalDetailsCubit bloc;

  @override
  void initState() {
    CommonMethods.getSelectedLang().then((value) => {
      selectedLang = value,
    });

    bloc = context.read<LeaveApprovalDetailsCubit>();
    //item = widget.arguments;
    bloc.getApprovalDetailsforleave(widget.arguments);
    //super.initState();
  }

  Future<bool> _willPopCallback() async {
    Navigator.pushNamed(context, LeaveAuthorizationList.routeName);
    return true;
  }

  Future refresh() {
    return Future.delayed(
      Duration(seconds: 1),
          () {
        bloc.getApprovalDetailsforleave(widget.arguments);
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // analytics.setCurrentScreen('Approval Details', 'Stateful widget');
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
                '${Languages.of(context)!.approvalListDetail}',
                style: Styles.appBarTextStyle,
              ),
            ),
          ),
          body: BlocConsumer<LeaveApprovalDetailsCubit, ApprovalDetailsStateforleave>(
            listener: (context, state) {
              if (state is ApprovalDetailsErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Network Error"),
                  ),
                );
              }
            },
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              if (state is ApprovalDetailsInitialState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ApprovalDetailsLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ApprovalDetailsLoadedState) {
                var list = state.approvalRequestDetails.data;
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorResources.RECEIPIENT_BACKGROUD,
                          border: Border.all(
                              color: ColorResources.APP_THEME_COLOR, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(
                            10,
                          )),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 16),
                              child: Text(
                                //'${widget.arguments.pin}: ${widget.arguments.name}',
                                '',
                                style: Styles.listHeaderTextStyle,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 16, bottom: 16),
                              child: Text(
                                //'${widget.arguments.designation}',
                                '',
                                style: Styles.listHeaderTextStyle,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: refresh,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                var item = list[index];
                                var transportBy = '';
                                if (item.transportBy != null) {
                                  transportBy = item.transportBy!;
                                }
                                String formattedStartDate =
                                DateTime.parse(item.startDate)
                                    .format(DateTimeFormats.american);

                                String formattedEndDate =
                                DateTime.parse(item.endDate)
                                    .format(DateTimeFormats.american);

                                return Padding(
                                  padding: const EdgeInsets.only(
                                    left: 25,
                                    right: 25,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: ColorResources.WHITE,
                                      border: Border.all(
                                          color:
                                          ColorResources.LIST_BORDER_WHITE,
                                          width: 1),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(
                                        10,
                                      )),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 16, right: 16, top: 16),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${formattedStartDate} to ${formattedEndDate}',
                                                    style: Styles
                                                        .listHeaderTextStyle),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    style: DefaultTextStyle.of(
                                                        context)
                                                        .style,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: 'From : ',
                                                          style: Styles
                                                              .listDescHeadingTextStyle),
                                                      //Code perhaps not need
                                                      // TextSpan(
                                                      //     text:
                                                      //         '${item.fromPlace}',
                                                      //     style: Styles
                                                      //         .listDescWithHeadTextStyle),




                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    style: DefaultTextStyle.of(
                                                        context)
                                                        .style,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: 'To :  ',
                                                          style: Styles
                                                              .listDescHeadingTextStyle),
                                                      //Code perhaps not need
                                                      // TextSpan(
                                                      //     text:
                                                      //         '${item.toPlace}',
                                                      //     style: Styles
                                                      //         .listDescWithHeadTextStyle),



                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    style: DefaultTextStyle.of(
                                                        context)
                                                        .style,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: 'Reason: ',
                                                          style: Styles
                                                              .listDescHeadingTextStyle),
                                                      TextSpan(
                                                          text:
                                                          '${item.reason}',
                                                          style: Styles
                                                              .listDescWithHeadTextStyle),
                                                    ],
                                                  ),
                                                ),
                                                transportBy.isNotEmpty
                                                    ? Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        style: DefaultTextStyle
                                                            .of(context)
                                                            .style,
                                                        children: <
                                                            TextSpan>[
                                                          TextSpan(
                                                              text:
                                                              'Transport : ',
                                                              style: Styles
                                                                  .listDescHeadingTextStyle),
                                                          TextSpan(
                                                              text:
                                                              transportBy,
                                                              style: Styles
                                                                  .listDescWithHeadTextStyle),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                )
                                                    : SizedBox(),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Text('Status: ',
                                                        style: GoogleFonts.inter(
                                                            fontSize: 12,
                                                            fontWeight:
                                                            FontWeight.w400,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            color: ColorResources
                                                                .GREY_SIXTY)),
                                                    CommonMethods.getStatus(
                                                        item.approvalStatus),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 16, bottom: 16),
                                          child: Divider(
                                            height: 1,
                                            thickness: 1,
                                            color: ColorResources.GREY_THIRTY,
                                          ),
                                        ),
                                        Align(
                                            alignment:
                                            FractionalOffset.bottomCenter,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 16,
                                                        right: 10,
                                                        bottom: 17),
                                                    child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor: ColorResources
                                                              .ACCEPT_COLOR_BACKGROUND,
                                                          elevation: 0
                                                        // minimumSize: const Size.fromHeight(50), // NEW
                                                      ),
                                                      child: Container(
                                                        child: Center(
                                                          child: Text(
                                                            '${Languages.of(context)!.approve}',
                                                            style: Styles
                                                                .acceptButtonTextStyle,
                                                          ),
                                                        ),
                                                        height: 40,
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
                                                          if (result
                                                              .isNotEmpty &&
                                                              result[0]
                                                                  .rawAddress
                                                                  .isNotEmpty) {
                                                            bloc
                                                                .approvalAction(
                                                                item
                                                                    .appDetailsID,
                                                                item
                                                                    .applicationID,
                                                                constants
                                                                    .KEY_APPROVAL_APPROVE)
                                                                .then(
                                                                    (value) => {
                                                                  if (selectedLang
                                                                      .toString()
                                                                      .isEmpty)
                                                                    {
                                                                      Navigator.pop(context),
                                                                      CommonMethods.showMessage(context, value!.messageEn, Colors.green),
                                                                      refresh()
                                                                    }
                                                                  else
                                                                    {
                                                                      Navigator.pop(context),
                                                                      CommonMethods.showMessage(context, selectedLang == 'en' ? value!.messageEn : value!.messageBn, Colors.green),
                                                                      refresh()
                                                                    }
                                                                });

                                                            //print('connected')
                                                          }
                                                        } on SocketException catch (_) {
                                                          print(
                                                              'not connected');
                                                          Navigator.pop(
                                                              context);
                                                          CommonMethods.showMessage(
                                                              context,
                                                              Languages.of(
                                                                  context)!
                                                                  .internetErrorText,
                                                              Colors.red);
                                                        }

                                                        /* bloc.approvalAction(item.appDetailsID,
                                                                item.applicationID,
                                                                constants.KEY_APPROVAL_APPROVE)
                                                            .then((value) => {
                                                          Navigator.pop(
                                                              context),
                                                                  CommonMethods.showMessage(
                                                                      context,
                                                                      selectedLang ==
                                                                              'en'
                                                                          ? value!
                                                                              .messageEn
                                                                          : value!
                                                                              .messageBn,
                                                                      Colors.green),
                                                                  initState()
                                                                });*/
                                                      },
                                                    ),
                                                  ),
                                                  flex: 1,
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        right: 16,
                                                        bottom: 17),
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor: ColorResources
                                                            .REJECT_COLOR_BACKGROUND,
                                                        elevation: 0,
                                                      ),
                                                      child: Container(
                                                        child: Center(
                                                          child: Text(
                                                            '${Languages.of(context)!.reject}',
                                                            style: Styles
                                                                .rejectButtonTextStyle,
                                                          ),
                                                        ),
                                                        height: 40,
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
                                                          if (result
                                                              .isNotEmpty &&
                                                              result[0]
                                                                  .rawAddress
                                                                  .isNotEmpty) {
                                                            bloc
                                                                .approvalAction(
                                                                item
                                                                    .appDetailsID,
                                                                item
                                                                    .applicationID,
                                                                constants
                                                                    .KEY_APPROVAL_REJECT)
                                                                .then(
                                                                    (value) => {
                                                                  if (selectedLang
                                                                      .toString()
                                                                      .isEmpty)
                                                                    {
                                                                      Navigator.pop(context),
                                                                      CommonMethods.showMessage(context, value!.messageEn, Colors.red),
                                                                      // initState()
                                                                      refresh()
                                                                    }
                                                                  else
                                                                    {
                                                                      Navigator.pop(context),
                                                                      CommonMethods.showMessage(context, selectedLang == 'en' ? value!.messageEn : value!.messageBn, Colors.red),
                                                                      //initState()
                                                                      refresh()
                                                                    }
                                                                });

                                                            //print('connected');
                                                          }
                                                        } on SocketException catch (_) {
                                                          print(
                                                              'not connected');
                                                          Navigator.pop(
                                                              context);
                                                          CommonMethods.showMessage(
                                                              context,
                                                              Languages.of(
                                                                  context)!
                                                                  .internetErrorText,
                                                              Colors.red);
                                                        }

                                                        /*bloc
                                                            .approvalAction(
                                                                item
                                                                    .appDetailsID,
                                                                item
                                                                    .applicationID,
                                                                constants
                                                                    .KEY_APPROVAL_REJECT)
                                                            .then((value) => {
                                                                  Navigator.pop(
                                                                      context),
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
                                                                  initState()
                                                                });*/
                                                      },
                                                    ),
                                                  ),
                                                  flex: 1,
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                );
                              }),
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

  static showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Connecting...")),
        ],
      ),
    );

    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
