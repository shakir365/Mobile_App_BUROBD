import 'dart:io';

import 'package:buro_employee/repository/models/LeaveModel.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../localization/Language/languages.dart';
import '../../repository/network/buro_repository.dart';
import '../../theme/colors.dart';
import '../../theme/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../utilities/common_methods.dart';

class LeaveHistory extends StatefulWidget {

  static const routeName = '/leaveHistory';

  static route() => MaterialPageRoute(builder: (_) => LeaveHistory());


  const LeaveHistory({Key? key}) : super(key: key);

  @override
  _LeaveHistoryState createState() => _LeaveHistoryState();
}

class _LeaveHistoryState extends State<LeaveHistory> {


  var repository = BuroRepository();
  List<LeaveHistoryModelData> _data = [];
  List<Map<String, dynamic>> _allItems = [];
  String supervisorName = '';
  String user = '';
  bool noDataFound = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorResources.WHITE),
        backgroundColor: ColorResources.APP_THEME_COLOR,
        title: Center(
          child: Text(
            'Leave History',
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


                 /* String applieddate =
                  DateFormat.yMMMMd('en_US')
                      .format(DateTime.parse(item.appliedDate!));*/
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('Applied Date',
                                      style: GoogleFonts.inter(
                                        fontWeight:
                                        FontWeight.w500,
                                        fontSize: 14,
                                        color: ColorResources
                                            .GREY_NINETY,
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text("${item.appliedDate}",
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
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Container(
                                        child: Text('Address',
                                          style: GoogleFonts.inter(
                                            fontWeight:
                                            FontWeight.w500,
                                            fontSize: 14,
                                            color: ColorResources
                                                .GREY_NINETY,
                                          ),


                                        ),

                                      ),
                                      SizedBox(height: 5,),
                                      Text('${item.mailingAddress}')

                                    ],),
                                ),
                                Flexible(
                                  flex: 2,
                                  child:  Container(
                                    width: 130,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          child: Text('Reason',
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
                                        Text('${item.leaveRequestComments}  ')

                                      ],),
                                  ),
                                ),



                              ],),
                            SizedBox(height: 10),

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


  @override
  void initState() {
    super.initState();




    fetchData();
  }

  Future<void> fetchData() async {
    print('Fetch data called');



    try {
      final result =
      await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {

        LeaveHistoryModel response = await repository.getLeaveHistoryList();

        noDataFound = response.data.isNotEmpty? false :true;

        setState(() {
          _data = response.data;
        });

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

  Future<void> _onRefresh() async {
    print(' On refresh called');
    fetchData();
  }
}
