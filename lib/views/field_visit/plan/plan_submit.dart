import 'dart:io';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:buro_employee/localization/Language/languages.dart';
import 'package:buro_employee/repository/database/database_handler.dart';
import 'package:buro_employee/repository/models/branch.dart';
import 'package:buro_employee/repository/network/buro_repository.dart';
import 'package:buro_employee/sessionmanager/session_manager.dart';
import 'package:buro_employee/theme/colors.dart';
import 'package:buro_employee/theme/styles.dart';
import 'package:buro_employee/utilities/common_methods.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/date_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../field_visit_main.dart';

class PlanSubmit extends StatefulWidget {
  static const routeName = '/planSubmit';
 static route() => MaterialPageRoute(builder: (_) => PlanSubmit());


  const PlanSubmit({Key? key}) : super(key: key);

  @override
  _PlanSubmitState createState() => _PlanSubmitState();
}

class _PlanSubmitState extends State<PlanSubmit> {
  final dateFormat = DateFormat("yyyy-MM-dd");
  final timeFormat = DateFormat("hh:mm a");
  late DateTime? startDate;
  late DateTime? endDate;


  late DateTime startTime;
  late DateTime endTime;
  //String startTime = '00:00:00';
  //String endTime = '00:00:00';
  String startPlace = '';
  String endPlace = '';
  String fromBranch = '';
  String fromOther = '';
  String toBranch = '';
  String toOther = '';
  String reason = '';
  String transportBy = '';

  bool isChecked = false;

  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final reasonController = TextEditingController();
  final transportController = TextEditingController();

  final fromBranchController = TextEditingController();
  final fromOtherController = TextEditingController();
  final toBranchController = TextEditingController();
  final toOtherController = TextEditingController();
  var repository = BuroRepository();
  late SessionManager sessionManager;
  String supervisorName = '';
  int _currentIndex = 0;
  var selectedLang;
  late DataBaseHandler handler;
  List<Item> branchSuggestion = [];
  GlobalKey<AutoCompleteTextFieldState<Item>> keyFromBranch = GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<Item>> keyToBranch = GlobalKey();
  TextEditingController controller = TextEditingController();

  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();

  String formattedTimeStart = '00:00:00';
  String formattedTimeEnd = '00:00:00';

  Container firstItem() {
    return Container();
  }

  Widget secondItem() {
    return Container(
      color: Colors.blueAccent,
    );
  }

  @override
  void initState() {
    sessionManager = SessionManager();
    this.handler = DataBaseHandler.instance;
    getSuperVisorInfo().then((value) => {
          supervisorName = value,
          setState(() {}),
        });

    getSelectedLang().then((value) => {
          selectedLang = value,
          print('Selected Lang in plan submit ${value.toString()}')
        });

    getBranchListFromDatabase().then((value) => () {
          //print('Value Length ${value.length}');
          value.asMap().forEach((key, value) {
            //print(" Branch Name ${value.name}");
          });
        });

    super.initState();
  }

  Future<String> getSelectedLang() async {
    return await sessionManager.selectedLang;
  }

  Future<String> getSuperVisorInfo() async {
    return await sessionManager.supervisorInfo;
  }

  Future<List<Item>> getBranchListFromDatabase() async {
    // Get Branch List from database
    final db = await handler.initializeDBBranch();
    late List<Map<String, dynamic>> maps;
    try {
      maps = await db.query('branch');
      var nameList;
      var item;
      var count = 0;
      maps.asMap().forEach((index, value) => {
            //print("Index $index Value ${value['name']}"),
            item = Item('$index', value['name']),
            branchSuggestion.add(item),
            count++,
          });
      //print('suggestion length ${branchSuggestion.length} $count');
    } catch (Exc) {
      print('Exception $Exc');
    }

    return branchSuggestion;
  }

