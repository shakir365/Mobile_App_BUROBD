import 'package:buro_employee/repository/bloc/apa_emp_info/apa_emp_info_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../repository/bloc/apa_recom_history/apa_recom_history_cubit.dart';
import '../../repository/models/annual_appraisal.dart';
import '../../theme/colors.dart';
import '../../theme/styles.dart';
import 'FixedColumWidget.dart';
import 'ScrollableColumnWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApaRecommendation extends StatefulWidget {
  ApaRecommendation(this.recomList, this.inputActive, this.priorityNumber);

  final List<RecomHisData> recomList;
  final int inputActive;
  final int priorityNumber;

  @override
  State<ApaRecommendation> createState() => _ApaRecommendationState();
}

class _ApaRecommendationState extends State<ApaRecommendation> {
  var checkboxvalue = false;

  var checkBoxList = [];
  var activeInactiveList = [];
  late ApaRecomHistoryCubit apaRecomHistoryCubit;
  late List<TextEditingController> controllerList;
  bool previousRecomActive = false;
  Map<int, bool> _inactiveList = Map();
  late ApaEmpInfoCubit apaEmpInfoCubit;

  @override
  void initState() {
    apaRecomHistoryCubit = context.read<ApaRecomHistoryCubit>();
    apaEmpInfoCubit = context.read<ApaEmpInfoCubit>();
    widget.recomList.forEach((element) {
      checkBoxList.add(false);
    });
    widget.recomList.asMap().forEach((key, value) {
      apaRecomHistoryCubit.checkboxactiveInactiveList[key] = true;
      _inactiveList[key] = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    apaEmpInfoCubit.approvalPathSet!.data!.asMap().forEach((key, value) {
      if (key < widget.priorityNumber - 1) {
        if (value.recominputactive == -1) {
          previousRecomActive = true;
        }
      }
    });

    print('previousRecomActive $previousRecomActive');
    return widget.inputActive == -1
        ? Column(
            children: [
              SizedBox(
                height: 10,
              ),
              previousRecomActive == true
                  ? Row(
                      children: [
                        FixedColumnWidgetRecomScore(widget.recomList),
                        ScrollableColumnWidgetRecom(
                            widget.recomList, widget.priorityNumber),
                      ],
                    )
                  : SizedBox(),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Scrollbar(
                    child: ListView.builder(
                        itemCount: widget.recomList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _buildList(widget.recomList[index], index);
                        }),
                  ),
                ),
              ),
            ],
          )
        : Row(
            children: [
              FixedColumnWidgetRecomScore(widget.recomList),
              ScrollableColumnWidgetRecom(
                  widget.recomList, widget.priorityNumber),
            ],
          );
  }

  Widget _buildList(RecomHisData item, int index) {
    List<Widget> widgetList = <Widget>[];
    if (index == 0 || index == 1 || index == 5 || index == 7) {
      widgetList.add(
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 30, bottom: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('মন্তব্য '),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: TextFormField(
                  controller: apaRecomHistoryCubit.controllerList[index],
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
                      contentPadding: EdgeInsets.all(20),
                      hintStyle: TextStyle(color: ColorResources.GREY_SEVENTY)),
                  cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                  style: Styles.hintTextStyle,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  enabled: true,
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      widgetList.add(
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 30, bottom: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('মন্তব্য '),
                ),
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: TextFormField(
                        controller:
                            apaRecomHistoryCubit.countControllerList[index],
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
                            hintText: 'কাউন্ট',
                            contentPadding: EdgeInsets.all(20),
                            hintStyle:
                                TextStyle(color: ColorResources.GREY_SEVENTY)),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: 1,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: true, signed: true),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(2),
                          LimitRange(0, index == 2 ? 2 : 10),
                        ],
                        enabled: true,
                        onChanged: (val) {},
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: TextFormField(
                        controller: apaRecomHistoryCubit.controllerList[index],
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
                            hintText: 'মন্তব্য',
                            contentPadding: EdgeInsets.all(20),
                            hintStyle:
                                TextStyle(color: ColorResources.GREY_SEVENTY)),
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        enabled: true,
                        onChanged: (comment) {},
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    return IgnorePointer(
      ignoring: _inactiveList[index]!,
      child: ExpansionTile(
        onExpansionChanged: (bcb) {
          print('Print value $bcb');
          setState(() {
            if (checkBoxList[index] == true) {
              checkBoxList[index] = false;
            } else {
              checkBoxList[index] = true;
            }

            if (index == 0) {
              if (_inactiveList[1] == false) {
                _inactiveList[1] = true;
              } else {
                _inactiveList[1] = false;
              }

              if (_inactiveList[3] == false) {
                _inactiveList[3] = true;
              } else {
                _inactiveList[3] = false;
              }

              if (_inactiveList[4] == false) {
                _inactiveList[4] = true;
              } else {
                _inactiveList[4] = false;
              }
              if (_inactiveList[6] == false) {
                _inactiveList[6] = true;
              } else {
                _inactiveList[6] = false;
              }

              if (_inactiveList[7] == false) {
                _inactiveList[7] = true;
              } else {
                _inactiveList[7] = false;
              }
            }
            if (index == 1) {
              if (_inactiveList[7] == false) {
                _inactiveList[7] = true;
              } else {
                _inactiveList[7] = false;
              }

              if (_inactiveList[0] == false) {
                _inactiveList[0] = true;
              } else {
                _inactiveList[0] = false;
              }

              if (_inactiveList[2] == false) {
                _inactiveList[2] = true;
              } else {
                _inactiveList[2] = false;
              }
            }

            if (index == 3) {
              if (_inactiveList[7] == false) {
                _inactiveList[7] = true;
              } else {
                _inactiveList[7] = false;
              }

              if (_inactiveList[0] == false) {
                _inactiveList[0] = true;
              } else {
                _inactiveList[0] = false;
              }

              if (_inactiveList[2] == false) {
                _inactiveList[2] = true;
              } else {
                _inactiveList[2] = false;
              }
            }
            if (index == 4) {
              if (_inactiveList[7] == false) {
                _inactiveList[7] = true;
              } else {
                _inactiveList[7] = false;
              }

              if (_inactiveList[0] == false) {
                _inactiveList[0] = true;
              } else {
                _inactiveList[0] = false;
              }

              if (_inactiveList[2] == false) {
                _inactiveList[2] = true;
              } else {
                _inactiveList[2] = false;
              }
            }

            if (index == 6) {
              if (_inactiveList[7] == false) {
                _inactiveList[7] = true;
              } else {
                _inactiveList[7] = false;
              }

              if (_inactiveList[0] == false) {
                _inactiveList[0] = true;
              } else {
                _inactiveList[0] = false;
              }

              if (_inactiveList[2] == false) {
                _inactiveList[2] = true;
              } else {
                _inactiveList[2] = false;
              }
            }
            if (index == 7) {
              if (_inactiveList[0] == false) {
                _inactiveList[0] = true;
              } else {
                _inactiveList[0] = false;
              }

              if (_inactiveList[1] == false) {
                _inactiveList[1] = true;
              } else {
                _inactiveList[1] = false;
              }

              if (_inactiveList[3] == false) {
                _inactiveList[3] = true;
              } else {
                _inactiveList[3] = false;
              }

              if (_inactiveList[4] == false) {
                _inactiveList[4] = true;
              } else {
                _inactiveList[4] = false;
              }

              if (_inactiveList[6] == false) {
                _inactiveList[6] = true;
              } else {
                _inactiveList[6] = false;
              }
            }
          });
        },
        trailing: SizedBox.shrink(),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: _inactiveList[index]! == true
                  ? ColorResources.GREY_FOURTY
                  : ColorResources.GREY_TWENTY,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: ColorResources.GREY_THIRTY, width: 1),
            ),
            child: Row(
              children: [
                Checkbox(
                    activeColor: ColorResources.APP_THEME_COLOR,
                    value: checkBoxList[index],
                    onChanged: checkBoxList[index] == true ? (vale) {} : null),
                Text(
                  item.recomDescriptionBn!,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: ColorResources.GREY_NINETY,
                  ),
                ),
              ],
            ),
          ),
        ),
        children: widgetList,
      ),
    );
  }
}

class RedeemConfirmationScreen extends StatelessWidget {
  RedeemConfirmationScreen(this.recomList, this.priorityNumber);

  final List<RecomHisData> recomList;
  final int priorityNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white.withOpacity(0.85),
      // this is the main reason of transparency at next screen. I am ignoring rest implementation but what i have achieved is you can see.
      body: Row(
        children: [
          FixedColumnWidgetRecomScore(this.recomList),
          ScrollableColumnWidgetRecom(this.recomList, priorityNumber),
        ],
      ),
    );
  }
}
