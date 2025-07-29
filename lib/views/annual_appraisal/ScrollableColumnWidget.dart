import 'package:buro_employee/repository/bloc/apa_emp_info/apa_emp_info_cubit.dart';
import 'package:buro_employee/repository/bloc/apa_target_score/apa_target_score_cubit.dart';
import 'package:buro_employee/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../repository/bloc/apa_employee_score/apa_emp_score_cubit.dart';
import '../../repository/bloc/apa_hr_score/apa_hr_score_cubit.dart';
import '../../repository/models/annual_appraisal.dart';
import '../../theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ScrollableColumnWidget extends StatefulWidget {
  ScrollableColumnWidget(this.score, this.inputActive, this.priorityNumb);

  final List<EmpScoreData> score;
  final int inputActive;
  final int priorityNumb;

  @override
  State<ScrollableColumnWidget> createState() => _ScrollableColumnWidgetState();
}

class _ScrollableColumnWidgetState extends State<ScrollableColumnWidget> {
  late ApaEmpScoreCubit scoreCubit;


  @override
  void initState() {
    scoreCubit = context.read<ApaEmpScoreCubit>();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    var columnList = <DataColumn>[];
    columnList.add(DataColumn(label: Container(width: 40, child: Text('নম্বর'))));

    columnList.add(DataColumn(
        label: Container(
            width: 50,
            child: Text(
              'কর্মী\nনিজে',
              softWrap: true,
            ))));

    if (widget.score[0].evScore1 != null) {
      columnList.add(DataColumn(
          label: Container(
              width: 50,
              child: Text(
                'তত্ত্বাবধায়ক',
                softWrap: true,
              ))));
    }

    if (widget.score[0].evScore2 != null) {
      columnList.add(DataColumn(
          label: Container(
              width: 50,
              child: Text(
                'এলাকা\nব্যবস্থাপক',
                softWrap: true,
              ))));
    }

    if (widget.score[0].evScore5 != null) {
      columnList.add(DataColumn(
          label: Container(
              width: 50,
              child: Text(
                'আঞ্চলিক\nব্যবস্থাপক',
                softWrap: true,
              ))));
    }

    if( scoreCubit.controllerMap.length == 0){
     widget.score.forEach((element) {
       if(element.quesionId != null){
         scoreCubit.addControllerItem(element.quesionId!,TextEditingController() );
       }
     });
   }
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            DataTable(
                headingRowColor: MaterialStateProperty.all(Colors.green[100]),
                columnSpacing: 5,
                showBottomBorder: true,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                ),
                columns: [
                  DataColumn(label: Container(width: 40, child: Text('নম্বর'))),
                  DataColumn(
                      label: Container(
                          width: 50,
                          child: widget.priorityNumb == 1
                              ? Text(
                                  'মূল্যায়ন',
                                  softWrap: true,
                                )
                              : Text(
                                  'কর্মী\nনিজে',
                                  softWrap: true,
                                ))),
                  DataColumn(
                      label: Container(
                          width: 90,
                          child: widget.priorityNumb == 2
                              ? Text(
                                  'মূল্যায়ন',
                                  softWrap: true,
                                )
                              : Text(
                                  'তত্ত্বাবধায়ক',
                                  softWrap: true,
                                ))),
                  DataColumn(
                      label: Container(
                          width: 75,
                          child: widget.priorityNumb == 5
                              ? Text(
                                  'মূল্যায়ন',
                                  softWrap: true,
                                )
                              : Text(
                                  'এলাকা\nব্যবস্থাপক',
                                  softWrap: true,
                                ))),
                  DataColumn(
                      label: Container(
                          width: 75,
                          child: widget.priorityNumb == 6
                              ? Text(
                                  'মূল্যায়ন',
                                  softWrap: true,
                                )
                              : Text(
                                  'আঞ্চলিক\nব্যবস্থাপক',
                                  softWrap: true,
                                ))),
                ],
                rows: [
                  ...widget.score.map((team) => DataRow(
                        cells: [
                          DataCell(Container(
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                team.outofscore.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))),
                          team.evScore1 != null
                              ? DataCell(Container(
                                  alignment: AlignmentDirectional.center,
                                  child: Text(
                                    team.evScore1.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )))
                              : DataCell(Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 0, top: 5, bottom: 5),
                                    child: TextFormField(
                                      enabled: widget.priorityNumb == 1 &&
                                              widget.inputActive == -1
                                          ? true
                                          : false,
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor:
                                              ColorResources.TEXT_FIELD_COLOR,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
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
                                          hintText: team.evScore1 != null
                                              ? team.evScore1.toString()
                                              : '',
                                          hintStyle: Styles.hintTextStyle,
                                          enabled: false),
                                      keyboardType: TextInputType.numberWithOptions(decimal: true,signed: true),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(3),
                                        LimitRange(0, widget.score[0].outofscore!),
                                      ],
                                      controller: widget.priorityNumb == 1 &&
                                             widget.inputActive == -1
                                             ? scoreCubit.controllerMap[team.quesionId!]
                                             : null,
                                      onChanged: (value) {
                                        },


                                    ),
                                  ),
                                )),
                          team.evScore2 != null && widget.inputActive == -1
                              ? DataCell(Container(
                                  alignment: AlignmentDirectional.center,
                                  child: Text(
                                    team.evScore2.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )))
                              : team.evScore3 != null ? DataCell(Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 5, bottom: 5),
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                ColorResources.TEXT_FIELD_COLOR,
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                        color: ColorResources
                                            .APP_THEME_COLOR,
                                        style: BorderStyle.solid,
                                        width: 2)),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ColorResources
                                          .TEXT_FIELD_BORDER_COLOR,
                                      width: 0.0),
                                ),
                                hintText: team.evScore3 != null
                                    ? team.evScore3.toString()
                                    : '',
                                hintStyle: Styles.hintTextStyle,
                                enabled: false,
                              ),
                              keyboardType: TextInputType.numberWithOptions(decimal: true,signed: true),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(3),
                                LimitRange(0, widget.score[0].outofscore!),
                              ],
                              onChanged: (value) {

                              },
                            ),
                          )):DataCell(Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0, right: 0, top: 5, bottom: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor:
                                          ColorResources.TEXT_FIELD_COLOR,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: BorderSide(
                                              color: ColorResources
                                                  .APP_THEME_COLOR,
                                              style: BorderStyle.solid,
                                              width: 2)),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ColorResources
                                                .TEXT_FIELD_BORDER_COLOR,
                                            width: 0.0),
                                      ),
                                      hintText: team.evScore2 != null
                                          ? team.evScore2.toString()
                                          : '',
                                      hintStyle: Styles.hintTextStyle,
                                      enabled: false,
                                    ),
                                    enabled: widget.priorityNumb == 2 &&
                                            widget.inputActive == -1
                                        ? true
                                        : false,
                                    controller: widget.priorityNumb == 2 &&
                                        widget.inputActive == -1
                                        ? scoreCubit.controllerMap[team.quesionId!]
                                        : null ,
                                    keyboardType: TextInputType.numberWithOptions(decimal: true,signed: true),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(3),
                                      LimitRange(0, widget.score[0].outofscore!),
                                    ],
                                    onChanged: (value) {

                                    },
                                  ),
                                )),
                          team.evScore5 != null && widget.inputActive == -1
                              ? DataCell(Container(
                                  alignment: AlignmentDirectional.center,
                                  child: Text(
                                    team.evScore5.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )))
                              : DataCell(Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0, right: 0, top: 5, bottom: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor:
                                            ColorResources.TEXT_FIELD_COLOR,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: BorderSide(
                                                color: ColorResources
                                                    .APP_THEME_COLOR,
                                                style: BorderStyle.solid,
                                                width: 2)),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: ColorResources
                                                  .TEXT_FIELD_BORDER_COLOR,
                                              width: 0.0),
                                        ),
                                        hintText: team.evScore5 != null
                                            ? team.evScore5.toString()
                                            : '',
                                        hintStyle: Styles.hintTextStyle,
                                        enabled: false),
                                    enabled: widget.priorityNumb == 5 &&
                                            widget.inputActive == -1
                                        ? true
                                        : false,
                                    controller: widget.priorityNumb == 5 &&
                                        widget.inputActive == -1
                                        ? scoreCubit.controllerMap[team.quesionId!]
                                        : null,
                                    keyboardType: TextInputType.numberWithOptions(decimal: true,signed: true),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(3),
                                      LimitRange(0, widget.score[0].outofscore!),
                                    ],
                                    onChanged: (value) {

                                    },
                                  ),
                                )),
                          team.evScore6 != null && widget.inputActive == -1
                              ? DataCell(Container(
                                  alignment: AlignmentDirectional.center,
                                  child: Text(
                                    team.evScore6.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )))
                              : DataCell(Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0, right: 0, top: 5, bottom: 5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor:
                                            ColorResources.TEXT_FIELD_COLOR,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: BorderSide(
                                                color: ColorResources
                                                    .APP_THEME_COLOR,
                                                style: BorderStyle.solid,
                                                width: 2)),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: ColorResources
                                                  .TEXT_FIELD_BORDER_COLOR,
                                              width: 0.0),
                                        ),
                                        hintText: team.evScore6 != null
                                            ? team.evScore6.toString()
                                            : '',
                                        hintStyle: Styles.hintTextStyle,
                                        enabled: false),
                                    enabled: widget.priorityNumb == 6 &&
                                            widget.inputActive == -1
                                        ? true
                                        : false,
                                    controller: widget.priorityNumb == 6 &&
                                        widget.inputActive == -1
                                        ? scoreCubit.controllerMap[team.quesionId!]
                                        : null,

                                    keyboardType: TextInputType.numberWithOptions(decimal: true,signed: true),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(3),
                                      LimitRange(0, widget.score[0].outofscore!),
                                    ],

                                    onChanged: (value) {

                                    },
                                  ),
                                )),
                        ],
                      ))
                ]),
          ],
        ),
      ),
    );




  }


}