  @override
  Widget build(BuildContext context) {
    final List<Container> _children = [
      Container(
        width: double.infinity,
        height: 240,
        decoration: BoxDecoration(
          color: ColorResources.WHITE,
          border: Border.all(
              color: ColorResources.TEXT_FIELD_BORDER_COLOR, width: 1),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(4), bottomLeft: Radius.circular(4)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Languages.of(context)!.fromBranch,
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: ColorResources.GREY_NINETY)),
              SizedBox(
                height: 5,
              ),
              AutoCompleteTextField<Item>(
                key: keyFromBranch,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorResources.GREY_TWENTY,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: ColorResources.APP_THEME_COLOR,
                            style: BorderStyle.solid,
                            width: 2)),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ColorResources.TEXT_FIELD_BORDER_COLOR,
                          width: 0.0),
                    )),
                suggestions: branchSuggestion,
                itemBuilder: (context, suggestion) => ListTile(
                  title: Text(suggestion.name),
                ),
                itemSorter: (a, b) => 0,
                /*a.id == b.id
                    ? 0
                    : a.id > b.id
                    ? -1
                    : 1,*/
                itemSubmitted: (item) {
                  print("Item ${item.name}");

                  setState(() {
                    fromBranchController.text = item.name;
                  });
                  //setState(() => textField!.controller!.text = item.name);
                },
                itemFilter: (suggestion, input) => suggestion.name
                    .toLowerCase()
                    .startsWith(input.toLowerCase()),
                controller: fromBranchController,
                clearOnSubmit: false,
              ),
              SizedBox(
                height: 10,
              ),
              Text(Languages.of(context)!.fromOther,
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: ColorResources.GREY_NINETY)),
              SizedBox(
                height: 5,
              ),
              Container(
                // color: Colors.red,
                //height: 56,
                child: TextFormField(
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
                    hintText: '',
                    hintStyle: Styles.hintTextStyle,
                    contentPadding: EdgeInsets.all(20),
                  ),
                  controller: fromOtherController,
                ),
              )
            ],
          ),
        ),
      ), //1
      Container(
        width: double.infinity,
        height: 240,
        decoration: BoxDecoration(
          color: ColorResources.WHITE,
          border: Border.all(
              color: ColorResources.TEXT_FIELD_BORDER_COLOR, width: 1),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(4), bottomLeft: Radius.circular(4)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Languages.of(context)!.toBranch,
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: ColorResources.GREY_NINETY)),
              SizedBox(
                height: 5,
              ),
              AutoCompleteTextField<Item>(
                key: keyToBranch,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorResources.GREY_TWENTY,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: ColorResources.APP_THEME_COLOR,
                            style: BorderStyle.solid,
                            width: 2)),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ColorResources.TEXT_FIELD_BORDER_COLOR,
                          width: 0.0),
                    )),
                suggestions: branchSuggestion,
                itemBuilder: (context, suggestion) => Padding(
                    child: ListTile(
                      title: Text(suggestion.name),
                    ),
                    padding: EdgeInsets.all(8.0)),
                itemSorter: (a, b) => 0,
                /*a.id == b.id
                    ? 0
                    : a.id > b.id
                    ? -1
                    : 1,*/
                itemSubmitted: (item) {
                  print("Item ${item.name}");

                  setState(() {
                    toBranchController.text = item.name;
                  });
                  //setState(() => textField!.controller!.text = item.name);
                },
                itemFilter: (suggestion, input) => suggestion.name
                    .toLowerCase()
                    .startsWith(input.toLowerCase()),
                controller: toBranchController,
                clearOnSubmit: false,
              ),
              SizedBox(
                height: 10,
              ),
              Text(Languages.of(context)!.toOther,
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      color: ColorResources.GREY_NINETY)),
              SizedBox(
                height: 5,
              ),
              Container(
                child: TextFormField(
                  enableSuggestions: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorResources.TEXT_FIELD_COLOR,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: ColorResources.APP_THEME_COLOR,
                            style: BorderStyle.solid,
                            width: 2)),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ColorResources.TEXT_FIELD_BORDER_COLOR,
                          width: 0.0),
                    ),
                    hintText: '',
                    hintStyle: Styles.hintTextStyle,
                    contentPadding: EdgeInsets.all(20),
                  ),
                  controller: toOtherController,
                ),
              )
            ],
          ),
        ),
      ), //2
      //FieldVisitMain() //3
    ];

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: ColorResources.WHITE),
          backgroundColor: ColorResources.APP_THEME_COLOR,
          title: Center(
              child: Text(
            Languages.of(context)!.planSubmit,
            style: Styles.appBarTextStyle,
          )),
        ),
        body: Builder(
          builder: (context) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(27),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: ColorResources.RECEIPIENT_BACKGROUD,
                            border: Border.all(
                                color: ColorResources.APP_THEME_COLOR,
                                width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(
                              10,
                            )),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Recipient',
                                  style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      color: ColorResources.GREY_DARK_SIXTY),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  ' $supervisorName ',
                                  style: Styles.listHeaderTextStyle,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Text(
                                              '${Languages.of(context)!.visitStart}',
                                              style: GoogleFonts.inter(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  color: ColorResources
                                                      .GREY_NINETY),
                                            ),
                                          )),

                                      DateTimeField(
                                        // Start Date
                                        controller: startDateController,
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
                                            startDate = date;
                                          else
                                            startDate = null;
                                        },
                                        onShowPicker: (context, currentValue) {
                                          return showDatePicker(
                                              context: context,
                                              firstDate: DateTime(1900),
                                              initialDate: currentValue ??
                                                  DateTime.now(),
                                              lastDate: DateTime(2100));
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Text(
                                              '${Languages.of(context)!.visitEnd}',
                                              style: GoogleFonts.inter(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal),
                                            ),
                                          )),

                                      DateTimeField(
                                        onChanged: (date) {
                                          if (date != null)
                                            endDate = date;
                                          else
                                            endDate = null;
                                        },
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
                                        format: dateFormat,
                                        controller: endDateController,
                                        style: Styles.mediumTextStyle,
                                        onShowPicker: (context, currentValue) {
                                          return showDatePicker(
                                              context: context,
                                              firstDate: DateTime(1900),
                                              initialDate: currentValue ??
                                                  DateTime.now(),
                                              lastDate: DateTime(2100));
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                        SizedBox(
                          height: 5,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              flex: 1,
                              fit: FlexFit.loose,
                              child:  Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${Languages.of(context)!.startTime}',
                                    style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        color: ColorResources
                                            .GREY_NINETY),
                                  )),
                            ),
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5, left: 10),
                                child:  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${Languages.of(context)!.endTime}',
                                      style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          color: ColorResources
                                              .GREY_NINETY),
                                    )),
                              ),
                            ),

                          ],),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              flex: 1,
                              fit: FlexFit.loose,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Container(
                                  // height: 56,
                                  child: DateTimeField(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 18),
                                      filled: true,
                                      // fillColor: ColorResources.TEXT_FIELD_COLOR,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              color: ColorResources.APP_THEME_COLOR,
                                              style: BorderStyle.solid,
                                              width: 2)),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ColorResources
                                                .TEXT_FIELD_BORDER_COLOR,
                                            width: 0.0),
                                      ),
                                      hintText: Languages.of(context)!.time,
                                      hintStyle: Styles.hintTextStyle,
                                    ),
                                    style: Styles.mediumTextStyle,
                                    onChanged: (time) {
                                      startTime = time!;
                                    },
                                    format: timeFormat,
                                    controller: startTimeController,
                                    onShowPicker: (context, currentValue) async {
                                      final TimeOfDay? time = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            currentValue ?? DateTime.now()),
                                      );
                                      return time == null
                                          ? null
                                          : DateTimeField.convert(time);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5, left: 10),
                                child: Container(
                                  child: DateTimeField(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 18),
                                      filled: true,
                                     // fillColor: ColorResources.TEXT_FIELD_COLOR,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              color: ColorResources.APP_THEME_COLOR,
                                              style: BorderStyle.solid,
                                              width: 2)),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ColorResources
                                                .TEXT_FIELD_BORDER_COLOR,
                                            width: 0.0),
                                      ),
                                      hintText: Languages.of(context)!.time,
                                      hintStyle: Styles.hintTextStyle,
                                    ),
                                    onChanged: (time) {
                                      endTime = time!;
                                    },
                                    format: timeFormat,
                                    controller: endTimeController,
                                    style: Styles.mediumTextStyle,
                                    onShowPicker: (context, currentValue) async {
                                      final TimeOfDay? time = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            currentValue ?? DateTime.now()),
                                      );
                                      return time == null
                                          ? null
                                          : DateTimeField.convert(time);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _currentIndex == 0
                                      ? ColorResources.APP_THEME_COLOR
                                      : ColorResources.WHITE,
                                  border: Border.all(
                                      color: ColorResources
                                          .APP_THEME_COLOR,
                                      width: 1),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(4),
                                      topLeft: Radius.circular(4)),
                                ),
                                child: InkWell(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Text(
                                          '${Languages.of(context)!.fromPlace}',
                                          style: GoogleFonts.inter(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.normal,
                                            color:  _currentIndex == 0
                                                ? ColorResources.WHITE
                                                : ColorResources.BLACK,),
                                        ),
                                      )),
                                  onTap: () {
                                    setState(() {
                                      _currentIndex = 0;
                                    });
                                  },
                                ),
                              ),
                              flex: 1,
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _currentIndex == 1
                                      ? ColorResources.APP_THEME_COLOR
                                      : ColorResources.WHITE,
                                  border: Border.all(
                                      color: ColorResources
                                          .APP_THEME_COLOR,
                                      width: 1),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(4),
                                      topLeft: Radius.circular(4)),
                                ),
                                child: InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${Languages.of(context)!.toPlace}',
                                          style: GoogleFonts.inter(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.normal,
                                            color: _currentIndex == 1
                                                ? ColorResources.WHITE
                                                : ColorResources.BLACK,),
                                        )),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _currentIndex = 1;
                                    });
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: 240,
                          child: _children[_currentIndex],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${Languages.of(context)!.visitReason}',
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            // color: Colors.red,
                            height: 65,
                            child: TextFormField(
                              enableSuggestions: true,
                              controller: reasonController,
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
                                      color: ColorResources
                                          .TEXT_FIELD_BORDER_COLOR,
                                      width: 0.0),
                                ),
                                hintText: '',
                                hintStyle: Styles.hintTextStyle,
                                contentPadding: EdgeInsets.all(20),
                              ),

                              maxLines: 1,
                              onChanged: (value) {
                                reason = value;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorResources.APP_THEME_COLOR,
                                minimumSize: const Size.fromHeight(50), // NEW
                                elevation: 0),
                            onPressed: () async {
                              // start brac
                              var startDateFormat;
                              var endDateFormat;
                              var map;

                              if ((startDateController.text.isNotEmpty &&
                                  endDateController.text.isNotEmpty)) {

                                //startTime.toString().substring(11,19)
                                //endTime.toString().substring(11,19)
                                startDateFormat = DateTime.parse(
                                    '${startDateController.text}T00:00:00');
                                endDateFormat = DateTime.parse(
                                    '${endDateController.text}T00:00:00');
                              }

                              if (startDateController.text.isEmpty) {
                                CommonMethods.showMessage(
                                    context,
                                    Languages.of(context)!
                                        .startEndDateValidationText,
                                    Colors.red);
                              } else if (endDateController.text.isEmpty) {
                                CommonMethods.showMessage(
                                    context,
                                    Languages.of(context)!
                                        .startEndDateValidationText,
                                    Colors.red);
                              } else if ((startDateController.text.isNotEmpty &&
                                      endDateController.text.isNotEmpty) &&
                                  startDateFormat.isAfter(endDateFormat)) {
                                CommonMethods.showMessage(
                                    context,
                                    '${Languages.of(context)!.dateRangeValidationText}',
                                    Colors.red);
                              } else if (startTimeController.text.isNotEmpty && endTimeController.text.isEmpty){

                                CommonMethods.showMessage(
                                    context,
                                    '${Languages.of(context)!.timeValidationText}',
                                    Colors.red);

                              } else if (fromBranchController.text.isEmpty &&
                                  fromOtherController.text.isEmpty) {
                                CommonMethods.showMessage(
                                    context,
                                    Languages.of(context)!
                                        .fromPlaceToPlaceValidationText,
                                    Colors.red);
                              } else if (toBranchController.text.isEmpty &&
                                  toOtherController.text.isEmpty) {
                                CommonMethods.showMessage(
                                    context,
                                    Languages.of(context)!
                                        .fromPlaceToPlaceValidationText,
                                    Colors.red);
                              } else if (reasonController.text.isEmpty) {
                                CommonMethods.showMessage(
                                    context,
                                    Languages.of(context)!.reasonValidationText,
                                    Colors.red);
                              } else {
                                var fromPlace;
                                var toPlace;

                                if (fromBranchController.text.isEmpty) {
                                  fromPlace = fromOtherController.text;
                                } else if (fromOtherController.text.isEmpty) {
                                  fromPlace = fromBranchController.text;
                                } else {
                                  fromPlace =
                                      '${fromBranchController.text}, ${fromOtherController.text}';
                                }

                                if (toBranchController.text.isEmpty) {
                                  toPlace = toOtherController.text;
                                } else if (toOtherController.text.isEmpty) {
                                  toPlace = toBranchController.text;
                                } else {
                                  toPlace =
                                      '${toBranchController.text}, ${toOtherController.text}';
                                }

                               /* map = {
                                  "StartDate": startDateController.text,
                                  "EndDate": endDateController.text,
                                  "FromPlace": fromPlace,
                                  "ToPlace": toPlace,
                                  "Reason": reasonController.text
                                }; */

                                //if(startTime)
                                var startTimeApiFormat;
                              if(startTimeController.text.isNotEmpty && endTimeController.text.isNotEmpty) {

                                 /* formattedTimeStart = DateFormat('hh:mm a').format(startTime );
                                   formattedTimeEnd = DateFormat('hh:mm a').format(endTime);*/

                                print('Start Time ${startTime}');

                                  formattedTimeStart = startTime.toString().substring(11,19);
                                  formattedTimeEnd = endTime.toString().substring(11,19);

                                /*DateTime startTimeNew =
                                DateFormat.jm().parse(startTime.toString());*/

                               /* startTimeApiFormat =
                                DateFormat("HH:mm").format(startTime);*/
                                 print("formattedTimeStart $formattedTimeStart formattedTimeEnd $formattedTimeEnd");
                               // print("formattedTimeEnd $formattedTimeEnd formattedTimeEnd $formattedTimeEnd");


                              }


                                map = {
                                  "StartDate": "${startDateController.text}T${formattedTimeStart}Z",
                                  "EndDate": '${endDateController.text}T${formattedTimeEnd}Z',
                                  "FromPlace": fromPlace,
                                  "ToPlace": toPlace,
                                  "Reason": reasonController.text
                                };

                                  /* print('startDate ${startDateFormat} '
                                    'endDate ${endDateFormat} '
                                    'From Place ${fromBranchController.text} '
                                    'from place other ${fromOtherController.text}'
                                    'to place ${toBranchController.text}'
                                    'to other ${toOtherController.text}'
                                    'Reason ${reasonController.text}');*/

                                print(map);

                                showLoaderDialog(context);

                                try {
                                  final result = await InternetAddress.lookup(
                                      'google.com');
                                  if (result.isNotEmpty &&
                                      result[0].rawAddress.isNotEmpty) {
                                    repository.submitPlan(map).then((value) => {
                                          if (value.success)
                                            {
                                              if (selectedLang
                                                  .toString()
                                                  .isEmpty)
                                                {
                                                  CommonMethods.showMessage(
                                                      context,
                                                      value.messageEn,
                                                      Colors.green),
                                                }
                                              else
                                                {
                                                  CommonMethods.showMessage(
                                                      context,
                                                      selectedLang == 'en'
                                                          ? value.messageEn
                                                          : value.messageBn,
                                                      Colors.green),
                                                },
                                              Navigator.pop(context),
                                              /*  clearText(),
                                              setState(() {})*/
                                              Navigator.pushNamed(context,
                                                  FieldVisitMain.routeName)
                                            }
                                          else
                                            {
                                              if (selectedLang
                                                  .toString()
                                                  .isEmpty)
                                                {
                                                  Navigator.pop(context),
                                                  CommonMethods.showMessage(
                                                      context,
                                                      value.messageEn,
                                                      Colors.red),
                                                }
                                              else
                                                {
                                                  Navigator.pop(context),
                                                  CommonMethods.showMessage(
                                                      context,
                                                      selectedLang == 'en'
                                                          ? value.messageEn
                                                          : value.messageBn,
                                                      Colors.red),
                                                }
                                            }
                                        });

                                    //print('connected');
                                  }
                                } on SocketException catch (_) {
                                  print('not connected');
                                  Navigator.pop(context);
                                  CommonMethods.showMessage(
                                      context,
                                      Languages.of(context)!.internetErrorText,
                                      Colors.red);
                                }
                              }
                            }, //end Brac
                            child: Text(
                              '${Languages.of(context)!.submitButton}',
                              style: Styles.buttonTextStyle,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ));
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

  void clearText() {
    startDateController.text = '';
    endDateController.text = '';
    reasonController.text = '';
    fromBranchController.text = '';
    fromOtherController.text = '';
    toBranchController.text = '';
    toOtherController.text = '';
  }


  @override
  void dispose() {

    startDateController.dispose();
    endDateController.dispose();
    reasonController.dispose();
    transportController.dispose();
    fromBranchController.dispose();
    fromOtherController.dispose();
    toBranchController.dispose();
    toOtherController.dispose();
    super.dispose();
  }
}
