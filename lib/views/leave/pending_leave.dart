import 'package:flutter/material.dart';
import '../../localization/Language/languages.dart';
import '../../repository/models/LeaveModel.dart';
import '../../repository/network/buro_repository.dart';
import '../../sessionmanager/session_manager.dart';
import '../../theme/colors.dart';
import '../../theme/styles.dart';
import '../../utilities/common_methods.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
class PendingLeave extends StatefulWidget {

  static const routeName = '/pendingLeave';
  const PendingLeave({Key? key}) : super(key: key);

  @override
  _PendingLeaveState createState() => _PendingLeaveState();
}

class _PendingLeaveState extends State<PendingLeave> {


  var repository = BuroRepository();
  List<PendingLeaveApprovalData> _data = [];

  String supervisorName = '';
  String user = '';
  bool noDataFound = false;

  Future<void> fetchData() async {
    print('Fetch data called');

    var response = await repository.getPendingLeaveList();

    noDataFound = response.data.isNotEmpty? false :true;

    setState(() {
      _data = response.data;
    });

  }

  Future<void> _onRefresh() async {
    print(' On refresh called');
    fetchData();
  }

  Future<String> getSuperVisorInfo() async {
    return await sessionManager.supervisorInfo;
  }

  Future<String> getLoginname() async {
    return await sessionManager.userID;
  }





  @override
  void initState() {
    super.initState();
    getSuperVisorInfo().then((value) => {
      supervisorName = value,
      setState(() {}),
    });

    getLoginname().then((value) => {
      user = value,
      setState(() {}),
    });

    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.APP_THEME_COLOR,
        iconTheme: IconThemeData(color: ColorResources.WHITE),
        title: Center(
          child: Text(
            Languages.of(context)!.pendingLeave,
            style: Styles.appBarTextStyle,
          ),
        ),
      ),

      body:  Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('No of Item(s): ${_data.length}',textAlign: TextAlign.end,),
              )),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _onRefresh,
              child: noDataFound
                  ? Center(child: noDataFound?Text(Languages.of(context)!.noDataFound): CircularProgressIndicator())
                  : ListView.builder(
                itemCount: _data.length,
                  physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = _data[index];

                  final List<PendingApprovalActivitiesList>? actionList =
                      item.approvalActivitiesList;

                  String applieddate =
                  DateFormat.yMMMMd('en_US')
                      .format(DateTime.parse(item.applieddate!));
                  //var applieddate =
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 24,  bottom: 16),
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
                      child: ListTile(
                        title:  Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(children: [
                            Icon(Icons.calendar_today,color: ColorResources.GREY_EIGHTY,size: 16,),
                            SizedBox(width: 5,),
                            Text(item.duration!)

                          ],),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(item['applicant']),
                            SizedBox(height: 10,),
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                
                                Text('Leave Type',
                                style: GoogleFonts.inter(
                                  fontWeight:
                                  FontWeight.w500,
                                  fontSize: 14,
                                  color: ColorResources
                                      .GREY_NINETY,
                                ),
                                ),
                                SizedBox(height: 5,),
                                Text('${item.leavetypeName}')
                                
                              ],),
                                Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                Container(
                                  child: Text('Remaining days',
                                  style: GoogleFonts.inter(
                                  fontWeight:
                                  FontWeight.w500,
                                  fontSize: 14,
                                  color: ColorResources
                                      .GREY_NINETY,
                              ),

                                  ),
                                  width: 125,
                                ),
                                  SizedBox(height: 5,),
                                Text('${item.remaining}')

                              ],)

                            ],),
                            SizedBox(height: 5,),
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [

                                Flexible(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Reason',
                                        style: GoogleFonts.inter(
                                          fontWeight:
                                          FontWeight.w500,
                                          fontSize: 14,
                                          color: ColorResources
                                              .GREY_NINETY,
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(item.comments!,
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

                                    ],),
                                ),
                                Flexible(
                                  flex: 2,
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text('Applied Date',
                                          style: GoogleFonts.inter(
                                            fontWeight:
                                            FontWeight.w500,
                                            fontSize: 14,
                                            color: ColorResources
                                                .GREY_NINETY,
                                          ),
                                        ),
                                        //width: 125,
                                      ),
                                      SizedBox(height: 5,),
                                      Text('$applieddate  ')

                                    ],),
                                ),



                              ],),
                            SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Application Holder',
                                  style: GoogleFonts.inter(
                                    fontWeight:
                                    FontWeight.w500,
                                    fontSize: 14,
                                    color: ColorResources
                                        .GREY_NINETY,
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text('${item.applicationHolder}')

                              ],),

                           SizedBox(height: 10,),
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
                                               CommonMethods. showLoaderDialog(
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
                                                  //leave type  string
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
                                                          "Success",
                                                          Colors
                                                              .green);
                                                      _onRefresh();
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
                                               CommonMethods.showLoaderDialog(
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
                                                          "Success",
                                                          Colors
                                                              .green);
                                                      _onRefresh();
                                                      //setState(() {});
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
                                                CommonMethods.showLoaderDialog(
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
                                               /* print(jsonCancelTest
                                                    .toString());*/
                                                repository
                                                    .leaveRequestUpdate(
                                                    jsonCancelTest)
                                                    .then(
                                                        (success) {
                                                      CommonMethods
                                                          .showMessage(
                                                          context,
                                                          "Success",
                                                          Colors
                                                              .green);
                                                      _onRefresh();
                                                      //setState(() {});
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
                                               CommonMethods.showLoaderDialog(
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
                                               /* print(jsonCancelTest
                                                    .toString());*/
                                                repository
                                                    .leaveRequestUpdate(
                                                    jsonCancelTest)
                                                    .then(
                                                        (success) {
                                                      CommonMethods
                                                          .showMessage(
                                                          context,
                                                          "Success",
                                                          Colors
                                                              .green);
                                                      _onRefresh();
                                                      //setState(() {});
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
                                               CommonMethods.showLoaderDialog(
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
                                               /* print(jsonCancelTest
                                                    .toString());*/
                                                repository
                                                    .leaveRequestUpdate(
                                                    jsonCancelTest)
                                                    .then(
                                                        (success) {
                                                      CommonMethods
                                                          .showMessage(
                                                          context,
                                                          "Success",
                                                          ColorResources.APP_THEME_COLOR
                                                              );
                                                      _onRefresh();
                                                      //setState(() {});
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
                               SizedBox(height: 10,)
                          ],
                        ),

                        onTap: () {
                          //_allItems.add(item);
                          //print(_allItems);
                          //print(supervisorName);
                        },

                        // onTap: () {
                        //   // Do something when the tile is tapped.
                        // },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),


    );
  }
}