class ScrollableColumnWidgetTarget extends StatefulWidget {
  ScrollableColumnWidgetTarget(this.score,this.inputActive);

  final List<EmpTargetData> score;
  final int  inputActive;

  @override
  State<ScrollableColumnWidgetTarget> createState() => _ScrollableColumnWidgetTargetState();
}

class _ScrollableColumnWidgetTargetState extends State<ScrollableColumnWidgetTarget> {
  late ApaTargetScoreCubit targetScoreCubit;
  @override
  void initState() {
    targetScoreCubit = context.read<ApaTargetScoreCubit>();
   //targetScoreCubit.clearList();

    // add controller map
    if( targetScoreCubit.controllerMapTarget.length == 0){ // target
      widget.score.forEach((element) {
        if(element.atargetId != null){
          targetScoreCubit.addControllerItemTarget(element.atargetId!,TextEditingController() );
        }
      });
    }
    if( targetScoreCubit.controllerMapEarned.length == 0){  // earned
      widget.score.forEach((element) {
        if(element.atargetId != null){
          targetScoreCubit.addControllerItemEarned(element.atargetId!,TextEditingController() );
        }
      });
    }
    if( targetScoreCubit.controllerMapPercentage.length == 0){ //percentage
      widget.score.forEach((element) {
        if(element.atargetId != null){
          targetScoreCubit.addControllerItemPercentage(element.atargetId!,TextEditingController() );
        }
      });
    }
    if( targetScoreCubit.controllerMapScore.length == 0){ // score
      widget.score.forEach((element) {
        if(element.atargetId != null){
          targetScoreCubit.addControllerScore(element.atargetId!,TextEditingController() );
        }
      });
    }
    if( targetScoreCubit.controllerMapEarnedScore.length == 0){ // earned score
      widget.score.forEach((element) {
        if(element.atargetId != null){
          targetScoreCubit.addControllerItemEarnedScore(element.atargetId!,TextEditingController() );
        }
      });
    }


    // set controller map
    targetScoreCubit.controllerMapTarget.forEach((index,controller) { // target
      widget.score.forEach((trScore) {
        //print('isEmpty ${controller.text.isNotEmpty}');
        if(index == trScore.atargetId && controller.text != null && controller.text.isEmpty){
          controller.text = trScore.aqthTarget.toString();
        }else{
          controller.text = controller.value.text.toString();
        }
      });
    });
    targetScoreCubit.controllerMapEarned.forEach((index,controller) { // earned
      widget.score.forEach((trScore) {
        if(index == trScore.atargetId && controller.text != null && controller.text.isEmpty){
          controller.text = trScore.aEarned.toString();

        }
      });
    });
    targetScoreCubit.controllerMapPercentage.forEach((index,controller) { // percentage
      widget.score.forEach((trScore) {
        if(index == trScore.atargetId && controller.text != null && controller.text.isEmpty){
          controller.text = trScore.aparcentage.toString();
        }
      });
    });
    targetScoreCubit.controllerMapScore.forEach((index,controller) { // score
      widget.score.forEach((trScore) {
        if(index == trScore.atargetId && controller.text != null && controller.text.isEmpty){
          controller.text = trScore.ascore.toString();

        }
      });
    });
    targetScoreCubit.controllerMapEarnedScore.forEach((index,controller) { // earned score
      widget.score.forEach((trScore) {
        if(index == trScore.atargetId && controller.text != null && controller.text.isEmpty){
          controller.text = trScore.ascore.toString();
        }
      });
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var numberList = [];
    widget.score.asMap().forEach((index, value) => {
          numberList.add(value.atarget),

        });

    return widget.inputActive == -1 ?Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: FittedBox(
          child: DataTable(
              columnSpacing: 5,
              showBottomBorder: true,
              headingRowColor: MaterialStateProperty.all(Colors.green[100]),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
              ),
              columns: [
                DataColumn(
                    label: Container(
                        width: 70,
                        child: Text(
                          'লক্ষ্যমাত্রা',
                        ))),
                DataColumn(
                    label: Container(
                        width: 70,
                        child: Text(
                          'অর্জন',
                          textAlign: TextAlign.center,
                        ))),
                DataColumn(
                    label: Container(
                        width: 50,
                        child: Text('%', textAlign: TextAlign.center))),
                DataColumn(
                    label: Container(
                        width: 70,
                        child: Text(

                  'নম্বর',
                  textAlign: TextAlign.center,
                ))),
                DataColumn(
                    label: Container(
                        width: 70,
                        child: Text(
                  'প্রাপ্ত\nনম্বর',
                  textAlign: TextAlign.center,
                ))),
              ],
              rows: [
                ...widget.score.map((score) => DataRow(
                      cells: [
                        DataCell(  // Target লক্ষ্যমাত্রা
                            Container(
                            alignment: AlignmentDirectional.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 7,bottom: 7),
                              child: TextFormField(
                                enabled:  targetScoreCubit.controllerMapTarget[score.atargetId!]!.text == '0'? true:false,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                    ColorResources.TEXT_FIELD_COLOR,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(4),
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
                                    //hintText: score.aqthTarget.toString(),
                                    hintStyle: Styles.hintTextStyle,
                                    enabled: false),
                                keyboardType: TextInputType.number,
                                controller:  targetScoreCubit.controllerMapTarget[score.atargetId!]
                                   ,
                                onChanged: (value) {
                                },


                              ),
                            ))), // Target লক্ষ্যমাত্রা
                        DataCell(
                            Container(  // Earned অর্জন
                            alignment: AlignmentDirectional.center,
                            child:
                            Padding(
                              padding: const EdgeInsets.only(top: 7,bottom: 7),
                              child: TextFormField(
                                enabled:  targetScoreCubit.controllerMapTarget[score.atargetId!]!.text == '0'? true:false,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                    ColorResources.TEXT_FIELD_COLOR,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(4),
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
                                    //hintText: score.aEarned.toString(),
                                    hintStyle: Styles.hintTextStyle,
                                    enabled: false),

                                 keyboardType: TextInputType.number,
                                  controller:  targetScoreCubit.controllerMapEarned[score.atargetId!],
                                onChanged: (value) {
                                },
                              ),
                            ))), // Earned অর্জন
                        DataCell(Container(  // Percentage
                            alignment: AlignmentDirectional.center,
                            child:
                            Padding(
                              padding: const EdgeInsets.only(top: 7,bottom: 7),
                              child: TextFormField(
                                enabled:  targetScoreCubit.controllerMapPercentage[score.atargetId!]!.text == '0'? true:false,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                    ColorResources.TEXT_FIELD_COLOR,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(4),
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

                                    hintStyle: Styles.hintTextStyle,
                                    enabled: false),

                                 keyboardType: TextInputType.number,
                                controller:  targetScoreCubit.controllerMapPercentage[score.atargetId!],
                                onChanged: (value) {
                                },
                              ),
                            )
                        )), // Percentage
                        DataCell(Container(
                            alignment: AlignmentDirectional.center,
                            child:

                            Padding(
                              padding: const EdgeInsets.only(top: 7,bottom: 7),
                              child: TextFormField(
                                enabled:  false,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                    ColorResources.TEXT_FIELD_COLOR,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(4),
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

                                    hintStyle: Styles.hintTextStyle,
                                    enabled: false),

                                 keyboardType: TextInputType.number,
                                 controller:  targetScoreCubit.controllerMapScore[score.atargetId!],
                                onChanged: (value) {
                                },
                              ),
                            )

                        )), // Score
                        DataCell(
                            Container(
                            alignment: AlignmentDirectional.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 7,bottom: 7),
                              child: TextFormField(
                                enabled:  targetScoreCubit.controllerMapTarget[score.atargetId!]!.text == '0'? true:false,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                    ColorResources.TEXT_FIELD_COLOR,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(4),
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

                                    hintStyle: Styles.hintTextStyle,
                                    enabled: false),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(3),
                                  LimitRange(0, 6),
                                ],
                                 keyboardType: TextInputType.number,

                                controller:targetScoreCubit.controllerMapEarnedScore[score.atargetId!],
                                onChanged: (value) {
                                },
                              ),
                            )

                        )), // Earned Score
                      ],
                    ))
              ]),
        ),
      ),
    ): Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: FittedBox(
          child: DataTable(
              columnSpacing: 5,
              showBottomBorder: true,
              headingRowColor: MaterialStateProperty.all(Colors.green[100]),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
              ),
              columns: [
                DataColumn(
                    label: Container(
                        width: 70,
                        child: Text(
                          'লক্ষ্যমাত্রা',
                        ))),
                DataColumn(
                    label: Container(
                        width: 70,
                        child: Text(
                          'অর্জন',
                          textAlign: TextAlign.center,
                        ))),
                DataColumn(
                    label: Container(
                        width: 50,
                        child: Text('%', textAlign: TextAlign.center))),
                DataColumn(
                    label: Container(
                        width: 70,
                        child: Text(

                          'নম্বর',
                          textAlign: TextAlign.center,
                        ))),
                DataColumn(
                    label: Container(
                        width: 70,
                        child: Text(
                          'প্রাপ্ত\nনম্বর',
                          textAlign: TextAlign.center,
                        ))),
              ],
              rows: [
                ...widget.score.map((score) => DataRow(
                  cells: [
                    DataCell(Container(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          score.aqthTarget.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))),
                    DataCell(Container(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          score.aEarned.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))),
                    DataCell(Container(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          score.aparcentage.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))),
                    DataCell(Container(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          score.atarget.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))),
                    DataCell(Container(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          score.ascore.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))),
                  ],
                ))
              ]),
        ),
      ),
    ) ;
  }
}

