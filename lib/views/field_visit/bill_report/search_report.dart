import 'package:buro_employee/repository/models/bill_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../localization/Language/languages.dart';
import '../../../repository/bloc/bill_report_bloc/bill_report_bloc_cubit.dart';
import '../../../theme/colors.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import '../../../theme/styles.dart';
import 'package:flutter/src/material/date_picker.dart';

import 'package:intl/intl.dart';

import 'bill_report.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SearchFilterReport extends StatefulWidget {

  static const routeName = '/reportSearchFilter';
  static route() => MaterialPageRoute(builder: (_) => SearchFilterReport());
  const SearchFilterReport({Key? key}) : super(key: key);

  @override
  _SearchReportState createState() => _SearchReportState();
}

class _SearchReportState extends State<SearchFilterReport> {

  String _currentSelectedValueStatus = '';

  var _dropdownStatus =['Pending','Approved','Rejected'];

  final startDateControllerFrom = TextEditingController();
  final endDateControllerFrom = TextEditingController();
  final startDateControllerTo = TextEditingController();
  final endDateControllerTo = TextEditingController();
  late DateTime? startDateFrom;
  late DateTime? startDateTo;
  late DateTime? endDateFrom;
  late DateTime? endDateTo;
  final dateFormat = DateFormat("MM/dd/yyyy");
  late BillReportBlocCubit billReportBlocCubit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Filter'),
        backgroundColor: ColorResources.APP_THEME_COLOR,
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 25,right: 25,top: 25,bottom: 25),
        child: Column(

          children: [
          Padding(
            padding: const EdgeInsets.only(top: 25,bottom: 25),
            child: DropdownButtonFormField<
                String>(
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
                hintText: 'Select Status',
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
              value: _currentSelectedValueStatus,
              //isDense: true,
              isExpanded: true,
              onChanged: (value) {
                _currentSelectedValueStatus =
                value!;
                //billReportBlocCubit.statusPosition = value.
                setState(() {});
              },
              items: _dropdownStatus
                  .map((String item) {
                return DropdownMenuItem(
                  child: Text(
                    item,
                    style: TextStyle(
                        color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                  value: item,
                );
              }).toList(),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
                'Start Date Between'),
          ),
            SizedBox(height: 10,),
          Row(
            children: [
              Flexible(
                child: DateTimeField(
                  // Start Date
                  controller: startDateControllerFrom,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 5, vertical: 20),
                    filled: true,
                    fillColor:
                    ColorResources.TEXT_FIELD_COLOR,
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: ColorResources
                                .APP_THEME_COLOR,
                            style: BorderStyle.solid,
                            width: 2)),
                    enabledBorder:
                    const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ColorResources
                              .TEXT_FIELD_BORDER_COLOR,
                          width: 0.0),
                    ),
                    hintText: Languages.of(context)!.date,
                    hintStyle: Styles.hintTextStyle,
                  ),
                  style: Styles.mediumTextStyle,
                  format: dateFormat,
                  onChanged: (date) {
                    print('Date $date');
                    if (date != null)
                      startDateFrom = date;
                    else
                      startDateFrom = null;
                  },
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ??
                            DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                ),
              ) ,
              SizedBox(width: 10,),
              Flexible(
                 flex: 1,
                 child:  DateTimeField(
               // Start Date
               controller: startDateControllerTo,
               decoration: InputDecoration(
                 isDense: true,
                 contentPadding: EdgeInsets.symmetric(
                     horizontal: 5, vertical: 20),
                 filled: true,
                 fillColor:
                 ColorResources.TEXT_FIELD_COLOR,
                 border: OutlineInputBorder(
                     borderRadius:
                     BorderRadius.circular(8),
                     borderSide: BorderSide(
                         color: ColorResources
                             .APP_THEME_COLOR,
                         style: BorderStyle.solid,
                         width: 2)),
                 enabledBorder:
                 const OutlineInputBorder(
                   borderSide: const BorderSide(
                       color: ColorResources
                           .TEXT_FIELD_BORDER_COLOR,
                       width: 0.0),
                 ),
                 hintText: Languages.of(context)!.date,
                 hintStyle: Styles.hintTextStyle,
               ),
               style: Styles.mediumTextStyle,
               format: dateFormat,
               onChanged: (date) {
                 print('Date $date');
                 if (date != null)
                   startDateTo = date;
                 else
                   startDateTo = null;
               },
               onShowPicker: (context, currentValue) {
                 return showDatePicker(
                     context: context,
                     firstDate: DateTime(1900),
                     initialDate: currentValue ??
                         DateTime.now(),
                     lastDate: DateTime(2100));
               },
             ))


          ],),
          SizedBox(height: 15,),
          Align(
            alignment: Alignment.centerLeft,
              child: Text('End Date Between')),
          SizedBox(height: 10,),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: DateTimeField(
                  // Start Date
                  controller: endDateControllerFrom,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 5, vertical: 20),
                    filled: true,
                    fillColor:
                    ColorResources.TEXT_FIELD_COLOR,
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: ColorResources
                                .APP_THEME_COLOR,
                            style: BorderStyle.solid,
                            width: 2)),
                    enabledBorder:
                    const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ColorResources
                              .TEXT_FIELD_BORDER_COLOR,
                          width: 0.0),
                    ),
                    hintText: Languages.of(context)!.date,
                    hintStyle: Styles.hintTextStyle,
                  ),
                  style: Styles.mediumTextStyle,
                  format: dateFormat,
                  onChanged: (date) {
                    print('Date $date');
                    if (date != null)
                      endDateFrom = date;
                    else
                      endDateFrom = null;
                  },
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ??
                            DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                ),
              ) ,
              SizedBox(width: 10,),
              Flexible(
                flex: 1,
                child: DateTimeField(
                  // Start Date
                  controller: endDateControllerTo,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 5, vertical: 20),
                    filled: true,
                    fillColor:
                    ColorResources.TEXT_FIELD_COLOR,
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: ColorResources
                                .APP_THEME_COLOR,
                            style: BorderStyle.solid,
                            width: 2)),
                    enabledBorder:
                    const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ColorResources
                              .TEXT_FIELD_BORDER_COLOR,
                          width: 0.0),
                    ),
                    hintText: Languages.of(context)!.date,
                    hintStyle: Styles.hintTextStyle,
                  ),
                  style: Styles.mediumTextStyle,
                  format: dateFormat,
                  onChanged: (date) {
                    print('Date $date');
                    if (date != null)
                      endDateTo = date;
                    else
                      endDateTo = null;
                  },
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ??
                            DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                ),
              )
            ],),
          SizedBox(height: 20,),
          Container(
            width: double.infinity,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: ColorResources.APP_THEME_COLOR,
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {
                     /* print('select designation Id ${selectDesignationId}\n'
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

                      billReportBlocCubit.activityStatus = _currentSelectedValueStatus;
                      billReportBlocCubit.startDateFrom = startDateControllerFrom.text;
                      billReportBlocCubit.startDateTo = startDateControllerTo.text;
                      billReportBlocCubit.endDateFrom = endDateControllerFrom.text;
                      billReportBlocCubit.endDateTo = endDateControllerTo.text;

                      Navigator.pushNamed(
                          context,
                          BillReport
                              .routeName,
                          arguments: ReportFilter('',_currentSelectedValueStatus,startDateControllerFrom.text,
                            startDateControllerTo.text,endDateControllerFrom.text,endDateControllerTo.text));



                    },
                    child: Container(
                        height: 56,
                        child: Center(
                            child: Text(
                              'Search',
                              style: Styles.buttonTextStyle,
                            )))),
              ),
            ),
          ),

        ],),
      ),
    );
  }

  @override
  initState(){

    billReportBlocCubit = context.read<BillReportBlocCubit>();


    if(billReportBlocCubit.activityStatus == 'Pending'){
      _currentSelectedValueStatus = _dropdownStatus[0];
    } else if (billReportBlocCubit.activityStatus == 'Approved'){
      _currentSelectedValueStatus = _dropdownStatus[1];
    } else if (billReportBlocCubit.activityStatus == 'Rejected'){
      _currentSelectedValueStatus = _dropdownStatus[2];
    } else {
      _currentSelectedValueStatus = _dropdownStatus[0];
    }


     //_currentSelectedValueStatus = ;
    startDateControllerFrom.text = billReportBlocCubit.startDateFrom;
    startDateControllerTo.text = billReportBlocCubit.startDateTo ;
    endDateControllerFrom.text = billReportBlocCubit.endDateFrom ;
    endDateControllerTo.text = billReportBlocCubit.endDateTo;


    super.initState();
   }


}


