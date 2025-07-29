import 'dart:convert';
import 'dart:io';
import 'package:buro_employee/repository/models/LeaveModel.dart';
import 'package:buro_employee/repository/models/leave.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import '../../localization/Language/languages.dart';
import '../../repository/bloc/leave_approval_request/leave_approval_request_cubit.dart';
import '../../repository/network/buro_api_provider.dart';
import '../../repository/network/buro_repository.dart';
import '../../sessionmanager/session_manager.dart';
import '../../theme/colors.dart';
import '../../theme/styles.dart';
import '../../utilities/common_methods.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utilities/constants.dart';
import '../../utilities/environments.dart';
import '../../widgets/alert.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class LeaveAuthorizationList extends StatefulWidget {
  static const String routeName = '/leaveAuthorization';

  const LeaveAuthorizationList({Key? key}) : super(key: key);

  @override
  _LeaveAuthorizationListState createState() => _LeaveAuthorizationListState();
}

class _LeaveAuthorizationListState extends State<LeaveAuthorizationList> {
  var selectedLang;
  late LeaveApprovalRequestCubit bloc;
  var repository = BuroRepository();
  List<ApproveLeaveData> _data = [];
  String supervisorName = '';
  String user = '';
  bool noDataFound = false;


  @override
  void initState()  {
    super.initState();
    bloc = context.read<LeaveApprovalRequestCubit>();
    getSuperVisorInfo().then((value) => {
          supervisorName = value,
          setState(() {}),
        });

    getLoginName().then((value) => {
          user = value,
          setState(() {}),
        });

    fetchData();

  }

  Future refresh() {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        fetchData();
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // analytics.setCurrentScreen('Approval List', 'Stateful widget');
  }