class ScrollableColumnWidgetHrScore extends StatelessWidget {
  ScrollableColumnWidgetHrScore(this.hrscore,this.inputActive);

  List<ApaHrRecomScoreData> hrscore = [];

  late ApaHrScoreCubit apaHrScoreCubit;
  final int  inputActive;


  @override
  Widget build(BuildContext context) {
    apaHrScoreCubit = context.read<ApaHrScoreCubit>();
    print('Length of list ${hrscore.length}');




    return DataTable(
        headingRowColor: MaterialStateProperty.all(Colors.green[100]),
        columnSpacing: 20,
        showBottomBorder: true,
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        columns: [
          DataColumn(
              label: Container(
                  child: Text(
            'নম্বর',
            textAlign: TextAlign.center,
          ))),
          DataColumn(
              label: Container(
                  child: Text(
            'প্রাপ্ত নম্বর',
            textAlign: TextAlign.center,
          ))),
        ],
        rows: [
          ...hrscore.map((score) => DataRow(
                cells: [
                  DataCell(Container(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        score.scoresum.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))),
                  DataCell(Container(
                    alignment: AlignmentDirectional.center,
                    child: score.scoreavg == 0 && inputActive == -1
                        ? Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(

                        enabled: true,
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
                            hintText: score.scoreavg.toString(),
                            hintStyle: Styles.hintTextStyle,

                            enabled: false),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(4),
                          LimitRange(0, int.parse(score.scoresum.toString())),
                        ],
                        keyboardType: TextInputType.number,
                        onChanged: (score){
                          apaHrScoreCubit.hrScore = score.toString();
                        },
                      ),
                    )
                        : Text(
                      score.scoreavg.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
                ],
              ))
        ]);
  }
}

class ScrollableColumnWidgetRecomP extends StatelessWidget {
  ScrollableColumnWidgetRecomP(this.recomList,this.priorityNumber);


  final List<RecomHisData> recomList;
  final int priorityNumber;
  late ApaHrScoreCubit apaHrScoreCubit;
  late ApaEmpInfoCubit apaEmpInfoCubit;
  List<DataColumn> columns = <DataColumn>[];
  List<DataCell> cells = <DataCell>[];
  List<DataRow> rows = <DataRow>[];
  ApprovalPathSet? approvalPathSet ;

  var listMap = <recomsur>[];

  @override
  Widget build(BuildContext context) {
    List<RecomHisData> list = <RecomHisData>[];

    var recomvalueList;


    apaHrScoreCubit = context.read<ApaHrScoreCubit>();
    apaEmpInfoCubit = context.read<ApaEmpInfoCubit>();
    approvalPathSet = apaEmpInfoCubit.approvalPathSet;

    print('RecomList Length ${recomList.length} priorityNumber $priorityNumber');

    recomList.asMap().forEach((key, value) {
      list.add(value);
    });


    print('Length Recommendation ${apaEmpInfoCubit.approvalPathSet!.data!.length}');

   for (var item in apaEmpInfoCubit.approvalPathSet!.data!){
     recomvalueList = Map<int,String>();
     if(item.recominputactive == -1  && item.priorotyNo! <= priorityNumber){
       columns.add( DataColumn(
           label: Padding(
             padding: const EdgeInsets.only(left: 5,right: 5),
             child: Container(
               width: 100,
               child: Text(
                 '${item.pathkeyRemarks}',
                 textAlign: TextAlign.center,
                 overflow: TextOverflow.ellipsis,
                 maxLines: 2,
                 softWrap: true,
               ),
             ),
           )),);



     }
   }

  



    apaEmpInfoCubit.approvalPathSet!.data!.asMap().forEach((pathSetIndex, pathSetValue) {


     recomList.asMap().forEach((recomListIndex, recomItem) {

       if(pathSetIndex == 0 && pathSetValue.priorotyNo!  < priorityNumber){
         print('In first out');
         if(pathSetValue.recominputactive == -1){
           print('In first in');





         }

       }




       if(pathSetIndex == 1 ){

         print('In second out ${1}');
         if(pathSetValue.recominputactive == -1){

           print('In second in');


             recomvalueList[recomItem.recomId] = recomItem.ev2Score.toString();

             if(recomItem.recomId == 29){
               print('In turu 1');

             } else {
               //recomvalueList.clear();
             }




         }




      

       }




       if(pathSetIndex == 2 && pathSetValue.priorotyNo!  <= priorityNumber){
         print('In third out');
         if(pathSetValue.recominputactive == -1){
           print('In third in');


         }

       }



       if(pathSetIndex == 3 && pathSetValue.priorotyNo!  <= priorityNumber){
         print('In fourth out ${pathSetValue.recominputactive}   ${pathSetIndex}');
         if(pathSetValue.recominputactive == -1){

           print('In fourth in');



         }

       }

       print('recomvalueList length ${recomvalueList.length}');
       if(pathSetIndex == 4 && pathSetValue.priorotyNo!  <= priorityNumber){
         print('In fifth out ${pathSetValue.recominputactive}   ${pathSetIndex}');
         if(pathSetValue.recominputactive == -1){

           print('In fifth in $pathSetIndex');

           recomvalueList[recomItem.recomId] = recomItem.ev5Score.toString();





           listMap.add(recomsur(recomItem.recomId,recomItem.ev2Score.toString()));


           if(recomItem.recomId == 29){
             print('In turu 2');

           } else {
             //recomvalueList.clear();
           }



         }


        

       }


     });






    });



    listMap.add(recomsur(100,'nskjcnkjsnc'));
   listMap.asMap().forEach((key, value) {
     print('Key ${key} value ${value.value}');
     cells.add(DataCell(Text(value.value)));

   });





    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            DataTable(
                horizontalMargin: 1,
                showBottomBorder: true,
                headingRowColor: MaterialStateProperty.all(Colors.green[100]),
                columnSpacing: 1,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                ),
                dividerThickness: 1,
                columns: columns,
                rows: [
                  DataRow(cells: cells)


                ] )
          ],
        ),
      ),
    );









  }



}