  Future<bool> _willPopCallback() async {
    /*Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => FormScreen()));
   */
    return true;
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
                '${Languages.of(context)!.leaveAuthorization}',
                style: Styles.appBarTextStyle,
              ),
            ),
          ),
          body: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Text(
                      'No of Item(s): ${_data.length}',
                      textAlign: TextAlign.end,
                    ),
                  )),
              Expanded(
                  child: RefreshIndicator(
                onRefresh: refresh,
                child: noDataFound
                    ? Center(
                        child: noDataFound
                            ? Text(Languages.of(context)!.noDataFound)
                            : CircularProgressIndicator())
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: _data.length,
                        //scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext contextm, index) {
                          final item = _data[index];
                          final List<ApprovalActivitiesList>? actionList =
                              item.approvalActivitiesList;

                          // print('ActionList index $index count ${actionList!.length}');

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
                                borderRadius: BorderRadius.all(Radius.circular(
                                  10,
                                )),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 17),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                         Text(
                                           item.applicant!,
                                           style:
                                           Styles.approveListHeaderTextStyle,
                                         ),
                                         
                                         Visibility(
                                           visible: item.attachmentInfoId == 0 ? false:true,
                                           child: InkWell(
                                             onTap: (){
                                               print('Download button click');
                                               downloadFile(item.attachmentInfoId!);
                                             },
                                             child: Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: Icon(Icons.cloud_download_outlined),
                                             ),
                                           ),
                                         )
                                       ],),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Flexible(
                                              flex: 1,
                                              child: Text(
                                                item.designation!,
                                                style: GoogleFonts.inter(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    color: ColorResources
                                                        .GREY_EIGHTY),
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Icon(
                                                    Icons.circle,
                                                    size: 7,
                                                    color: ColorResources
                                                        .GREY_EIGHTY,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    item.workStation!,
                                                    style: GoogleFonts.inter(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color: ColorResources
                                                            .GREY_EIGHTY),
                                                  ),
                                                ],
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
                                              Icons.date_range,
                                              size: 18,
                                              color: ColorResources.GREY_NINETY,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              item.duration!,
                                              style: Styles.mediumTextStyle,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              flex: 3,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Reason',
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: ColorResources
                                                          .GREY_NINETY,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    item.comments!,
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      color: ColorResources
                                                          .GREY_SEVENTY,
                                                    ),
                                                    maxLines: 5,
                                                    softWrap: false,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  )
                                                ],
                                              ),
                                            ),
                                            Flexible(
                                              flex: 2,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Leave Type',
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: ColorResources
                                                          .GREY_NINETY,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    item.leavetypeName!,
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      color: ColorResources
                                                          .GREY_SEVENTY,
                                                    ),
                                                    maxLines: 1,
                                                    softWrap: false,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    actionList?.length != 0
                                        ? Container(
                                            // button list horizontal
                                            height: 50,
                                            //color: ColorResources.APP_THEME_COLOR,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              physics: BouncingScrollPhysics(),
                                              itemCount: actionList!.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      actionIndex) {
                                                var actionItem =
                                                    actionList[actionIndex];

                                                var screenSize =
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .78;

                                                var actionName;
                                                if (actionItem
                                                        .activityfriendlyname ==
                                                    'NotRecommend') {
                                                  actionName = 'Not Recommend';
                                                } else {
                                                  actionName = actionItem
                                                      .activityfriendlyname;
                                                }

                                                switch (actionList.length) {
                                                  case 1:
                                                    {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 10),
                                                        child: Container(
                                                          height: 35,
                                                          width: screenSize,
                                                          child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              elevation: 0, backgroundColor: actionIndex <
                                                                      1
                                                                  ? ColorResources
                                                                      .ACCEPT_COLOR_BACKGROUND
                                                                  : ColorResources
                                                                      .REJECT_COLOR_BACKGROUND,
                                                              minimumSize: const Size
                                                                      .fromHeight(
                                                                  50), // NEW
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              showLoaderDialog(
                                                                  context);

                                                              var activitiesName;
                                                              activitiesName = item
                                                                  .approvalActivitiesList![
                                                                      actionIndex]
                                                                  .activityfriendlyname;

                                                              Map<String,
                                                                      dynamic>
                                                                  jsonCancelTest =
                                                                  {
                                                                "leaverequestId":
                                                                    item.requestId,
                                                                "ActivitiesName":
                                                                    activitiesName
                                                                        .toString()
                                                                        .trim(),
                                                                 "receiverCode":
                                                                 '${supervisorName.substring(0, 5)}',

                                                              };
                                                              print(jsonCancelTest
                                                                  .toString());
                                                              repository
                                                                  .leaveRequestUpdate(
                                                                      jsonCancelTest)
                                                                  .then(
                                                                      (success) {
                                                                CommonMethods
                                                                    .showMessage(
                                                                        context,
                                                                        "Successful",
                                                                        Colors
                                                                            .green);
                                                                refresh();
                                                                //_onRefresh();
                                                               // setState(() {});
                                                                Navigator.pop(
                                                                    context);
                                                              });
                                                            },
                                                            child: Center(
                                                              child: Text(
                                                                  actionName,
                                                                  style: actionIndex <
                                                                          1
                                                                      ? Styles
                                                                          .acceptButtonTextStyle
                                                                      : Styles
                                                                          .rejectButtonTextStyle),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    break;

                                                  case 2:
                                                    {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 10),
                                                        child: Container(
                                                          height: 35,
                                                          width: screenSize / 2,
                                                          child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              elevation: 0, backgroundColor: actionIndex <
                                                                      1
                                                                  ? ColorResources
                                                                      .ACCEPT_COLOR_BACKGROUND
                                                                  : ColorResources
                                                                      .REJECT_COLOR_BACKGROUND,
                                                              minimumSize: const Size
                                                                      .fromHeight(
                                                                  50), // NEW
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              showLoaderDialog(
                                                                  context);
                                                              var activitiesName;
                                                              activitiesName = item
                                                                  .approvalActivitiesList![
                                                                      actionIndex]
                                                                  .activityfriendlyname;

                                                              Map<String,
                                                                      dynamic>
                                                                  jsonCancelTest =
                                                                  {
                                                                "leaverequestId":
                                                                    item.requestId,
                                                                "ActivitiesName":
                                                                    activitiesName
                                                                        .toString()
                                                                        .trim(),
                                                                "receiverCode":
                                                                    '${supervisorName.substring(0, 5)}',

                                                              };
                                                              print(jsonCancelTest
                                                                  .toString());
                                                              repository
                                                                  .leaveRequestUpdate(
                                                                      jsonCancelTest)
                                                                  .then(
                                                                      (success) {
                                                                CommonMethods
                                                                    .showMessage(
                                                                        context,
                                                                        "Successful",
                                                                        Colors
                                                                            .green);
                                                                //_onRefresh();
                                                                refresh();
                                                                Navigator.pop(
                                                                    context);
                                                              });
                                                            },
                                                            child: Center(
                                                              child: Text(
                                                                  actionName,
                                                                  style: actionIndex <
                                                                          1
                                                                      ? Styles
                                                                          .acceptButtonTextStyle
                                                                      : Styles
                                                                          .rejectButtonTextStyle),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  case 3:
                                                    {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 10),
                                                        child: Container(
                                                          height: 35,
                                                          width: screenSize / 3,
                                                          child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              elevation: 0, backgroundColor: actionIndex <
                                                                      1
                                                                  ? ColorResources
                                                                      .ACCEPT_COLOR_BACKGROUND
                                                                  : ColorResources
                                                                      .REJECT_COLOR_BACKGROUND,
                                                              minimumSize: const Size
                                                                      .fromHeight(
                                                                  50), // NEW
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              showLoaderDialog(
                                                                  context);
                                                              //Sender converted value
                                                              var activitiesName;

                                                              activitiesName = item
                                                                  .approvalActivitiesList![
                                                                      actionIndex]
                                                                  .activityfriendlyname;

                                                              if(activitiesName == 'Transfer'){


                                                                String input = supervisorName;
                                                                RegExp regex = RegExp(r'\d+');
                                                                RegExpMatch? match =
                                                                regex.firstMatch(input);
                                                                String? result = match?.group(0);
                                                                int supervisorID = int.parse(result!);

                                                              }


                                                              Map<String,
                                                                      dynamic>
                                                                  jsonCancelTest =
                                                                  {
                                                                "leaverequestId":
                                                                    item.requestId,
                                                                "ActivitiesName":
                                                                    activitiesName
                                                                        .toString()
                                                                        .trim(),
                                                                "receiverCode": '${supervisorName.substring(0, 5)}',


                                                              };
                                                              print(jsonCancelTest
                                                                  .toString());
                                                              repository
                                                                  .leaveRequestUpdate(
                                                                      jsonCancelTest)
                                                                  .then(
                                                                      (success) {
                                                                CommonMethods
                                                                    .showMessage(
                                                                        context,
                                                                        "Successful",
                                                                        Colors
                                                                            .green);
                                                               // _onRefresh();
                                                                refresh();

                                                                Navigator.pop(
                                                                    context);
                                                              });
                                                            },
                                                            child: Center(
                                                              child: Text(
                                                                  actionName,
                                                                  style: actionIndex <
                                                                          1
                                                                      ? Styles
                                                                          .acceptButtonTextStyle
                                                                      : Styles
                                                                          .rejectButtonTextStyle),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }

                                                  case 4:
                                                    {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 10),
                                                        child: Container(
                                                          height: 35,
                                                          width: screenSize / 4,
                                                          child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              elevation: 0, backgroundColor: actionIndex <
                                                                      1
                                                                  ? ColorResources
                                                                      .ACCEPT_COLOR_BACKGROUND
                                                                  : ColorResources
                                                                      .REJECT_COLOR_BACKGROUND,
                                                              minimumSize: const Size
                                                                      .fromHeight(
                                                                  50), // NEW
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              showLoaderDialog(
                                                                  context);


                                                              //Sender converted value
                                                              var activitiesName;
                                                              activitiesName = item
                                                                  .approvalActivitiesList![
                                                                      actionIndex]
                                                                  .activityfriendlyname;

                                                              Map<String,
                                                                      dynamic>
                                                                  jsonCancelTest =
                                                                  {
                                                                "leaverequestId":
                                                                    item.requestId,
                                                                "ActivitiesName":
                                                                    activitiesName
                                                                        .toString()
                                                                        .trim(),
                                                                "receiverCode":
                                                                    '${supervisorName.substring(0, 5)}',


                                                              };
                                                              print(jsonCancelTest
                                                                  .toString());
                                                              repository
                                                                  .leaveRequestUpdate(
                                                                      jsonCancelTest)
                                                                  .then(
                                                                      (success) {
                                                                CommonMethods
                                                                    .showMessage(
                                                                        context,
                                                                        "Successful",
                                                                        Colors
                                                                            .green);
                                                               // _onRefresh();
                                                                refresh();

                                                                Navigator.pop(
                                                                    context);
                                                              });
                                                            },
                                                            child: Center(
                                                              child: Text(
                                                                  actionName,
                                                                  style: actionIndex <
                                                                          1
                                                                      ? Styles
                                                                          .acceptButtonTextStyle
                                                                      : Styles
                                                                          .rejectButtonTextStyle),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    break;

                                                  default:
                                                    {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 10),
                                                        child: Container(
                                                          height: 35,
                                                          width: 160,
                                                          child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              elevation: 0, backgroundColor: actionIndex <
                                                                      1
                                                                  ? ColorResources
                                                                      .ACCEPT_COLOR_BACKGROUND
                                                                  : ColorResources
                                                                      .REJECT_COLOR_BACKGROUND,
                                                              minimumSize: const Size
                                                                      .fromHeight(
                                                                  50), // NEW
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              showLoaderDialog(
                                                                  context);

                                                              //Sender converted value
                                                              var activitiesName;

                                                              activitiesName = item
                                                                  .approvalActivitiesList![
                                                                      actionIndex]
                                                                  .activityfriendlyname;

                                                              Map<String,
                                                                      dynamic>
                                                                  jsonCancelTest =
                                                                  {
                                                                "leaverequestId":
                                                                    item.requestId,
                                                                "ActivitiesName":
                                                                    activitiesName
                                                                        .toString()
                                                                        .trim(),
                                                                "receiverCode":
                                                                    '${supervisorName.substring(0, 5)}',


                                                              };
                                                              print(jsonCancelTest
                                                                  .toString());
                                                              repository
                                                                  .leaveRequestUpdate(
                                                                      jsonCancelTest)
                                                                  .then(
                                                                      (success) {
                                                                CommonMethods
                                                                    .showMessage(
                                                                        context,
                                                                        "Successful",
                                                                        Colors
                                                                            .green);
                                                               // _onRefresh();
                                                                refresh();

                                                                Navigator.pop(
                                                                    context);
                                                              });
                                                            },
                                                            child: Center(
                                                              child: Text(
                                                                  actionName,
                                                                  style: actionIndex <
                                                                          1
                                                                      ? Styles
                                                                          .acceptButtonTextStyle
                                                                      : Styles
                                                                          .rejectButtonTextStyle),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }

                                                    break;
                                                }
                                              },
                                            ),
                                          )
                                        : SizedBox(),


                                    SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
              ))
            ],
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

  Future<LeaveApproveList?> fetchData() async {


    print('Fetch data called');


    try {
      final result =
      await InternetAddress.lookup('google.com');
      if (result.isNotEmpty &&
          result[0].rawAddress.isNotEmpty) {

        var response = await repository.getPendingLeaveListForApprover();
        noDataFound = response.data.isNotEmpty? false :true;
        setState(() {
          _data = response.data;
        });

        return response;

      }
    } on SocketException catch (_) {
      // print('not connected');
      //status = false;
      CommonMethods.showMessage(
          context,
          Languages.of(context)!.internetErrorText,
          Colors.red);


    }

    return null;
  }


  Future<String> getSuperVisorInfo() async {
    return await sessionManager.supervisorInfo;
  }

  /*Future<void> _onRefresh() async {
    fetchData();
  }*/

  Future<String> getLoginName() async {
    return await sessionManager.userID;
  }


  Future<void> downloadFile(int attachmentId) async {
    try {
      // Step 1: Request permission (Android)
      if (Platform.isAndroid) {
        var status = await Permission.storage.request();
        if (!status.isGranted) {
          print('Storage permission denied');
          return;
        }
      }





      // Step 2: Fetch base64 string from API
     /* Dio dio = Dio();

      dio.options.contentType = Headers.formUrlEncodedContentType;

      dio.options = BaseOptions(headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjAxMTM0IiwicGFzc3dvcmQiOiI1NDMyMSIsIm5iZiI6MTc1MDEzNDg1MCwiZXhwIjoxNzUwMTYzNjUwLCJpYXQiOjE3NTAxMzQ4NTB9.X8urfPSLl4QzpHuRf3P4rqm8yy9uUu7cDVxz5QUNcfc',
      }, baseUrl: environments.base_url, receiveDataWhenStatusError: true);*/


      FileDownloadModel response = await repository.fileDownload(attachmentId);

      if (response.success == true&& response.fileData != null) {

        final dir = await getExternalStorageDirectory();
        if (dir == null) {
          throw Exception("❌ Could not get external storage directory");
        }

        // Adjust based on your API response
        /*String base64String = response.fileData![0].fileContentBase64!; // or just `response.data` if it's raw
        String fileName = response.fileData![0].fileName!;
        // Step 3: Decode base64 to bytes
        List<int> bytes = base64Decode(base64String);
        final dir = await getExternalStorageDirectory();

        print('Directory $dir');

        final file = File('${dir!.path}/$fileName');
        // Step 4: Get local path
      *//*  Directory dir = Platform.isAndroid
            ? Directory('/storage/emulated/0/Download') // Android download folder
            : await getApplicationDocumentsDirectory();



        // Step 5: Write to file
        File file = File(filePath);*//*
        String filePath = '${dir.path}/$fileName';
        await file.writeAsBytes(bytes);

        var message = await OpenFilex.open(filePath);*/


        for (var fileItem in response.fileData!) {
          String base64String = fileItem.fileContentBase64!;
          String fileName = fileItem.fileName!;

          List<int> bytes = base64Decode(base64String);
          String filePath = '${dir.path}/$fileName';
          File file = File(filePath);

          await file.writeAsBytes(bytes);
          print('✅ File saved to: $filePath');

          // Open each file (optional)
          var result = await OpenFilex.open(filePath);
          print('📂 Open result for $fileName: $result');
        }
        CommonMethods.showMessage(context, 'All files downloaded successfully', Colors.green);
        //print('✅ File saved to: $filePath');
      } else {
        print('❌ API returned error: ${response}');
        CommonMethods.showMessage(context, 'File Not Found', Colors.red);
      }
    } catch (e) {
      print('❌ Download error: $e');

      CommonMethods.showMessage(context, 'File Not Found', Colors.red);
    }
  }
}