class ScrollableColumnWidgetRecom extends StatelessWidget {
  ScrollableColumnWidgetRecom(this.recomList,this.priorityNumber);
  final int priorityNumber;

  final List<RecomHisData> recomList;
  late ApaHrScoreCubit apaHrScoreCubit;
  late ApaEmpInfoCubit apaEmpInfoCubit;
  List<DataColumn> columns = <DataColumn>[];
  List<DataRow> rows = [];
  List<DataCell> cells = [];
  List<DataCell> cells0 = [];
  List<DataCell> cells1 = [];
  List<DataCell> cells2 = [];
  List<DataCell> cells3 = [];
  List<DataCell> cells4 = [];
  List<DataCell> cells5 = [];
  List<DataCell> cells6 = [];
  List<DataCell> cells7 = [];

  var scoreList0 = <recomScore>[];
  var scoreList1 = <recomScore>[];
  var scoreList2 = <recomScore>[];
  var scoreList3 = <recomScore>[];
  var scoreList4 = <recomScore>[];
  var scoreList5 = <recomScore>[];
  var scoreList6 = <recomScore>[];
  var scoreList7 = <recomScore>[];
  var scoreList8 = <recomScore>[];
  var rowsCount = 0;

  @override
  Widget build(BuildContext context) {

    apaEmpInfoCubit = context.read<ApaEmpInfoCubit>();

    apaHrScoreCubit = context.read<ApaHrScoreCubit>();
    for (var item in apaEmpInfoCubit.approvalPathSet!.data!){
      if(item.recominputactive == -1  && item.priorotyNo! < priorityNumber){
        columns.add( DataColumn(
            label: Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: Container(
                width: 100,
                child: Text(
                  '${item.pathkeyRemarks}',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                ),
              ),
            )),);


       }
    }


    // Step 1 at first rows with fixed cells are added with the same fixed column length
    for (int i = 0; i < 8 ; i ++){
      if(columns.length == 1){
        rows.add(DataRow(cells: [DataCell(Text('skdlkjdf'))]));
      }
      if(columns.length == 2){
        rows.add(DataRow(cells: [DataCell(Text('skdlkjdf')),DataCell(Text('skdlkjdf'))]));

      }
      if(columns.length == 3){
        print('In 3');
        rows.add(DataRow(cells: [DataCell(Text('skdlkjdf')),DataCell(Text('skdlkjdf')),DataCell(Text('skdlkjdf'))]));

      }
      if(columns.length == 4){
        print('In 4');
        rows.add(DataRow(cells: [DataCell(Text('skdlkjdf')),DataCell(Text('skdlkjdf')),DataCell(Text('skdlkjdf')),DataCell(Text('skdlkjdf'))]));

      }
      if(columns.length == 5){
        rows.add(DataRow(cells: [DataCell(Text('skdlkjdf')),DataCell(Text('skdlkjdf')),DataCell(Text('skdlkjdf')),DataCell(Text('skdlkjdf')),DataCell(Text('skdlkjdf')),/*DataCell(Text('skdlkjdf'))*/]));

      }
      if(columns.length == 6){
        rows.add(DataRow(cells: [DataCell(Text('skdlkjdf')),DataCell(Text('skdlkjdf')),DataCell(Text('skdlkjdf')),DataCell(Text('skdlkjdf')),DataCell(Text('skdlkjdf')),DataCell(Text('skdlkjdf'))]));
      }
      if(columns.length == 7){
        rows.add(DataRow(cells: [DataCell(Text('skdlkjdf')),DataCell(Text('skdlkjdf')),DataCell(Text('skdlkjdf')),DataCell(Text('skdlkjdf')),DataCell(Text('skdlkjdf')),DataCell(Text('skdlkjdf')),DataCell(Text('skdlkjdf'))]));
      }

    }
   // Step 2 for added custom cell with api , recommendation data added in score list with
    recomList.asMap().forEach((key, value) {
      if(key == 0){
        if(value.ev1Score != null){
          scoreList0.add(recomScore(0, value.ev1Score!));
        }

        if(value.ev2Score != null){
          scoreList0.add(recomScore(0, value.ev2Score!));
        }

        if(value.ev3Score != null){
          scoreList0.add(recomScore(0, value.ev3Score!));
        }

        if(value.ev4Score != null){
          scoreList0.add(recomScore(0, value.ev4Score!));
        }

        if(value.ev5Score != null){
          scoreList0.add(recomScore(0, value.ev5Score!));
        }

        if(value.ev6Score != null){
          scoreList0.add(recomScore(0, value.ev6Score!));
        }

        if(value.ev7Score != null){
          scoreList0.add(recomScore(0, value.ev7Score!));
        }
        if(value.ev8Score != null){
          scoreList0.add(recomScore(0, value.ev8Score!));
        }
        if(value.ev9Score != null){
          scoreList0.add(recomScore(0, value.ev9Score!));
        }
        if(value.ev10Score != null){
          scoreList0.add(recomScore(0, value.ev10Score!));
        }



      }
      if(key == 1){
       /* print('keypppp ${key} value ${value.ev1Score}');
        print('keypppp ${key} value ${value.ev2Score}');
        print('keypppp ${key} value ${value.ev3Score}');
        print('keypppp ${key} value ${value.ev4Score}');
        print('keypppp ${key} value ${value.ev5Score}');
        print('keypppp ${key} value ${value.ev6Score}');
        print('keypppp ${key} value ${value.ev7Score}');
        print('keypppp ${key} value ${value.ev8Score}');
        print('keypppp ${key} value ${value.ev9Score}');
        print('keypppp ${key} value ${value.ev10Score}');*/

        if(value.ev1Score != null){
          scoreList1.add(recomScore(1, value.ev1Score!));
        }

        if(value.ev2Score != null){
          scoreList1.add(recomScore(1, value.ev2Score!));
        }

        if(value.ev3Score != null){
          scoreList1.add(recomScore(1, value.ev3Score!));
        }

        if(value.ev4Score != null){
          scoreList1.add(recomScore(1, value.ev4Score!));
        }

        if(value.ev5Score != null){

          scoreList1.add(recomScore(1, value.ev5Score!));
        }

        if(value.ev6Score != null){

          scoreList1.add(recomScore(1, value.ev6Score!));
        }

        if(value.ev7Score != null){
          scoreList1.add(recomScore(1, value.ev7Score!));
        }
        if(value.ev8Score != null){
          scoreList1.add(recomScore(1, value.ev8Score!));
        }
        if(value.ev9Score != null){
          scoreList1.add(recomScore(1, value.ev9Score!));
        }
        if(value.ev10Score != null){
          scoreList1.add(recomScore(1, value.ev10Score!));
        }



      }
      if(key == 2){


        if(value.ev1Score != null){
          scoreList2.add(recomScore(2, value.ev1Score!));
        }

        if(value.ev2Score != null){
          scoreList2.add(recomScore(2, value.ev2Score!));
        }

        if(value.ev3Score != null){
          scoreList2.add(recomScore(2, value.ev3Score!));
        }

        if(value.ev4Score != null){
          scoreList2.add(recomScore(2, value.ev4Score!));
        }

        if(value.ev5Score != null){
          scoreList2.add(recomScore(2, value.ev5Score!));
        }

        if(value.ev6Score != null){
          scoreList2.add(recomScore(2, value.ev6Score!));
        }

        if(value.ev7Score != null){
          scoreList2.add(recomScore(2, value.ev7Score!));
        }
        if(value.ev8Score != null){
          scoreList2.add(recomScore(2, value.ev8Score!));
        }
        if(value.ev9Score != null){
          scoreList2.add(recomScore(2, value.ev9Score!));
        }
        if(value.ev10Score != null){
          scoreList2.add(recomScore(2, value.ev10Score!));
        }



      }
      if(key == 3){


        if(value.ev1Score != null){
          scoreList3.add(recomScore(3, value.ev1Score!));
        }

        if(value.ev2Score != null){
          scoreList3.add(recomScore(3, value.ev2Score!));
        }

        if(value.ev3Score != null){
          scoreList3.add(recomScore(3, value.ev3Score!));
        }

        if(value.ev4Score != null){
          scoreList3.add(recomScore(3, value.ev4Score!));
        }

        if(value.ev5Score != null){
          scoreList3.add(recomScore(3, value.ev5Score!));
        }

        if(value.ev6Score != null){
          scoreList3.add(recomScore(3, value.ev6Score!));
        }

        if(value.ev7Score != null){
          scoreList3.add(recomScore(3, value.ev7Score!));
        }
        if(value.ev8Score != null){
          scoreList3.add(recomScore(3, value.ev8Score!));
        }
        if(value.ev9Score != null){
          scoreList3.add(recomScore(3, value.ev9Score!));
        }
        if(value.ev10Score != null){
          scoreList3.add(recomScore(3, value.ev10Score!));
        }



      }
      if(key == 4){

        if(value.ev1Score != null){
          scoreList4.add(recomScore(4, value.ev1Score!));
        }

        if(value.ev2Score != null){
          scoreList4.add(recomScore(4, value.ev2Score!));
        }

        if(value.ev3Score != null){
          scoreList4.add(recomScore(4, value.ev3Score!));
        }

        if(value.ev4Score != null){
          scoreList4.add(recomScore(4, value.ev4Score!));
        }

        if(value.ev5Score != null){
          scoreList4.add(recomScore(4, value.ev5Score!));
        }

        if(value.ev6Score != null){
          scoreList4.add(recomScore(4, value.ev6Score!));
        }

        if(value.ev7Score != null){
          scoreList4.add(recomScore(4, value.ev7Score!));
        }
        if(value.ev8Score != null){
          scoreList4.add(recomScore(4, value.ev8Score!));
        }
        if(value.ev9Score != null){
          scoreList4.add(recomScore(4, value.ev9Score!));
        }
        if(value.ev10Score != null){
          scoreList4.add(recomScore(4, value.ev10Score!));
        }



      }
      if(key == 5){


        if(value.ev1Score != null){
          scoreList5.add(recomScore(5, value.ev1Score!));
        }

        if(value.ev2Score != null){
          scoreList5.add(recomScore(5, value.ev2Score!));
        }

        if(value.ev3Score != null){
          scoreList5.add(recomScore(5, value.ev3Score!));
        }

        if(value.ev4Score != null){
          scoreList5.add(recomScore(5, value.ev4Score!));
        }

        if(value.ev5Score != null){
          scoreList5.add(recomScore(5, value.ev5Score!));
        }

        if(value.ev6Score != null){
          scoreList5.add(recomScore(5, value.ev6Score!));
        }

        if(value.ev7Score != null){
          scoreList5.add(recomScore(5, value.ev7Score!));
        }
        if(value.ev8Score != null){
          scoreList5.add(recomScore(5, value.ev8Score!));
        }
        if(value.ev9Score != null){
          scoreList5.add(recomScore(5, value.ev9Score!));
        }
        if(value.ev10Score != null){
          scoreList5.add(recomScore(5, value.ev10Score!));
        }



      }
      if(key == 6){


        if(value.ev1Score != null){
          scoreList6.add(recomScore(6, value.ev1Score!));
        }

        if(value.ev2Score != null){
          scoreList6.add(recomScore(6, value.ev2Score!));
        }

        if(value.ev3Score != null){
          scoreList6.add(recomScore(6, value.ev3Score!));
        }

        if(value.ev4Score != null){
          scoreList6.add(recomScore(6, value.ev4Score!));
        }

        if(value.ev5Score != null){
          scoreList6.add(recomScore(6, value.ev5Score!));
        }

        if(value.ev6Score != null){
          scoreList6.add(recomScore(6, value.ev6Score!));
        }

        if(value.ev7Score != null){
          scoreList6.add(recomScore(6, value.ev7Score!));
        }
        if(value.ev8Score != null){
          scoreList6.add(recomScore(6, value.ev8Score!));
        }
        if(value.ev9Score != null){
          scoreList6.add(recomScore(6, value.ev9Score!));
        }
        if(value.ev10Score != null){
          scoreList6.add(recomScore(6, value.ev10Score!));
        }



      }
      if(key == 7){


        if(value.ev1Score != null){
          scoreList7.add(recomScore(7, value.ev1Score!));
        }

        if(value.ev2Score != null){
          scoreList7.add(recomScore(7, value.ev2Score!));
        }

        if(value.ev3Score != null){
          scoreList7.add(recomScore(7, value.ev3Score!));
        }

        if(value.ev4Score != null){
          scoreList7.add(recomScore(7, value.ev4Score!));
        }

        if(value.ev5Score != null){
          scoreList7.add(recomScore(7, value.ev5Score!));
        }

        if(value.ev6Score != null){
          scoreList7.add(recomScore(7, value.ev6Score!));
        }

        if(value.ev7Score != null){
          scoreList7.add(recomScore(7, value.ev7Score!));
        }
        if(value.ev8Score != null){
          scoreList7.add(recomScore(7, value.ev8Score!));
        }
        if(value.ev9Score != null){
          scoreList7.add(recomScore(7, value.ev9Score!));
        }
        if(value.ev10Score != null){
          scoreList7.add(recomScore(7, value.ev10Score!));
        }



      }
    });

    print('Priority number $priorityNumber');

    scoreList0.asMap().forEach((key, value) {
      if(key < priorityNumber) {
        if (apaEmpInfoCubit.approvalPathSet!.data![key].recominputactive ==
            -1 && apaEmpInfoCubit.approvalPathSet!.data![key].stepFinalL != -1) {
          //print('Key...... $key value ${value._score}');
          cells0.add(DataCell(Container(
              child: Text(value._score == ' ()'?'':value._score))));
        }
      }
    });
    rows.insert(0, DataRow(cells: cells0)); // insert custom row with cell with api data in previous rows
    rows.removeLast();  // as added extra one cell then remove last cell from previous fixed rows
    scoreList1.asMap().forEach((key, value) {
      if(key < priorityNumber){
        //print('Key...... $key value ${value._score}');
        if(apaEmpInfoCubit.approvalPathSet!.data![key].recominputactive == -1&& apaEmpInfoCubit.approvalPathSet!.data![key].stepFinalL != -1) {
          cells1.add(DataCell(Text(value._score == ' ()'?'':value._score)));
        }

      }
    });

   rows.insert(1, DataRow(cells: cells1));
   rows.removeLast();
   scoreList2.asMap().forEach((key, value) {
      if(key < priorityNumber){
        if(apaEmpInfoCubit.approvalPathSet!.data![key].recominputactive == -1&& apaEmpInfoCubit.approvalPathSet!.data![key].stepFinalL != -1) {
          //print('Key...... $key value ${value._score}');
          cells2.add(DataCell(Text(value._score == ' ()'?'':value._score)));
        }
      }
   });
   rows.insert(2, DataRow(cells: cells2));
   rows.removeLast();
   scoreList3.asMap().forEach((key, value) {
     if(key < priorityNumber){
         if(apaEmpInfoCubit.approvalPathSet!.data![key].recominputactive == -1&& apaEmpInfoCubit.approvalPathSet!.data![key].stepFinalL != -1) {
           //print('Key...... $key value ${value._score}');
           cells3.add(DataCell(Text(value._score == ' ()'?'':value._score)));
         }
     }
   });

    rows.insert(3, DataRow(cells: cells3));
    rows.removeLast();
     scoreList4.asMap().forEach((key, value) {
       if(key < priorityNumber){
         if(apaEmpInfoCubit.approvalPathSet!.data![key].recominputactive == -1&& apaEmpInfoCubit.approvalPathSet!.data![key].stepFinalL != -1) {
           //print('Key...... $key value ${value._score}');
           cells4.add(DataCell(Text(value._score == ' ()'?'':value._score)));
         }
       }
     });

    rows.insert(4, DataRow(cells: cells4));
    rows.removeLast();
    scoreList5.asMap().forEach((key, value) {
      if(key < priorityNumber){
        if(apaEmpInfoCubit.approvalPathSet!.data![key].recominputactive == -1&& apaEmpInfoCubit.approvalPathSet!.data![key].stepFinalL != -1) {
          //print('Key...... $key value ${value._score}');
          cells5.add(DataCell(Text(value._score == ' ()'?'':value._score)));

        }

      }

    });
    rows.insert(5, DataRow(cells: cells5));
    rows.removeLast();
    scoreList6.asMap().forEach((key, value) {
      if(key < priorityNumber){
      if(apaEmpInfoCubit.approvalPathSet!.data![key].recominputactive == -1&& apaEmpInfoCubit.approvalPathSet!.data![key].stepFinalL != -1) {
        //print('Key...... $key value ${value._score}');
        cells6.add(DataCell(Text(value._score == ' ()'?'':value._score)));
      }
      }
    });

    rows.insert(6, DataRow(cells: cells6));
    rows.removeLast();
      scoreList7.asMap().forEach((key, value) {
        if(key < priorityNumber){
          if(apaEmpInfoCubit.approvalPathSet!.data![key].recominputactive == -1&& apaEmpInfoCubit.approvalPathSet!.data![key].stepFinalL != -1) {
            //print('Key...... $key value ${value._score}');
            cells7.add(DataCell(Text(value._score == ' ()'?'':value._score)));
          }
        }
      });

    rows.insert(7, DataRow(cells: cells7));
    rows.removeLast();
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            horizontalMargin: 1,
            headingRowColor: MaterialStateProperty.all(Colors.green[100]),
            columnSpacing: 1,
            border: TableBorder.all(
              width: 1.0,
              color:ColorResources.GREY_FOURTY,
            ),
            decoration: BoxDecoration(
            ),
            dividerThickness: 1,
            showBottomBorder: true,
            columns:columns,
            rows: rows,
          
        ),
      ),
    );
  }
}


class recomScore{
 late int _id;

 recomScore(this._id, this._score);

  late String _score;

}

class recomsur{

  late int Id;
  late String value;

  recomsur(this.Id, this.value);


}
class LimitRange extends TextInputFormatter {
  LimitRange(
      this.minRange,
      this.maxRange,
      ) : assert(
  minRange < maxRange,
  );

  final int minRange;
  final int maxRange;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var value;
    try {
      value = int.parse(newValue.text);
    } catch (e) {
      print(e);
    }
    try {
      if (value < minRange) {
        print('value print in between 1 - 20');
        return TextEditingValue(text: minRange.toString());
      } else if (value > maxRange) {
        print('not more 20');
        return TextEditingValue(text: maxRange.toString());
      }
    } catch (e) {
      print(e);
    }
    return newValue;
  }
}


