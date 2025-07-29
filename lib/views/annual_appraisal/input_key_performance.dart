import 'package:buro_employee/repository/bloc/apa_cmnt_history/apa_cmnt_history_cubit.dart';
import 'package:buro_employee/repository/bloc/apa_emp_info/apa_emp_info_cubit.dart';
import 'package:buro_employee/repository/bloc/apa_emp_leave/apa_emp_leave_cubit.dart';

import 'package:buro_employee/repository/bloc/apa_hr_score/apa_hr_score_cubit.dart';
import 'package:buro_employee/repository/bloc/apa_menu_info/apa_menu_info_cubit.dart';
import 'package:buro_employee/repository/bloc/apa_recom_history/apa_recom_history_cubit.dart';
import 'package:buro_employee/repository/bloc/apa_supervisor_info/apa_supervisor_info_cubit.dart';
import 'package:buro_employee/repository/bloc/apa_target_score/apa_target_score_cubit.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:buro_employee/repository/network/buro_repository.dart';
import 'package:buro_employee/sessionmanager/session_manager.dart';
import 'package:buro_employee/theme/colors.dart';
import 'package:buro_employee/theme/styles.dart';
import 'package:buro_employee/utilities/common_methods.dart';
import 'package:buro_employee/views/annual_appraisal/annual_appraisal_main.dart';
import 'package:buro_employee/views/annual_appraisal/apa_recommendation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../localization/Language/languages.dart';
import '../../repository/bloc/apa_employee_score/apa_emp_score_cubit.dart';
import '../../repository/bloc/apa_get_employee/apa_get_employee_cubit.dart';
import '../../repository/bloc/emp_sup_cmment/emp_sup_cmment_cubit.dart';
import 'FixedColumWidget.dart';
import 'ScrollableColumnWidget.dart';
import 'apa_target_score.dart';

class InputKeyPerformance extends StatefulWidget {
  static const routeName = '/inputKeyPerformance';
  late final EmployeeListData arguments;

  InputKeyPerformance(this.arguments, {Key? key}) : super(key: key);

  @override
  _InputKeyPerformanceState createState() => _InputKeyPerformanceState();
}

class _InputKeyPerformanceState extends State<InputKeyPerformance> {
  PageController controller = PageController();
  var _curr = 0;
  List<String> _list = [];
  List<Widget> _widgetList = <Widget>[];
  late ApaEmpInfoCubit apaEmpInfoCubit;
  late EmployeeListData listempBasicInfo;
  late ApaEmpScoreCubit scoreCubit;
  late EmpSupCmmentCubit supercommentbloc;
  late ApaTargetScoreCubit targetScoreCubit;
  late ApaEmpLeaveCubit apaEmpLeaveCubit;
  late ApaCmntHistoryCubit apaCmntHistoryCubit;
  late ApaRecomHistoryCubit apaRecomHistoryCubit;
  late ApaMenuInfoCubit apaMenuInfoCubit;
  late ApaHrScoreCubit apaHrScoreCubit;
  late ApaGetEmployeeCubit apaGetEmployeeCubit;
  late ApaReceiverInfoCubit apaSupervisorInfoCubit;
  late ApaTargetScoreCubit apaTargetScoreCubit;
  late ApaEmpScore score = ApaEmpScore();
  int outofScoreTotal = 0;
  late int loginUserId;
  List<SubmitRecomItem> submitRecomList = [];
  List<RecomHisData> recomHisData = [];
  List<SubmitScoreItem> scoreList = [];
  List<SubmitTargetScoreItem> scoreListTarget = [];
  var empInfoController = TextEditingController();
  EmployeeInfoData? employeeInfoData = null;
  var text = 'প্রাপকের তথ্য পাওয়া যায় নাই';
  var _controllerLR = TextEditingController();
  var _controllerLDC = TextEditingController();
  var _controllerLD = TextEditingController();
  var _controllerLC = TextEditingController();
  var _controllerReceiverPin = TextEditingController();
  bool hasScore = false;
  bool hasRecom = false;
  int count = 0;
  bool isLoading = false;
  var repo = BuroRepository();
  var approvalPathSetInfo = ApprovalPathSet();

  final ScrollController _controller = ScrollController();
  final double _height = 250.0;

  @override
  void initState() {
    initialization();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    //print('Input Key didChangeDependencies called');
    super.didChangeDependencies();
  }

  void initialization() async {
    listempBasicInfo = widget.arguments;
    sessionManager.userID.then((value) => loginUserId = int.parse(value));
    apaEmpInfoCubit = context.read<ApaEmpInfoCubit>();
    scoreCubit = context.read<ApaEmpScoreCubit>();
    supercommentbloc = context.read<EmpSupCmmentCubit>();
    targetScoreCubit = context.read<ApaTargetScoreCubit>();
    apaEmpLeaveCubit = context.read<ApaEmpLeaveCubit>();
    apaCmntHistoryCubit = context.read<ApaCmntHistoryCubit>();
    apaRecomHistoryCubit = context.read<ApaRecomHistoryCubit>();
    apaMenuInfoCubit = context.read<ApaMenuInfoCubit>();
    apaHrScoreCubit = context.read<ApaHrScoreCubit>();
    apaSupervisorInfoCubit = context.read<ApaReceiverInfoCubit>();
    apaGetEmployeeCubit = context.read<ApaGetEmployeeCubit>();
    apaTargetScoreCubit = context.read<ApaTargetScoreCubit>();
    scoreCubit.clearList();
    apaTargetScoreCubit.clearList();
    apaRecomHistoryCubit.clearList();
    apaGetEmployeeCubit.emit(ApaGetEmployeeInitialState());
    scoreListTarget.clear();
    scoreList.clear();
    submitRecomList.clear();
    apaCmntHistoryCubit.clearComment();
    supercommentbloc.clearSuperComment();

    apaEmpInfoCubit.getApaPathSetInfo(listempBasicInfo.qSetID!);

    GetEmpScore getEmpScore = GetEmpScore(listempBasicInfo.qAssignID!,
        listempBasicInfo.qSetID!, listempBasicInfo.fiscalYear!);
    GetApprovalPathInfo getApprovalPathInfo = GetApprovalPathInfo();
    GetHrScore getHrScore;

    var getMenuInfo;
    await apaEmpInfoCubit
        .getApaBasicInfo(
            listempBasicInfo.employeePin!, listempBasicInfo.fiscalYear!)
        .then((valueEmpInfo) async => {
              getMenuInfo = GetMenuInfo(valueEmpInfo!.data![0].receiverempId!,
                  valueEmpInfo.data![0].empId!, listempBasicInfo.fiscalYear!),
              await apaMenuInfoCubit
                  .getEmpMenuInfo(getMenuInfo)
                  .then((valueMenuInfo) => {
                        isLoading = true,
                        print('apaMenuInfoCubit ${getMenuInfo.toString()}'),
                        apaMenuInfoCubit.empMenuInfoData =
                            valueMenuInfo!.data![0],
                        supercommentbloc
                            .getSuperComment(listempBasicInfo.qAssignID!),
                        scoreCubit.getApaEmpScore(getEmpScore),
                        if (valueMenuInfo.data![0].questiontrgactive! == -1)
                          {
                            targetScoreCubit.getEmpTargetScore(
                                listempBasicInfo.qAssignID!,
                                listempBasicInfo.fiscalYear!)
                          },
                        apaEmpLeaveCubit
                            .getEmpLeaveInfo(listempBasicInfo.qAssignID!),
                        apaCmntHistoryCubit
                            .getEmpCmntHistory(listempBasicInfo.qAssignID!),
                        getHrScore = GetHrScore(
                            listempBasicInfo.qAssignID!,
                            valueMenuInfo.data![0].questiontrgactive!,
                            listempBasicInfo.qSetID!),
                        if (valueMenuInfo.data![0].recomactive == -1)
                          {
                            apaRecomHistoryCubit.getEmpRecomHistory(
                                listempBasicInfo.qAssignID!),
                          },
                        if (valueMenuInfo.data![0].recomhractive == -1)
                          {apaHrScoreCubit.getHRRecomScore(getHrScore)},
                        getApprovalPathInfo.questionsetId =
                            listempBasicInfo.qSetID!,
                        getApprovalPathInfo.empCode =
                            listempBasicInfo.employeePin.toString(),
                        getApprovalPathInfo.priorityNo =
                            (listempBasicInfo.priority! +
                                1), // for test 2 kore dieci
                        apaSupervisorInfoCubit
                            .getSuperVisorInfo(getApprovalPathInfo),
                      })
            });
  }

  void _animateToIndex(int index) {
    _controller.animateTo(
      index * _height,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  Widget getLast() {
    return Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom != 0 ? false : true,
      child: BlocConsumer<ApaReceiverInfoCubit, ApaReceiverInfoState>(
        listener: (context, state) {
          if (state is ApaEmpInfoErrorState) {
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
          if (state is ApaSupervisorInfoInitialState) {
            return Center(child: SizedBox());
          } else if (state is ApaSupervisorInfoLoadingState) {
            return Center(child: SizedBox());
          } else if (state is ApaSupervisorInfoLoadedState) {
            var empdata = state.data.data!;
            var supervisorController = TextEditingController();
            EmpMenuInfoData empmenuInfofData =
                apaMenuInfoCubit.empMenuInfoData!;

            if (empdata.isNotEmpty) {
              print('In set supervisor info');
              supervisorController.text = empdata[0].empCode.toString();
            }
            return empdata.isNotEmpty
                ? Padding(
                    // when receiver found
                    padding: const EdgeInsets.only(
                      left: 60,
                      right: 24,
                    ),
                    child: Container(
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 56,
                          width: double.infinity,
                          child: ElevatedButton(
                            child: Container(
                                height: 56,
                                child: Center(
                                    child: Text(
                                  'Next',
                                  style: Styles.buttonTextStyle,
                                ))),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: ColorResources.APP_THEME_COLOR,
                              minimumSize: const Size.fromHeight(50), // NEW
                            ),
                            onPressed: () {
                              print('Present Item ${_list[_curr].toString()}');

                              if (_curr == _widgetList.length - 1) {
                                //-----------Validation Start---------
                                if (empmenuInfofData.questioninputactive ==
                                    -1) {
                                  scoreCubit.controllerMap
                                      .forEach((key, value) {
                                    hasScore =
                                        value.text.isNotEmpty ? true : false;
                                  });
                                  if (hasScore == false) {
                                    CommonMethods.showMessage(
                                        context, 'স্কোর যোগ করুন ', Colors.red);
                                    return;
                                  } else {
                                    scoreCubit.controllerMap
                                        .forEach((key, value) {
                                      print(
                                          'Submit Value Score key${key.toString()}Score value ${value.text}');

                                      var submitItem = SubmitScoreItem();
                                      submitItem.scorequestionId =
                                          int.parse(key.toString());
                                      submitItem.score = int.parse(value.text);
                                      scoreList.add(submitItem);
                                    });
                                  }
                                }
                                if (empmenuInfofData.recominputactive == -1) {
                                  recomHisData.asMap().forEach((key, value) {
                                    apaRecomHistoryCubit.controllerList
                                        .asMap()
                                        .forEach(
                                            (keycontroller, valuecontroller) {
                                      apaRecomHistoryCubit.countControllerList
                                          .asMap()
                                          .forEach((keycount, valuecount) {
                                        if (key == keycontroller &&
                                            key == keycount) {
                                          var count = 0;
                                          if (valuecount.text.isNotEmpty) {
                                            count = int.parse(valuecount.text);
                                          }

                                          if (valuecontroller.text.isNotEmpty) {
                                            submitRecomList.add(SubmitRecomItem(
                                                value.recomId,
                                                count,
                                                valuecontroller.text));
                                          } else {
                                            if (count > 0) {
                                              submitRecomList.add(
                                                  SubmitRecomItem(value.recomId,
                                                      count, ' '));
                                            }
                                          }
                                        }
                                      });
                                    });
                                  });

                                  hasRecom =
                                      submitRecomList.isNotEmpty ? true : false;
                                  if (hasRecom == false) {
                                    CommonMethods.showMessage(context,
                                        'সুপারিশ যোগ করুন', Colors.red);
                                    return;
                                  }
                                }
                                if (empmenuInfofData.asupercomhistinput == -1) {
                                  if (supercommentbloc
                                      .supervisorComment.isEmpty) {
                                    CommonMethods.showMessage(
                                        context,
                                        'সরাসরি তত্ত্বাবধায়ক সম্পর্কে মতামত যোগ করুন',
                                        Colors.red);
                                    return;
                                  }
                                }
                                if (empmenuInfofData.recomhrinputactive == -1) {
                                  if (apaHrScoreCubit.hrScore.isEmpty) {
                                    CommonMethods.showMessage(
                                        context,
                                        'হিউমান রিসোর্সে স্কোর যোগ করুন ',
                                        Colors.red);
                                    return;
                                  }
                                }
                                print(
                                    'GeneralComment ${apaEmpInfoCubit.approvalPathSet!.data![listempBasicInfo.priority! - 1].generalcomments} listempBasicInfo.priority ${listempBasicInfo.priority}');

                                if (apaEmpInfoCubit
                                        .approvalPathSet!
                                        .data![listempBasicInfo.priority! - 1]
                                        .generalcomments ==
                                    -1) {
                                  if (apaCmntHistoryCubit.comment.isEmpty) {
                                    CommonMethods.showMessage(context,
                                        'মন্তব্য যোগ করুন', Colors.red);
                                    return;
                                  }
                                }

                                //-----------Validation End---------

                                try {
                                  targetScoreCubit.controllerMapTarget
                                      .forEach((keyTarget, value) {
                                    print(
                                        'target Key $keyTarget Value ${value.text.toString()}');
                                    var submitTargetItem =
                                        SubmitTargetScoreItem();
                                    submitTargetItem.questionId = keyTarget;
                                    submitTargetItem.target =
                                        num.parse(value.text.toString());
                                    try {
                                      targetScoreCubit.controllerMapEarned
                                          .forEach((key, value) {
                                        if (keyTarget == key) {
                                          try {
                                            submitTargetItem.earned = num.parse(
                                                value.text.toString());
                                          } catch (e) {
                                            print(e);
                                            submitTargetItem.earned = 0;
                                          }
                                        }
                                      });
                                    } catch (e) {
                                      print(e);
                                    }
                                    try {
                                      targetScoreCubit.controllerMapPercentage
                                          .forEach((key, value) {
                                        if (keyTarget == key) {
                                          try {
                                            submitTargetItem.percentage =
                                                num.parse(
                                                    value.text.toString());
                                          } catch (e) {
                                            print(e);
                                            submitTargetItem.percentage = 0;
                                          }
                                        }
                                      });
                                    } catch (e) {
                                      print(e);
                                    }
                                    try {
                                      targetScoreCubit.controllerMapEarnedScore
                                          .forEach((key, value) {
                                        if (keyTarget == key) {
                                          try {
                                            submitTargetItem.score = num.parse(
                                                value.text.toString());
                                          } catch (e) {
                                            print(e);
                                            submitTargetItem.score = 0;
                                          }
                                        }
                                      });
                                    } catch (e) {
                                      print(e);
                                    }
                                    scoreListTarget.add(submitTargetItem);
                                  });
                                } catch (e) {
                                  print(e);
                                }

                                //  ----------Receiver info start-------
                                //  ----------For when found receiver info

                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    isDismissible: true,
                                    context: context,
                                    builder: (context) {
                                      return BlocConsumer<ApaGetEmployeeCubit,
                                          ApaGetEmployeeState>(
                                        listener: (context, state) {
                                          if (state
                                              is ApaGetEmployeeErrorState) {
                                            final snackBar = SnackBar(
                                              content: Text(
                                                  Languages.of(context)!
                                                      .internetErrorText),
                                              backgroundColor: Colors.red,
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          }
                                        },
                                        buildWhen: (previous, current) =>
                                            previous != current,
                                        builder: (context, state) {
                                          if (state
                                              is ApaGetEmployeeInitialState) {
                                            // with first time get receiver info
                                            return Container(
                                              height: 300,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16,
                                                    right: 16,
                                                    top: 5,
                                                    bottom: 5),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('প্রাপক',
                                                            style: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 20,
                                                              color: ColorResources
                                                                  .GREY_NINETY,
                                                            )),
                                                        InkWell(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Container(
                                                              child: Icon(
                                                                Icons.clear,
                                                                color: ColorResources
                                                                    .GREY_SIXTY,
                                                              ),
                                                            ))
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    TextFormField(
                                                      onTap: () {},
                                                      autofocus: false,
                                                      enableSuggestions: true,
                                                      controller:
                                                          supervisorController,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          InputDecoration(
                                                        filled: true,
                                                        suffixIcon: IconButton(
                                                          onPressed: () {
                                                            print(
                                                                'On Search click');
                                                            apaGetEmployeeCubit
                                                                .apaGetEmployeeInfo(
                                                                    supervisorController
                                                                        .text
                                                                        .toString())
                                                                .then((value) =>
                                                                    {});
                                                          },
                                                          icon: Icon(
                                                              Icons.search),
                                                        ),
                                                        fillColor: ColorResources
                                                            .TEXT_FIELD_COLOR,
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                            borderSide: BorderSide(
                                                                color:
                                                                    ColorResources
                                                                        .APP_THEME_COLOR,
                                                                style:
                                                                    BorderStyle
                                                                        .solid,
                                                                width: 2)),
                                                        enabledBorder:
                                                            const OutlineInputBorder(
                                                          borderSide: const BorderSide(
                                                              color: ColorResources
                                                                  .TEXT_FIELD_BORDER_COLOR,
                                                              width: 0.0),
                                                        ),
                                                        hintStyle: Styles
                                                            .apaHintTextStyle,
                                                        contentPadding:
                                                            EdgeInsets.all(10),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '${empdata[0].empCode} -  ${empdata[0].empName} - ${empdata[0].designation}',
                                                          textAlign:
                                                              TextAlign.start,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          softWrap: false,
                                                          maxLines: 5,
                                                          style:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 14,
                                                            color: ColorResources
                                                                .GREY_NINETY,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: ColorResources
                                                                .GREY_THIRTY,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                                color: ColorResources
                                                                    .GREY_THIRTY,
                                                                width: 1),
                                                          ),
                                                          child: Text(
                                                            'Note ! প্রাপকের পিন/ কোড যদি ভুল থাকে তবে সঠিক পিন/ কোড দিয়ে পরিবর্তন করুন',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 5,
                                                            style: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 10,
                                                              color: ColorResources
                                                                  .GREY_NINETY,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 25,
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: Container(
                                                          height: 56,
                                                          width:
                                                              double.infinity,
                                                          child: ElevatedButton(
                                                            child: Container(
                                                                height: 56,
                                                                child: Center(
                                                                    child: Text(
                                                                  'Submit',
                                                                  style: Styles
                                                                      .buttonTextStyle,
                                                                ))),
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              elevation: 0,
                                                              backgroundColor:
                                                                  ColorResources
                                                                      .APP_THEME_COLOR,
                                                              minimumSize:
                                                                  const Size
                                                                      .fromHeight(
                                                                      50), // NEW
                                                            ),
                                                            onPressed: () {
                                                              apaSupervisorInfoCubit
                                                                  .getPathHistory()
                                                                  .then(
                                                                      (nextPatHistoryId) async =>
                                                                          {
                                                                            apaCmntHistoryCubit.repository
                                                                                .submitGeneralComment(SubmitGeneralCommentModel(
                                                                                    listempBasicInfo.employeePin!,
                                                                                    listempBasicInfo.qAssignID!,
                                                                                    (nextPatHistoryId!.data![0].pathhistoryid!),
                                                                                    '',
                                                                                    empdata[0].empCode!,
                                                                                    // Get receiver info first time
                                                                                    listempBasicInfo.qSetID!,
                                                                                    (listempBasicInfo.priority! + 1),
                                                                                    apaCmntHistoryCubit.comment.trim()))
                                                                                .then((value) async => {
                                                                                      if (value.success == true)
                                                                                        {
                                                                                          if (empmenuInfofData.leavehistinput == -1)
                                                                                            {
                                                                                              await apaMenuInfoCubit.repository.apaSubmitLeaveInfo(SubmitLeaveInfo(nextPatHistoryId.data![0].pathhistoryid!, apaEmpLeaveCubit.leaveReason, apaEmpLeaveCubit.leaveDuration, apaEmpLeaveCubit.leaveRange, apaEmpLeaveCubit.leaveComment)).then((value) async => {})
                                                                                            },
                                                                                          if (empmenuInfofData.recomhrinputactive == -1)
                                                                                            {
                                                                                              apaMenuInfoCubit.repository.apaSubmitHrScore(SubmitHrScore(nextPatHistoryId.data![0].pathhistoryid!, 3, apaHrScoreCubit.hrScore))
                                                                                            },
                                                                                          if (empmenuInfofData.asupercomhistinput == -1)
                                                                                            {
                                                                                              apaMenuInfoCubit.repository.apaSubmitSuperComment(SubmitSuperComment(nextPatHistoryId.data![0].pathhistoryid!, supercommentbloc.supervisorComment.trim()))
                                                                                            },
                                                                                          if (empmenuInfofData.questioninputactive == -1)
                                                                                            {
                                                                                              apaMenuInfoCubit.repository.apaSubmitEmpScore(scoreList, nextPatHistoryId.data![0].pathhistoryid!),
                                                                                            },
                                                                                          if (empmenuInfofData.recominputactive == -1)
                                                                                            {
                                                                                              apaMenuInfoCubit.repository.apaSubmitRecommendation(submitRecomList, nextPatHistoryId.data![0].pathhistoryid!),
                                                                                            },
                                                                                          if (empmenuInfofData.recomhrinputactive == -1)
                                                                                            {
                                                                                              apaMenuInfoCubit.repository.apaSubmitHrScore(SubmitHrScore(nextPatHistoryId.data![0].pathhistoryid!, listempBasicInfo.qSetID!, apaHrScoreCubit.hrScore)),
                                                                                            },
                                                                                          if (empmenuInfofData.questiontrgactive == -1)
                                                                                            {
                                                                                              apaMenuInfoCubit.repository.apaSubmitTargetScore(scoreListTarget, nextPatHistoryId.data![0].pathhistoryid!),
                                                                                            },
                                                                                          CommonMethods.showMessage(context, 'সফলভাবে সাবমিট হয়েছে ', Colors.green),
                                                                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AnnualAppraisalMain(SearchFilter(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)))),
                                                                                        }
                                                                                    }),
                                                                          });
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          } // with initial receiver info
                                          else if (state
                                              is ApaGetEmployeeLoadingState) {
                                            return Container(
                                                height: 300,
                                                child: Center(
                                                    child:
                                                        CircularProgressIndicator()));
                                          } else if (state
                                              is ApaGetEmployeeLoadedState) {
                                            // when search receiver info
                                            print(
                                                'Get employee Loaded state called');
                                            return state.data.success == true
                                                ? Container(
                                                    // after search found receiver info
                                                    height: 300,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 16,
                                                              right: 16,
                                                              top: 5,
                                                              bottom: 5),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text('প্রাপক ',
                                                                  style:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        20,
                                                                    color: ColorResources
                                                                        .GREY_NINETY,
                                                                  )),
                                                              InkWell(
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    child: Icon(
                                                                      Icons
                                                                          .clear,
                                                                      color: ColorResources
                                                                          .GREY_SIXTY,
                                                                    ),
                                                                  ))
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 3,
                                                          ),
                                                          TextFormField(
                                                            onTap: () {},
                                                            autofocus: false,
                                                            enableSuggestions:
                                                                true,
                                                            controller:
                                                                _controllerReceiverPin,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            decoration:
                                                                InputDecoration(
                                                              filled: true,
                                                              suffixIcon:
                                                                  IconButton(
                                                                onPressed: () {
                                                                  print(
                                                                      'On Search click');
                                                                  apaGetEmployeeCubit
                                                                      .apaGetEmployeeInfo(_controllerReceiverPin
                                                                          .text
                                                                          .toString())
                                                                      .then((value) =>
                                                                          {});
                                                                },
                                                                icon: Icon(Icons
                                                                    .search),
                                                              ),
                                                              fillColor:
                                                                  ColorResources
                                                                      .TEXT_FIELD_COLOR,
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide: BorderSide(
                                                                      color: ColorResources
                                                                          .APP_THEME_COLOR,
                                                                      style: BorderStyle
                                                                          .solid,
                                                                      width:
                                                                          2)),
                                                              enabledBorder:
                                                                  const OutlineInputBorder(
                                                                borderSide: const BorderSide(
                                                                    color: ColorResources
                                                                        .TEXT_FIELD_BORDER_COLOR,
                                                                    width: 0.0),
                                                              ),
                                                              hintStyle: Styles
                                                                  .apaHintTextStyle,
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom: 10,
                                                                    top: 10),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                    '${state.data.data![0].employeeCode} - ${state.data.data![0].employeeName} - ${state.data.data![0].designationName}',
                                                                    style: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          14,
                                                                      color: ColorResources
                                                                          .GREY_NINETY,
                                                                    )),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: ColorResources
                                                                        .GREY_THIRTY,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                    border: Border.all(
                                                                        color: ColorResources
                                                                            .GREY_THIRTY,
                                                                        width:
                                                                            1),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        left: 5,
                                                                        right:
                                                                            5,
                                                                        bottom:
                                                                            5),
                                                                    child: Text(
                                                                      'Note ! \nপ্রাপকের পিন/ কোড যদি ভুল থাকে তবে সঠিক পিন/ কোড দিয়ে পরিবর্তন করুন',
                                                                      style: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            10,
                                                                        color: ColorResources
                                                                            .GREY_NINETY,
                                                                      ),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      maxLines:
                                                                          5,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .bottomCenter,
                                                              child: Container(
                                                                height: 56,
                                                                width: double
                                                                    .infinity,
                                                                child: ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                      elevation:
                                                                          0,
                                                                      backgroundColor:
                                                                          ColorResources
                                                                              .APP_THEME_COLOR,
                                                                      minimumSize: const Size
                                                                          .fromHeight(
                                                                          50), // NEW
                                                                    ),
                                                                    onPressed: () {
                                                                      apaSupervisorInfoCubit
                                                                          .getPathHistory()
                                                                          .then((nextPatHistoryId) async =>
                                                                              {
                                                                                apaCmntHistoryCubit.repository.submitGeneralComment(SubmitGeneralCommentModel(listempBasicInfo.employeePin!, listempBasicInfo.qAssignID!, (nextPatHistoryId!.data![0].pathhistoryid!), '', state.data.data![0].employeeCode!, listempBasicInfo.qSetID!, (listempBasicInfo.priority! + 1), apaCmntHistoryCubit.comment.trim())).then((value) async => {
                                                                                      if (value.success == true)
                                                                                        {
                                                                                          if (empmenuInfofData.leavehistinput == -1)
                                                                                            {
                                                                                              await apaMenuInfoCubit.repository.apaSubmitLeaveInfo(SubmitLeaveInfo(nextPatHistoryId.data![0].pathhistoryid!, apaEmpLeaveCubit.leaveReason, apaEmpLeaveCubit.leaveDuration, apaEmpLeaveCubit.leaveRange, apaEmpLeaveCubit.leaveComment)).then((value) async => {})
                                                                                            },
                                                                                          if (empmenuInfofData.recomhrinputactive == -1)
                                                                                            {
                                                                                              apaMenuInfoCubit.repository.apaSubmitHrScore(SubmitHrScore(nextPatHistoryId.data![0].pathhistoryid!, 3, apaHrScoreCubit.hrScore))
                                                                                            },
                                                                                          if (empmenuInfofData.asupercomhistinput == -1)
                                                                                            {
                                                                                              apaMenuInfoCubit.repository.apaSubmitSuperComment(SubmitSuperComment(nextPatHistoryId.data![0].pathhistoryid!, supercommentbloc.supervisorComment.trim()))
                                                                                            },
                                                                                          if (empmenuInfofData.questioninputactive == -1)
                                                                                            {
                                                                                              apaMenuInfoCubit.repository.apaSubmitEmpScore(scoreList, nextPatHistoryId.data![0].pathhistoryid!),
                                                                                            },
                                                                                          if (empmenuInfofData.recominputactive == -1)
                                                                                            {
                                                                                              apaMenuInfoCubit.repository.apaSubmitRecommendation(submitRecomList, nextPatHistoryId.data![0].pathhistoryid!),
                                                                                            },
                                                                                          if (empmenuInfofData.recomhrinputactive == -1)
                                                                                            {
                                                                                              apaMenuInfoCubit.repository.apaSubmitHrScore(SubmitHrScore(nextPatHistoryId.data![0].pathhistoryid!, listempBasicInfo.qSetID!, apaHrScoreCubit.hrScore)),
                                                                                            },
                                                                                          CommonMethods.showMessage(context, 'সফলভাবে সাবমিট হয়েছে ', Colors.green),
                                                                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AnnualAppraisalMain(SearchFilter(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)))),
                                                                                        }
                                                                                    }),
                                                                              });
                                                                    },
                                                                    child: Container(
                                                                        height: 56,
                                                                        child: Center(
                                                                            child: Text(
                                                                          'Submit',
                                                                          style:
                                                                              Styles.buttonTextStyle,
                                                                        )))),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ) // after search found receiver info
                                                : Container(
                                                    //  after search do not found receiver info;
                                                    height: 300,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text('প্রাপক',
                                                                  style:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        20,
                                                                    color: ColorResources
                                                                        .GREY_NINETY,
                                                                  )),
                                                              InkWell(
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    child: Icon(
                                                                      Icons
                                                                          .clear,
                                                                      color: ColorResources
                                                                          .GREY_SIXTY,
                                                                    ),
                                                                  ))
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 12,
                                                          ),
                                                          TextFormField(
                                                            onTap: () {},
                                                            autofocus: false,
                                                            enableSuggestions:
                                                                true,
                                                            controller:
                                                                _controllerReceiverPin,
                                                            decoration:
                                                                InputDecoration(
                                                              filled: true,
                                                              fillColor:
                                                                  ColorResources
                                                                      .TEXT_FIELD_COLOR,
                                                              suffixIcon:
                                                                  IconButton(
                                                                onPressed: () {
                                                                  print(
                                                                      'On Search click');
                                                                  apaGetEmployeeCubit
                                                                      .apaGetEmployeeInfo(_controllerReceiverPin
                                                                          .text
                                                                          .toString())
                                                                      .then((value) =>
                                                                          {});
                                                                },
                                                                icon: Icon(Icons
                                                                    .search),
                                                              ),
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide: BorderSide(
                                                                      color: ColorResources
                                                                          .APP_THEME_COLOR,
                                                                      style: BorderStyle
                                                                          .solid,
                                                                      width:
                                                                          2)),
                                                              enabledBorder:
                                                                  const OutlineInputBorder(
                                                                borderSide: const BorderSide(
                                                                    color: ColorResources
                                                                        .TEXT_FIELD_BORDER_COLOR,
                                                                    width: 0.0),
                                                              ),
                                                              hintText: '',
                                                              hintStyle: Styles
                                                                  .apaHintTextStyle,
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(text,
                                                                  style:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        14,
                                                                    color: ColorResources
                                                                        .GREY_NINETY,
                                                                  )),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: ColorResources
                                                                      .GREY_THIRTY,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  border: Border.all(
                                                                      color: ColorResources
                                                                          .GREY_THIRTY,
                                                                      width: 1),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              5,
                                                                          right:
                                                                              5),
                                                                  child: Text(
                                                                    'Note! \nপ্রাপকের পিন/ কোড যদি ভুল থাকে তবে সঠিক পিন/ কোড দিয়ে পরিবর্তন করুন',
                                                                    style: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          10,
                                                                      color: ColorResources
                                                                          .GREY_NINETY,
                                                                    ),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines: 5,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ); // after search do not found receiver info;
                                          } //when search receiver info
                                          else {
                                            // (state is WeatherError)
                                            return Center(
                                              child: Container(
                                                child: Text('Network Error'),
                                              ),
                                            );
                                          }
                                        },
                                      );
                                    });
                              } else {
                                _curr++;
                                _animateToIndex(_curr);
                                setState(() {});
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ) // when receiver found
                : Padding(
                    // when receiver not found
                    padding:
                        const EdgeInsets.only(left: 60, right: 24, bottom: 10),
                    child: Container(
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 56,
                          width: double.infinity,
                          child: ElevatedButton(
                            child: Container(
                                height: 56,
                                child: Center(
                                    child: Text(
                                  'Next',
                                  style: Styles.buttonTextStyle,
                                ))),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: ColorResources.APP_THEME_COLOR,
                              minimumSize: const Size.fromHeight(50), // NEW
                            ),
                            onPressed: () {
                              if (_curr == _widgetList.length - 1) {
                                //-----------Validation Start---------
                                if (empmenuInfofData.questioninputactive ==
                                    -1) {
                                  scoreCubit.controllerMap
                                      .forEach((key, value) {
                                    hasScore =
                                        value.text.isNotEmpty ? true : false;
                                  });
                                  if (hasScore == false) {
                                    CommonMethods.showMessage(
                                        context, 'স্কোর যোগ করুন ', Colors.red);
                                    return;
                                  } else {
                                    scoreCubit.controllerMap
                                        .forEach((key, value) {
                                      print(
                                          'Submit Value Score key${key.toString()}Score value ${value.text}');

                                      var submitItem = SubmitScoreItem();
                                      submitItem.scorequestionId =
                                          int.parse(key.toString());
                                      submitItem.score = int.parse(value.text);
                                      scoreList.add(submitItem);
                                    });
                                  }
                                }
                                if (empmenuInfofData.recominputactive == -1) {
                                  recomHisData.asMap().forEach((key, value) {
                                    apaRecomHistoryCubit.controllerList
                                        .asMap()
                                        .forEach(
                                            (keycontroller, valuecontroller) {
                                      apaRecomHistoryCubit.countControllerList
                                          .asMap()
                                          .forEach((keycount, valuecount) {
                                        if (key == keycontroller &&
                                            key == keycount) {
                                          var count = 0;
                                          if (valuecount.text.isNotEmpty) {
                                            count = int.parse(valuecount.text);
                                          }
                                          if (valuecontroller.text.isNotEmpty) {
                                            submitRecomList.add(SubmitRecomItem(
                                                value.recomId,
                                                count,
                                                valuecontroller.text));
                                          } else {
                                            if (count > 0) {
                                              submitRecomList.add(
                                                  SubmitRecomItem(value.recomId,
                                                      count, ''));
                                            }
                                          }
                                        }
                                      });
                                    });
                                  });

                                  hasRecom =
                                      submitRecomList.isNotEmpty ? true : false;
                                  print(
                                      'Has recom ${hasRecom} submitRecomList.isNotEmpty ${submitRecomList.isNotEmpty} ${submitRecomList.length}');
                                  if (hasRecom == false) {
                                    CommonMethods.showMessage(context,
                                        'সুপারিশ যোগ করুন', Colors.red);
                                    return;
                                  }
                                }
                                if (empmenuInfofData.asupercomhistinput == -1) {
                                  if (supercommentbloc
                                      .supervisorComment.isEmpty) {
                                    CommonMethods.showMessage(
                                        context,
                                        'সরাসরি তত্ত্বাবধায়ক সম্পর্কে মতামত যোগ করুন',
                                        Colors.red);
                                    return;
                                  }
                                }
                                if (empmenuInfofData.recomhrinputactive == -1) {
                                  if (apaHrScoreCubit.hrScore.isEmpty) {
                                    CommonMethods.showMessage(
                                        context,
                                        'হিউমান রিসোর্সে স্কোর যোগ করুন ',
                                        Colors.red);
                                    return;
                                  }
                                }
                                if (apaEmpInfoCubit
                                        .approvalPathSet!
                                        .data![listempBasicInfo.priority! - 1]
                                        .generalcomments ==
                                    -1) {
                                  if (apaCmntHistoryCubit.comment.isEmpty) {
                                    CommonMethods.showMessage(context,
                                        'মন্তব্য যোগ করুন', Colors.red);
                                    return;
                                  }
                                }
                                //-----------Validation End---------

                                //----------For when do not found receiver info

                                var lastStepPriorityNum = apaEmpInfoCubit
                                    .approvalPathSet!
                                    .data![apaEmpInfoCubit
                                            .approvalPathSet!.data!.length -
                                        1]
                                    .priorotyNo;
                                var recentPriorityNumber =
                                    widget.arguments.priority;
                                print(
                                    'lastStepPriorityNum : $lastStepPriorityNum widget.arguments.priority : ${widget.arguments.priority}  listempBasicInfo.priority : ${listempBasicInfo.priority}');
                                // widget.arguments.priority
                                if (lastStepPriorityNum ==
                                    recentPriorityNumber) {
                                  // for last step
                                  showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      isDismissible: true,
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                            //  for last step
                                            height: 300,
                                            child: Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text('প্রাপক',
                                                          style:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 20,
                                                            color: ColorResources
                                                                .GREY_NINETY,
                                                          )),
                                                      InkWell(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                            child: Icon(
                                                              Icons.clear,
                                                              color:
                                                                  ColorResources
                                                                      .GREY_SIXTY,
                                                            ),
                                                          ))
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 12,
                                                  ),
                                                  TextFormField(
                                                    onTap: () {},
                                                    autofocus: false,
                                                    enableSuggestions: true,
                                                    enabled: false,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: ColorResources
                                                          .TEXT_FIELD_COLOR,
                                                      suffixIcon: IconButton(
                                                        onPressed: () {},
                                                        icon:
                                                            Icon(Icons.search),
                                                      ),
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  4),
                                                          borderSide: BorderSide(
                                                              color: ColorResources
                                                                  .APP_THEME_COLOR,
                                                              style: BorderStyle
                                                                  .solid,
                                                              width: 2)),
                                                      enabledBorder:
                                                          const OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                            color: ColorResources
                                                                .TEXT_FIELD_BORDER_COLOR,
                                                            width: 0.0),
                                                      ),
                                                      hintText: '',
                                                      hintStyle: Styles
                                                          .apaHintTextStyle,
                                                      contentPadding:
                                                          EdgeInsets.all(10),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(text,
                                                          style:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 14,
                                                            color: ColorResources
                                                                .GREY_NINETY,
                                                          )),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: ColorResources
                                                              .GREY_THIRTY,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                              color: ColorResources
                                                                  .GREY_THIRTY,
                                                              width: 1),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 5,
                                                                  right: 5),
                                                          child: Text(
                                                            'Note! \nপ্রাপকের তথ্য প্রয়োজন নেই ( সর্বশেষ ধাপ )',
                                                            style: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 10,
                                                              color: ColorResources
                                                                  .GREY_NINETY,
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 5,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: Container(
                                                            height: 56,
                                                            width:
                                                                double.infinity,
                                                            child: ElevatedButton(
                                                                style: ElevatedButton.styleFrom(
                                                                  elevation: 0,
                                                                  backgroundColor:
                                                                      ColorResources
                                                                          .APP_THEME_COLOR,
                                                                  minimumSize:
                                                                      const Size
                                                                          .fromHeight(
                                                                          50), // NEW
                                                                ),
                                                                onPressed: () {
                                                                  apaSupervisorInfoCubit
                                                                      .getPathHistory()
                                                                      .then(
                                                                          (nextPatHistoryId) async =>
                                                                              {
                                                                                apaCmntHistoryCubit.repository
                                                                                    .submitGeneralComment(SubmitGeneralCommentModel(
                                                                                        listempBasicInfo.employeePin!,
                                                                                        listempBasicInfo.qAssignID!,
                                                                                        (nextPatHistoryId!.data![0].pathhistoryid!),
                                                                                        '',
                                                                                        '',
                                                                                        // Get receiver info first time
                                                                                        listempBasicInfo.qSetID!,
                                                                                        (listempBasicInfo.priority! + 1),
                                                                                        apaCmntHistoryCubit.comment.trim()))
                                                                                    .then((value) async => {
                                                                                          if (value.success == true)
                                                                                            {
                                                                                              if (empmenuInfofData.leavehistinput == -1)
                                                                                                {
                                                                                                  await apaMenuInfoCubit.repository.apaSubmitLeaveInfo(SubmitLeaveInfo(nextPatHistoryId.data![0].pathhistoryid!, apaEmpLeaveCubit.leaveReason, apaEmpLeaveCubit.leaveDuration, apaEmpLeaveCubit.leaveRange, apaEmpLeaveCubit.leaveComment)).then((value) async => {})
                                                                                                },
                                                                                              if (empmenuInfofData.recomhrinputactive == -1)
                                                                                                {
                                                                                                  apaMenuInfoCubit.repository.apaSubmitHrScore(SubmitHrScore(nextPatHistoryId.data![0].pathhistoryid!, 3, apaHrScoreCubit.hrScore))
                                                                                                },
                                                                                              if (empmenuInfofData.asupercomhistinput == -1)
                                                                                                {
                                                                                                  apaMenuInfoCubit.repository.apaSubmitSuperComment(SubmitSuperComment(nextPatHistoryId.data![0].pathhistoryid!, supercommentbloc.supervisorComment.trim()))
                                                                                                },
                                                                                              if (empmenuInfofData.questioninputactive == -1)
                                                                                                {
                                                                                                  apaMenuInfoCubit.repository.apaSubmitEmpScore(scoreList, nextPatHistoryId.data![0].pathhistoryid!),
                                                                                                },
                                                                                              if (empmenuInfofData.recominputactive == -1)
                                                                                                {
                                                                                                  apaMenuInfoCubit.repository.apaSubmitRecommendation(submitRecomList, nextPatHistoryId.data![0].pathhistoryid!),
                                                                                                },
                                                                                              if (empmenuInfofData.recomhrinputactive == -1)
                                                                                                {
                                                                                                  apaMenuInfoCubit.repository.apaSubmitHrScore(SubmitHrScore(nextPatHistoryId.data![0].pathhistoryid!, listempBasicInfo.qSetID!, apaHrScoreCubit.hrScore)),
                                                                                                },
                                                                                              if (empmenuInfofData.questiontrgactive == -1)
                                                                                                {
                                                                                                  apaMenuInfoCubit.repository.apaSubmitTargetScore(scoreListTarget, nextPatHistoryId.data![0].pathhistoryid!),
                                                                                                },
                                                                                              CommonMethods.showMessage(context, 'সফলভাবে সাবমিট হয়েছে ', Colors.green),
                                                                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AnnualAppraisalMain(SearchFilter(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)))),
                                                                                            }
                                                                                        }),
                                                                              });
                                                                },
                                                                child: Container(
                                                                    height: 56,
                                                                    child: Center(
                                                                        child: Text(
                                                                      'Submit',
                                                                      style: Styles
                                                                          .buttonTextStyle,
                                                                    )))),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ));
                                      }); // for last step
                                } else {
                                  showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      isDismissible: true,
                                      context: context,
                                      builder: (context) {
                                        return BlocConsumer<ApaGetEmployeeCubit,
                                            ApaGetEmployeeState>(
                                          listener: (context, state) {
                                            if (state
                                                is ApaGetEmployeeErrorState) {
                                              final snackBar = SnackBar(
                                                content: Text(
                                                    Languages.of(context)!
                                                        .internetErrorText),
                                                backgroundColor: Colors.red,
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            }
                                          },
                                          buildWhen: (previous, current) =>
                                              previous != current,
                                          builder: (context, state) {
                                            if (state
                                                is ApaGetEmployeeInitialState) {
                                              return Container(
                                                // When receiver info not found first view
                                                height: 300,
                                                child: SingleChildScrollView(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text('প্রাপক',
                                                                style:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 20,
                                                                  color: ColorResources
                                                                      .GREY_NINETY,
                                                                )),
                                                            InkWell(
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Container(
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: ColorResources
                                                                        .GREY_SIXTY,
                                                                  ),
                                                                ))
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 12,
                                                        ),
                                                        TextFormField(
                                                          onTap: () {},
                                                          autofocus: false,
                                                          enableSuggestions:
                                                              true,
                                                          controller:
                                                              empInfoController,
                                                          decoration:
                                                              InputDecoration(
                                                            filled: true,
                                                            suffixIcon:
                                                                IconButton(
                                                              onPressed: () {
                                                                print(
                                                                    'On Search click');
                                                                apaGetEmployeeCubit
                                                                    .apaGetEmployeeInfo(
                                                                        empInfoController
                                                                            .text
                                                                            .toString())
                                                                    .then(
                                                                        (value) =>
                                                                            {});
                                                              },
                                                              icon: Icon(
                                                                  Icons.search),
                                                            ),
                                                            fillColor:
                                                                ColorResources
                                                                    .TEXT_FIELD_COLOR,
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                borderSide: BorderSide(
                                                                    color: ColorResources
                                                                        .APP_THEME_COLOR,
                                                                    style: BorderStyle
                                                                        .solid,
                                                                    width: 2)),
                                                            enabledBorder:
                                                                const OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                  color: ColorResources
                                                                      .TEXT_FIELD_BORDER_COLOR,
                                                                  width: 0.0),
                                                            ),
                                                            hintText: '',
                                                            hintStyle: Styles
                                                                .apaHintTextStyle,
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    10),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(text,
                                                                style:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 14,
                                                                  color: ColorResources
                                                                      .GREY_NINETY,
                                                                )),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: ColorResources
                                                                    .GREY_THIRTY,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                border: Border.all(
                                                                    color: ColorResources
                                                                        .GREY_THIRTY,
                                                                    width: 1),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left: 5,
                                                                        right:
                                                                            5),
                                                                child: Text(
                                                                  'Note! \nপ্রাপকের পিন/ কোড যদি ভুল থাকে তবে সঠিক পিন/ কোড দিয়ে পরিবর্তন করুন',
                                                                  style:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        10,
                                                                    color: ColorResources
                                                                        .GREY_NINETY,
                                                                  ),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 5,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            } else if (state
                                                is ApaGetEmployeeLoadingState) {
                                              return Container(
                                                  height: 300,
                                                  child: Center(
                                                      child:
                                                          CircularProgressIndicator()));
                                            } else if (state
                                                is ApaGetEmployeeLoadedState) {
                                              return state.data.success ==
                                                      true // after search receiver found
                                                  ? Container(
                                                      height: 300,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(16),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text('প্রাপক',
                                                                    style: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
                                                                      color: ColorResources
                                                                          .GREY_NINETY,
                                                                    )),
                                                                InkWell(
                                                                    onTap: () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .clear,
                                                                        color: ColorResources
                                                                            .GREY_SIXTY,
                                                                      ),
                                                                    ))
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 12,
                                                            ),
                                                            TextFormField(
                                                              onTap: () {},
                                                              autofocus: false,
                                                              enableSuggestions:
                                                                  true,
                                                              controller:
                                                                  empInfoController,
                                                              decoration:
                                                                  InputDecoration(
                                                                suffixIcon:
                                                                    IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'On Search click');
                                                                    apaGetEmployeeCubit
                                                                        .apaGetEmployeeInfo(empInfoController
                                                                            .text
                                                                            .toString())
                                                                        .then((value) =>
                                                                            {});
                                                                  },
                                                                  icon: Icon(Icons
                                                                      .search),
                                                                ),
                                                                filled: true,
                                                                fillColor:
                                                                    ColorResources
                                                                        .TEXT_FIELD_COLOR,
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                4),
                                                                    borderSide: BorderSide(
                                                                        color: ColorResources
                                                                            .APP_THEME_COLOR,
                                                                        style: BorderStyle
                                                                            .solid,
                                                                        width:
                                                                            2)),
                                                                enabledBorder:
                                                                    const OutlineInputBorder(
                                                                  borderSide: const BorderSide(
                                                                      color: ColorResources
                                                                          .TEXT_FIELD_BORDER_COLOR,
                                                                      width:
                                                                          0.0),
                                                                ),
                                                                hintText: '',
                                                                hintStyle: Styles
                                                                    .apaHintTextStyle,
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 15,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                    '${state.data.data![0].employeeCode} -  ${state.data.data![0].employeeName} - ${state.data.data![0].designationName}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    softWrap:
                                                                        false,
                                                                    maxLines: 5,
                                                                    style: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          14,
                                                                      color: ColorResources
                                                                          .GREY_NINETY,
                                                                    )),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              child: Align(
                                                                alignment: Alignment
                                                                    .bottomCenter,
                                                                child:
                                                                    Container(
                                                                  height: 56,
                                                                  width: double
                                                                      .infinity,
                                                                  child: ElevatedButton(
                                                                      style: ElevatedButton.styleFrom(
                                                                        elevation:
                                                                            0,
                                                                        backgroundColor:
                                                                            ColorResources.APP_THEME_COLOR,
                                                                        minimumSize: const Size
                                                                            .fromHeight(
                                                                            50), // NEW
                                                                      ),
                                                                      onPressed: () {
                                                                        apaSupervisorInfoCubit
                                                                            .getPathHistory()
                                                                            .then((nextPatHistoryId) async =>
                                                                                {
                                                                                  apaCmntHistoryCubit.repository
                                                                                      .submitGeneralComment(SubmitGeneralCommentModel(
                                                                                          listempBasicInfo.employeePin!,
                                                                                          listempBasicInfo.qAssignID!,
                                                                                          (nextPatHistoryId!.data![0].pathhistoryid!),
                                                                                          '',
                                                                                          state.data.data![0].employeeCode!,
                                                                                          // Get receiver info first time
                                                                                          listempBasicInfo.qSetID!,
                                                                                          (listempBasicInfo.priority! + 1),
                                                                                          apaCmntHistoryCubit.comment.trim()))
                                                                                      .then((value) async => {
                                                                                            if (value.success == true)
                                                                                              {
                                                                                                if (empmenuInfofData.leavehistinput == -1)
                                                                                                  {
                                                                                                    await apaMenuInfoCubit.repository.apaSubmitLeaveInfo(SubmitLeaveInfo(nextPatHistoryId.data![0].pathhistoryid!, apaEmpLeaveCubit.leaveReason, apaEmpLeaveCubit.leaveDuration, apaEmpLeaveCubit.leaveRange, apaEmpLeaveCubit.leaveComment)).then((value) async => {})
                                                                                                  },
                                                                                                if (empmenuInfofData.recomhrinputactive == -1)
                                                                                                  {
                                                                                                    apaMenuInfoCubit.repository.apaSubmitHrScore(SubmitHrScore(nextPatHistoryId.data![0].pathhistoryid!, 3, apaHrScoreCubit.hrScore))
                                                                                                  },
                                                                                                if (empmenuInfofData.asupercomhistinput == -1)
                                                                                                  {
                                                                                                    apaMenuInfoCubit.repository.apaSubmitSuperComment(SubmitSuperComment(nextPatHistoryId.data![0].pathhistoryid!, supercommentbloc.supervisorComment.trim()))
                                                                                                  },
                                                                                                if (empmenuInfofData.questioninputactive == -1)
                                                                                                  {
                                                                                                    apaMenuInfoCubit.repository.apaSubmitEmpScore(scoreList, nextPatHistoryId.data![0].pathhistoryid!),
                                                                                                  },
                                                                                                if (empmenuInfofData.recominputactive == -1)
                                                                                                  {
                                                                                                    apaMenuInfoCubit.repository.apaSubmitRecommendation(submitRecomList, nextPatHistoryId.data![0].pathhistoryid!),
                                                                                                  },
                                                                                                if (empmenuInfofData.recomhrinputactive == -1)
                                                                                                  {
                                                                                                    apaMenuInfoCubit.repository.apaSubmitHrScore(SubmitHrScore(nextPatHistoryId.data![0].pathhistoryid!, listempBasicInfo.qSetID!, apaHrScoreCubit.hrScore)),
                                                                                                  },
                                                                                                if (empmenuInfofData.questiontrgactive == -1)
                                                                                                  {
                                                                                                    apaMenuInfoCubit.repository.apaSubmitTargetScore(scoreListTarget, nextPatHistoryId.data![0].pathhistoryid!),
                                                                                                  },
                                                                                                CommonMethods.showMessage(context, 'সফলভাবে সাবমিট হয়েছে ', Colors.green),
                                                                                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AnnualAppraisalMain(SearchFilter(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)))),
                                                                                              }
                                                                                          }),
                                                                                });
                                                                      },
                                                                      child: Container(
                                                                          height: 56,
                                                                          child: Center(
                                                                              child: Text(
                                                                            'Submit',
                                                                            style:
                                                                                Styles.buttonTextStyle,
                                                                          )))),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      // after search receiver not found
                                                      height: 300,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(16),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text('প্রাপক',
                                                                    style: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
                                                                      color: ColorResources
                                                                          .GREY_NINETY,
                                                                    )),
                                                                InkWell(
                                                                    onTap: () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .clear,
                                                                        color: ColorResources
                                                                            .GREY_SIXTY,
                                                                      ),
                                                                    ))
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 12,
                                                            ),
                                                            TextFormField(
                                                              onTap: () {},
                                                              controller:
                                                                  empInfoController,
                                                              autofocus: false,
                                                              enableSuggestions:
                                                                  true,
                                                              decoration:
                                                                  InputDecoration(
                                                                filled: true,
                                                                fillColor:
                                                                    ColorResources
                                                                        .TEXT_FIELD_COLOR,
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                4),
                                                                    borderSide: BorderSide(
                                                                        color: ColorResources
                                                                            .APP_THEME_COLOR,
                                                                        style: BorderStyle
                                                                            .solid,
                                                                        width:
                                                                            2)),
                                                                enabledBorder:
                                                                    const OutlineInputBorder(
                                                                  borderSide: const BorderSide(
                                                                      color: ColorResources
                                                                          .TEXT_FIELD_BORDER_COLOR,
                                                                      width:
                                                                          0.0),
                                                                ),
                                                                hintText: '',
                                                                hintStyle: Styles
                                                                    .apaHintTextStyle,
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            20),
                                                                suffixIcon:
                                                                    IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'On Search click');
                                                                    apaGetEmployeeCubit
                                                                        .apaGetEmployeeInfo(empInfoController
                                                                            .text
                                                                            .toString())
                                                                        .then((value) =>
                                                                            {});
                                                                  },
                                                                  icon: Icon(Icons
                                                                      .search),
                                                                ),
                                                              ),
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(text,
                                                                    style: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          14,
                                                                      color: ColorResources
                                                                          .GREY_NINETY,
                                                                    )),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: ColorResources
                                                                        .GREY_THIRTY,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                    border: Border.all(
                                                                        color: ColorResources
                                                                            .GREY_THIRTY,
                                                                        width:
                                                                            1),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        left: 5,
                                                                        right:
                                                                            5),
                                                                    child: Text(
                                                                      'Note! \nপ্রাপকের পিন/ কোড যদি ভুল থাকে তবে সঠিক পিন/ কোড দিয়ে পরিবর্তন করুন',
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      maxLines:
                                                                          5,
                                                                      style: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            10,
                                                                        color: ColorResources
                                                                            .GREY_NINETY,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
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
                                        );
                                      });
                                }
                              } else {
                                _curr++;
                                _animateToIndex(_curr);
                                setState(() {});
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ); // when receiver info not found
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(color: ColorResources.WHITE),
            backgroundColor: ColorResources.APP_THEME_COLOR,
            title: Center(
              child: Text(
                'Input KPI',
                style: Styles.appBarTextStyle,
              ),
            ),
          ),
          floatingActionButton: Visibility(
            visible:
                MediaQuery.of(context).viewInsets.bottom != 0 ? false : true,
            child: BlocConsumer<ApaReceiverInfoCubit, ApaReceiverInfoState>(
              listener: (context, state) {
                if (state is ApaEmpInfoErrorState) {
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
                if (state is ApaSupervisorInfoInitialState) {
                  return Center(child: SizedBox());
                } else if (state is ApaSupervisorInfoLoadingState) {
                  return Center(child: SizedBox());
                } else if (state is ApaSupervisorInfoLoadedState) {
                  var empdata = state.data.data!;
                  var supervisorController = TextEditingController();
                  EmpMenuInfoData empmenuInfofData =
                      apaMenuInfoCubit.empMenuInfoData!;

                  if (empdata.isNotEmpty) {
                    supervisorController.text = empdata[0].empCode.toString();
                  }
                  return empdata.isNotEmpty // when receiver found
                      ? Padding(
                          padding: const EdgeInsets.only(
                            left: 60,
                            right: 24,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 56,
                                  child: ElevatedButton.icon(
                                    icon: Icon(Icons.arrow_back_ios,
                                        size: 15, color: ColorResources.WHITE),
                                    onPressed: () {
                                      print('_curr $_curr');
                                      if (_curr != 0) {
                                        _curr--;
                                        _animateToIndex(_curr);
                                        setState(() {});
                                      }
                                    },
                                    label: Text(
                                      'Previous',
                                      style: Styles.buttonTextStyle,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor:
                                          ColorResources.APP_THEME_COLOR,
                                      minimumSize:
                                          const Size.fromHeight(50), // NEW
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                // Next Button
                                flex: 1,
                                child: Container(
                                  height: 56,
                                  child: ElevatedButton(
                                    /*Icon(Icons.arrow_forward_ios_outlined,
                                  size: 15, color: ColorResources.WHITE),*/
                                    onPressed: () {
                                      print('_curr $_curr');
                                      print(
                                          'Present Item ${_list[_curr].toString()}');
                                      if (_curr == _widgetList.length - 1) {
                                        //-----------Validation Start---------
                                        if (empmenuInfofData
                                                .questioninputactive ==
                                            -1) {
                                          scoreCubit.controllerMap
                                              .forEach((key, value) {
                                            hasScore = value.text.isNotEmpty
                                                ? true
                                                : false;
                                          });
                                          if (hasScore == false) {
                                            CommonMethods.showMessage(context,
                                                'স্কোর যোগ করুন ', Colors.red);
                                            return;
                                          } else {
                                            scoreCubit.controllerMap
                                                .forEach((key, value) {
                                              print(
                                                  'Submit Value Score key${key.toString()}Score value ${value.text}');

                                              var submitItem =
                                                  SubmitScoreItem();
                                              submitItem.scorequestionId =
                                                  int.parse(key.toString());
                                              submitItem.score =
                                                  int.parse(value.text);
                                              scoreList.add(submitItem);
                                            });
                                          }
                                        }
                                        if (empmenuInfofData.recominputactive ==
                                            -1) {
                                          recomHisData
                                              .asMap()
                                              .forEach((key, value) {
                                            apaRecomHistoryCubit.controllerList
                                                .asMap()
                                                .forEach((keycontroller,
                                                    valuecontroller) {
                                              apaRecomHistoryCubit
                                                  .countControllerList
                                                  .asMap()
                                                  .forEach(
                                                      (keycount, valuecount) {
                                                if (key == keycontroller &&
                                                    key == keycount) {
                                                  var count = 0;
                                                  if (valuecount
                                                      .text.isNotEmpty) {
                                                    count = int.parse(
                                                        valuecount.text);
                                                  }

                                                  if (valuecontroller
                                                      .text.isNotEmpty) {
                                                    submitRecomList.add(
                                                        SubmitRecomItem(
                                                            value.recomId,
                                                            count,
                                                            valuecontroller
                                                                .text));
                                                  } else {
                                                    if (count > 0) {
                                                      submitRecomList.add(
                                                          SubmitRecomItem(
                                                              value.recomId,
                                                              count,
                                                              ' '));
                                                    }
                                                  }
                                                }
                                              });
                                            });
                                          });

                                          hasRecom = submitRecomList.isNotEmpty
                                              ? true
                                              : false;
                                          if (hasRecom == false) {
                                            CommonMethods.showMessage(context,
                                                'সুপারিশ যোগ করুন', Colors.red);
                                            return;
                                          }
                                        }
                                        if (empmenuInfofData
                                                .asupercomhistinput ==
                                            -1) {
                                          if (supercommentbloc
                                              .supervisorComment.isEmpty) {
                                            CommonMethods.showMessage(
                                                context,
                                                'সরাসরি তত্ত্বাবধায়ক সম্পর্কে মতামত যোগ করুন',
                                                Colors.red);
                                            return;
                                          }
                                        }
                                        if (empmenuInfofData
                                                .recomhrinputactive ==
                                            -1) {
                                          if (apaHrScoreCubit.hrScore.isEmpty) {
                                            CommonMethods.showMessage(
                                                context,
                                                'হিউমান রিসোর্সে স্কোর যোগ করুন ',
                                                Colors.red);
                                            return;
                                          }
                                        }
                                        print(
                                            'GeneralComment ${apaEmpInfoCubit.approvalPathSet!.data![listempBasicInfo.priority! - 1].generalcomments} listempBasicInfo.priority ${listempBasicInfo.priority}');

                                        if (apaEmpInfoCubit
                                                .approvalPathSet!
                                                .data![
                                                    listempBasicInfo.priority! -
                                                        1]
                                                .generalcomments ==
                                            -1) {
                                          if (apaCmntHistoryCubit
                                              .comment.isEmpty) {
                                            CommonMethods.showMessage(context,
                                                'মন্তব্য যোগ করুন', Colors.red);
                                            return;
                                          }
                                        }

                                        //-----------Validation End---------

                                        try {
                                          targetScoreCubit.controllerMapTarget
                                              .forEach((keyTarget, value) {
                                            print(
                                                'target Key $keyTarget Value ${value.text.toString()}');
                                            var submitTargetItem =
                                                SubmitTargetScoreItem();
                                            submitTargetItem.questionId =
                                                keyTarget;
                                            submitTargetItem.target = num.parse(
                                                value.text.toString());
                                            targetScoreCubit.controllerMapEarned
                                                .forEach((key, value) {
                                              if (keyTarget == key) {
                                                submitTargetItem.earned =
                                                    num.parse(
                                                        value.text.toString());
                                              }
                                            });
                                            try {
                                              targetScoreCubit
                                                  .controllerMapPercentage
                                                  .forEach((key, value) {
                                                if (keyTarget == key) {
                                                  try {
                                                    submitTargetItem
                                                            .percentage =
                                                        num.parse(value.text
                                                            .toString());
                                                  } catch (e) {
                                                    print(e);
                                                    submitTargetItem
                                                        .percentage = 0;
                                                  }
                                                }
                                              });
                                            } catch (e) {
                                              print(e);
                                            }
                                            try {
                                              targetScoreCubit
                                                  .controllerMapEarnedScore
                                                  .forEach((key, value) {
                                                if (keyTarget == key) {
                                                  submitTargetItem.score =
                                                      num.parse(value.text
                                                          .toString());
                                                }
                                              });
                                            } catch (e) {
                                              print(e);
                                            }
                                            scoreListTarget
                                                .add(submitTargetItem);
                                          });
                                        } catch (e) {
                                          print(e);
                                        }

                                        //  ----------Receiver info start-------
                                        //  ----------For when found receiver info

                                        showModalBottomSheet(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            isDismissible: true,
                                            context: context,
                                            builder: (context) {
                                              return BlocConsumer<
                                                  ApaGetEmployeeCubit,
                                                  ApaGetEmployeeState>(
                                                listener: (context, state) {
                                                  if (state
                                                      is ApaGetEmployeeErrorState) {
                                                    final snackBar = SnackBar(
                                                      content: Text(Languages
                                                              .of(context)!
                                                          .internetErrorText),
                                                      backgroundColor:
                                                          Colors.red,
                                                    );
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(snackBar);
                                                  }
                                                },
                                                buildWhen:
                                                    (previous, current) =>
                                                        previous != current,
                                                builder: (context, state) {
                                                  if (state
                                                      is ApaGetEmployeeInitialState) {
                                                    // with first time get receiver info
                                                    return Container(
                                                      height: 300,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 16,
                                                                right: 16,
                                                                top: 5,
                                                                bottom: 5),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text('প্রাপক',
                                                                    style: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
                                                                      color: ColorResources
                                                                          .GREY_NINETY,
                                                                    )),
                                                                InkWell(
                                                                    onTap: () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .clear,
                                                                        color: ColorResources
                                                                            .GREY_SIXTY,
                                                                      ),
                                                                    ))
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 3,
                                                            ),
                                                            TextFormField(
                                                              onTap: () {},
                                                              autofocus: false,
                                                              enableSuggestions:
                                                                  true,
                                                              controller:
                                                                  supervisorController,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              decoration:
                                                                  InputDecoration(
                                                                filled: true,
                                                                suffixIcon:
                                                                    IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'On Search click');
                                                                    apaGetEmployeeCubit
                                                                        .apaGetEmployeeInfo(supervisorController
                                                                            .text
                                                                            .toString())
                                                                        .then((value) =>
                                                                            {});
                                                                  },
                                                                  icon: Icon(Icons
                                                                      .search),
                                                                ),
                                                                fillColor:
                                                                    ColorResources
                                                                        .TEXT_FIELD_COLOR,
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                4),
                                                                    borderSide: BorderSide(
                                                                        color: ColorResources
                                                                            .APP_THEME_COLOR,
                                                                        style: BorderStyle
                                                                            .solid,
                                                                        width:
                                                                            2)),
                                                                enabledBorder:
                                                                    const OutlineInputBorder(
                                                                  borderSide: const BorderSide(
                                                                      color: ColorResources
                                                                          .TEXT_FIELD_BORDER_COLOR,
                                                                      width:
                                                                          0.0),
                                                                ),
                                                                hintStyle: Styles
                                                                    .apaHintTextStyle,
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  '${empdata[0].empCode} -  ${empdata[0].empName} - ${empdata[0].designation}',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  softWrap:
                                                                      false,
                                                                  maxLines: 5,
                                                                  style:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        14,
                                                                    color: ColorResources
                                                                        .GREY_NINETY,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: ColorResources
                                                                        .GREY_THIRTY,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                    border: Border.all(
                                                                        color: ColorResources
                                                                            .GREY_THIRTY,
                                                                        width:
                                                                            1),
                                                                  ),
                                                                  child: Text(
                                                                    'Note ! প্রাপকের পিন/ কোড যদি ভুল থাকে তবে সঠিক পিন/ কোড দিয়ে পরিবর্তন করুন',
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines: 5,
                                                                    style: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          10,
                                                                      color: ColorResources
                                                                          .GREY_NINETY,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 25,
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              child: Align(
                                                                alignment: Alignment
                                                                    .bottomCenter,
                                                                child:
                                                                    Container(
                                                                  height: 56,
                                                                  width: double
                                                                      .infinity,
                                                                  child:
                                                                      ElevatedButton(
                                                                    child: Container(
                                                                        height: 56,
                                                                        child: Center(
                                                                            child: Text(
                                                                          'Submit',
                                                                          style:
                                                                              Styles.buttonTextStyle,
                                                                        ))),
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      elevation:
                                                                          0,
                                                                      backgroundColor:
                                                                          ColorResources
                                                                              .APP_THEME_COLOR,
                                                                      minimumSize: const Size
                                                                          .fromHeight(
                                                                          50), // NEW
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      apaSupervisorInfoCubit
                                                                          .getPathHistory()
                                                                          .then((nextPatHistoryId) async =>
                                                                              {
                                                                                apaCmntHistoryCubit.repository
                                                                                    .submitGeneralComment(SubmitGeneralCommentModel(
                                                                                        listempBasicInfo.employeePin!,
                                                                                        listempBasicInfo.qAssignID!,
                                                                                        (nextPatHistoryId!.data![0].pathhistoryid!),
                                                                                        '',
                                                                                        empdata[0].empCode!,
                                                                                        // Get receiver info first time
                                                                                        listempBasicInfo.qSetID!,
                                                                                        (listempBasicInfo.priority! + 1),
                                                                                        apaCmntHistoryCubit.comment.trim()))
                                                                                    .then((value) async => {
                                                                                          if (value.success == true)
                                                                                            {
                                                                                              if (empmenuInfofData.leavehistinput == -1)
                                                                                                {
                                                                                                  await apaMenuInfoCubit.repository.apaSubmitLeaveInfo(SubmitLeaveInfo(nextPatHistoryId.data![0].pathhistoryid!, apaEmpLeaveCubit.leaveReason, apaEmpLeaveCubit.leaveDuration, apaEmpLeaveCubit.leaveRange, apaEmpLeaveCubit.leaveComment)).then((value) async => {})
                                                                                                },
                                                                                              if (empmenuInfofData.recomhrinputactive == -1)
                                                                                                {
                                                                                                  apaMenuInfoCubit.repository.apaSubmitHrScore(SubmitHrScore(nextPatHistoryId.data![0].pathhistoryid!, 3, apaHrScoreCubit.hrScore))
                                                                                                },
                                                                                              if (empmenuInfofData.asupercomhistinput == -1)
                                                                                                {
                                                                                                  apaMenuInfoCubit.repository.apaSubmitSuperComment(SubmitSuperComment(nextPatHistoryId.data![0].pathhistoryid!, supercommentbloc.supervisorComment.trim()))
                                                                                                },
                                                                                              if (empmenuInfofData.questioninputactive == -1)
                                                                                                {
                                                                                                  apaMenuInfoCubit.repository.apaSubmitEmpScore(scoreList, nextPatHistoryId.data![0].pathhistoryid!),
                                                                                                },
                                                                                              if (empmenuInfofData.recominputactive == -1)
                                                                                                {
                                                                                                  apaMenuInfoCubit.repository.apaSubmitRecommendation(submitRecomList, nextPatHistoryId.data![0].pathhistoryid!),
                                                                                                },
                                                                                              if (empmenuInfofData.recomhrinputactive == -1)
                                                                                                {
                                                                                                  apaMenuInfoCubit.repository.apaSubmitHrScore(SubmitHrScore(nextPatHistoryId.data![0].pathhistoryid!, listempBasicInfo.qSetID!, apaHrScoreCubit.hrScore)),
                                                                                                },
                                                                                              if (empmenuInfofData.questiontrgactive == -1)
                                                                                                {
                                                                                                  apaMenuInfoCubit.repository.apaSubmitTargetScore(scoreListTarget, nextPatHistoryId.data![0].pathhistoryid!),
                                                                                                },
                                                                                              CommonMethods.showMessage(context, 'সফলভাবে সাবমিট হয়েছে ', Colors.green),
                                                                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AnnualAppraisalMain(SearchFilter(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)))),
                                                                                            }
                                                                                        }),
                                                                              });
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  } // with initial receiver info
                                                  else if (state
                                                      is ApaGetEmployeeLoadingState) {
                                                    return Container(
                                                        height: 300,
                                                        child: Center(
                                                            child:
                                                                CircularProgressIndicator()));
                                                  } else if (state
                                                      is ApaGetEmployeeLoadedState) {
                                                    // when search receiver info

                                                    return state.data.success ==
                                                            true
                                                        ? Container(
                                                            // after search found receiver info
                                                            height: 300,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 16,
                                                                      right: 16,
                                                                      top: 5,
                                                                      bottom:
                                                                          5),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                          'প্রাপক ',
                                                                          style:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                20,
                                                                            color:
                                                                                ColorResources.GREY_NINETY,
                                                                          )),
                                                                      InkWell(
                                                                          onTap:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                Icon(
                                                                              Icons.clear,
                                                                              color: ColorResources.GREY_SIXTY,
                                                                            ),
                                                                          ))
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 3,
                                                                  ),
                                                                  TextFormField(
                                                                    onTap:
                                                                        () {},
                                                                    autofocus:
                                                                        false,
                                                                    enableSuggestions:
                                                                        true,
                                                                    controller:
                                                                        _controllerReceiverPin,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      filled:
                                                                          true,
                                                                      suffixIcon:
                                                                          IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          print(
                                                                              'On Search click');
                                                                          apaGetEmployeeCubit
                                                                              .apaGetEmployeeInfo(_controllerReceiverPin.text.toString())
                                                                              .then((value) => {});
                                                                        },
                                                                        icon: Icon(
                                                                            Icons.search),
                                                                      ),
                                                                      fillColor:
                                                                          ColorResources
                                                                              .TEXT_FIELD_COLOR,
                                                                      border: OutlineInputBorder(
                                                                          borderRadius: BorderRadius.circular(
                                                                              4),
                                                                          borderSide: BorderSide(
                                                                              color: ColorResources.APP_THEME_COLOR,
                                                                              style: BorderStyle.solid,
                                                                              width: 2)),
                                                                      enabledBorder:
                                                                          const OutlineInputBorder(
                                                                        borderSide: const BorderSide(
                                                                            color:
                                                                                ColorResources.TEXT_FIELD_BORDER_COLOR,
                                                                            width: 0.0),
                                                                      ),
                                                                      hintStyle:
                                                                          Styles
                                                                              .apaHintTextStyle,
                                                                      contentPadding:
                                                                          EdgeInsets.all(
                                                                              10),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            10,
                                                                        top:
                                                                            10),
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                            '${state.data.data![0].employeeCode} - ${state.data.data![0].employeeName} - ${state.data.data![0].designationName}',
                                                                            style:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w700,
                                                                              fontSize: 14,
                                                                              color: ColorResources.GREY_NINETY,
                                                                            )),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                ColorResources.GREY_THIRTY,
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                            border:
                                                                                Border.all(color: ColorResources.GREY_THIRTY, width: 1),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsets.only(
                                                                                left: 5,
                                                                                right: 5,
                                                                                bottom: 5),
                                                                            child:
                                                                                Text(
                                                                              'Note ! \nপ্রাপকের পিন/ কোড যদি ভুল থাকে তবে সঠিক পিন/ কোড দিয়ে পরিবর্তন করুন',
                                                                              style: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w400,
                                                                                fontSize: 10,
                                                                                color: ColorResources.GREY_NINETY,
                                                                              ),
                                                                              overflow: TextOverflow.ellipsis,
                                                                              maxLines: 5,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .bottomCenter,
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            56,
                                                                        width: double
                                                                            .infinity,
                                                                        child: ElevatedButton(
                                                                            style: ElevatedButton.styleFrom(
                                                                              elevation: 0,
                                                                              backgroundColor: ColorResources.APP_THEME_COLOR,
                                                                              minimumSize: const Size.fromHeight(50), // NEW
                                                                            ),
                                                                            onPressed: () {
                                                                              apaSupervisorInfoCubit.getPathHistory().then((nextPatHistoryId) async => {
                                                                                    apaCmntHistoryCubit.repository.submitGeneralComment(SubmitGeneralCommentModel(listempBasicInfo.employeePin!, listempBasicInfo.qAssignID!, (nextPatHistoryId!.data![0].pathhistoryid!), '', state.data.data![0].employeeCode!, listempBasicInfo.qSetID!, (listempBasicInfo.priority! + 1), apaCmntHistoryCubit.comment.trim())).then((value) async => {
                                                                                          if (value.success == true)
                                                                                            {
                                                                                              if (empmenuInfofData.leavehistinput == -1)
                                                                                                {
                                                                                                  await apaMenuInfoCubit.repository.apaSubmitLeaveInfo(SubmitLeaveInfo(nextPatHistoryId.data![0].pathhistoryid!, apaEmpLeaveCubit.leaveReason, apaEmpLeaveCubit.leaveDuration, apaEmpLeaveCubit.leaveRange, apaEmpLeaveCubit.leaveComment)).then((value) async => {})
                                                                                                },
                                                                                              if (empmenuInfofData.recomhrinputactive == -1)
                                                                                                {
                                                                                                  apaMenuInfoCubit.repository.apaSubmitHrScore(SubmitHrScore(nextPatHistoryId.data![0].pathhistoryid!, 3, apaHrScoreCubit.hrScore))
                                                                                                },
                                                                                              if (empmenuInfofData.asupercomhistinput == -1)
                                                                                                {
                                                                                                  apaMenuInfoCubit.repository.apaSubmitSuperComment(SubmitSuperComment(nextPatHistoryId.data![0].pathhistoryid!, supercommentbloc.supervisorComment.trim()))
                                                                                                },
                                                                                              if (empmenuInfofData.questioninputactive == -1)
                                                                                                {
                                                                                                  apaMenuInfoCubit.repository.apaSubmitEmpScore(scoreList, nextPatHistoryId.data![0].pathhistoryid!),
                                                                                                },
                                                                                              if (empmenuInfofData.recominputactive == -1)
                                                                                                {
                                                                                                  apaMenuInfoCubit.repository.apaSubmitRecommendation(submitRecomList, nextPatHistoryId.data![0].pathhistoryid!),
                                                                                                },
                                                                                              if (empmenuInfofData.recomhrinputactive == -1)
                                                                                                {
                                                                                                  apaMenuInfoCubit.repository.apaSubmitHrScore(SubmitHrScore(nextPatHistoryId.data![0].pathhistoryid!, listempBasicInfo.qSetID!, apaHrScoreCubit.hrScore)),
                                                                                                },
                                                                                              CommonMethods.showMessage(context, 'সফলভাবে সাবমিট হয়েছে ', Colors.green),
                                                                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AnnualAppraisalMain(SearchFilter(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)))),
                                                                                            }
                                                                                        }),
                                                                                  });
                                                                            },
                                                                            child: Container(
                                                                                height: 56,
                                                                                child: Center(
                                                                                    child: Text(
                                                                                  'Submit',
                                                                                  style: Styles.buttonTextStyle,
                                                                                )))),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ) // after search found receiver info
                                                        : Container(
                                                            //  after search do not found receiver info;
                                                            height: 300,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(16),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                          'প্রাপক',
                                                                          style:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                20,
                                                                            color:
                                                                                ColorResources.GREY_NINETY,
                                                                          )),
                                                                      InkWell(
                                                                          onTap:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            child:
                                                                                Icon(
                                                                              Icons.clear,
                                                                              color: ColorResources.GREY_SIXTY,
                                                                            ),
                                                                          ))
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 12,
                                                                  ),
                                                                  TextFormField(
                                                                    onTap:
                                                                        () {},
                                                                    autofocus:
                                                                        false,
                                                                    enableSuggestions:
                                                                        true,
                                                                    controller:
                                                                        _controllerReceiverPin,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          ColorResources
                                                                              .TEXT_FIELD_COLOR,
                                                                      suffixIcon:
                                                                          IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          print(
                                                                              'On Search click');
                                                                          apaGetEmployeeCubit
                                                                              .apaGetEmployeeInfo(_controllerReceiverPin.text.toString())
                                                                              .then((value) => {});
                                                                        },
                                                                        icon: Icon(
                                                                            Icons.search),
                                                                      ),
                                                                      border: OutlineInputBorder(
                                                                          borderRadius: BorderRadius.circular(
                                                                              4),
                                                                          borderSide: BorderSide(
                                                                              color: ColorResources.APP_THEME_COLOR,
                                                                              style: BorderStyle.solid,
                                                                              width: 2)),
                                                                      enabledBorder:
                                                                          const OutlineInputBorder(
                                                                        borderSide: const BorderSide(
                                                                            color:
                                                                                ColorResources.TEXT_FIELD_BORDER_COLOR,
                                                                            width: 0.0),
                                                                      ),
                                                                      hintText:
                                                                          '',
                                                                      hintStyle:
                                                                          Styles
                                                                              .apaHintTextStyle,
                                                                      contentPadding:
                                                                          EdgeInsets.all(
                                                                              10),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(text,
                                                                          style:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w700,
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                ColorResources.GREY_NINETY,
                                                                          )),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              ColorResources.GREY_THIRTY,
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                          border: Border.all(
                                                                              color: ColorResources.GREY_THIRTY,
                                                                              width: 1),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsets
                                                                              .only(
                                                                              left: 5,
                                                                              right: 5),
                                                                          child:
                                                                              Text(
                                                                            'Note! \nপ্রাপকের পিন/ কোড যদি ভুল থাকে তবে সঠিক পিন/ কোড দিয়ে পরিবর্তন করুন',
                                                                            style:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w400,
                                                                              fontSize: 10,
                                                                              color: ColorResources.GREY_NINETY,
                                                                            ),
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            maxLines:
                                                                                5,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ); // after search do not found receiver info;
                                                  } //when search receiver info
                                                  else {
                                                    // (state is WeatherError)
                                                    return Center(
                                                      child: Container(
                                                        child: Text(
                                                            'Network Error'),
                                                      ),
                                                    );
                                                  }
                                                },
                                              );
                                            });
                                      } else {
                                        _curr++;
                                        _animateToIndex(_curr);
                                        setState(() {});
                                      }
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Next',
                                          style: Styles.buttonTextStyle,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Icon(Icons.arrow_forward_ios_outlined,
                                            size: 15,
                                            color: ColorResources.WHITE),
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor:
                                          ColorResources.APP_THEME_COLOR,
                                      minimumSize:
                                          const Size.fromHeight(50), // NEW
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ) // when receiver found
                      : Padding(
                          // when receiver info not found
                          padding: const EdgeInsets.only(
                            left: 60,
                            right: 24,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 56,
                                  child: ElevatedButton.icon(
                                    icon: Icon(Icons.arrow_back_ios,
                                        size: 15, color: ColorResources.WHITE),
                                    onPressed: () {
                                      print('_curr $_curr');
                                      if (_curr != 0) {
                                        _curr--;
                                        _animateToIndex(_curr);
                                        setState(() {});
                                      }
                                    },
                                    label: Text(
                                      'Previous',
                                      style: Styles.buttonTextStyle,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor:
                                          ColorResources.APP_THEME_COLOR,
                                      minimumSize:
                                          const Size.fromHeight(50), // NEW
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 56,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      print('_curr $_curr');
                                      if (_curr == _widgetList.length - 1) {
                                        //-----------Validation Start---------
                                        if (empmenuInfofData
                                                .questioninputactive ==
                                            -1) {
                                          scoreCubit.controllerMap
                                              .forEach((key, value) {
                                            hasScore = value.text.isNotEmpty
                                                ? true
                                                : false;
                                          });
                                          if (hasScore == false) {
                                            CommonMethods.showMessage(context,
                                                'স্কোর যোগ করুন ', Colors.red);
                                            return;
                                          } else {
                                            scoreCubit.controllerMap
                                                .forEach((key, value) {
                                              print(
                                                  'Submit Value Score key${key.toString()}Score value ${value.text}');

                                              var submitItem =
                                                  SubmitScoreItem();
                                              try {
                                                submitItem.scorequestionId =
                                                    int.parse(key.toString());
                                              } catch (e) {
                                                print(e);
                                                submitItem.scorequestionId = 0;
                                              }
                                              try {
                                                submitItem.score =
                                                    int.parse(value.text);
                                              } catch (e) {
                                                print(e);
                                                submitItem.score = 0;
                                              }
                                              scoreList.add(submitItem);
                                            });
                                          }
                                        }
                                        if (empmenuInfofData.recominputactive ==
                                            -1) {
                                          recomHisData
                                              .asMap()
                                              .forEach((key, value) {
                                            apaRecomHistoryCubit.controllerList
                                                .asMap()
                                                .forEach((keycontroller,
                                                    valuecontroller) {
                                              apaRecomHistoryCubit
                                                  .countControllerList
                                                  .asMap()
                                                  .forEach(
                                                      (keycount, valuecount) {
                                                if (key == keycontroller &&
                                                    key == keycount) {
                                                  var count = 0;
                                                  if (valuecount
                                                      .text.isNotEmpty) {
                                                    count = int.parse(
                                                        valuecount.text);
                                                  }
                                                  if (valuecontroller
                                                      .text.isNotEmpty) {
                                                    submitRecomList.add(
                                                        SubmitRecomItem(
                                                            value.recomId,
                                                            count,
                                                            valuecontroller
                                                                .text));
                                                  } else {
                                                    if (count > 0) {
                                                      submitRecomList.add(
                                                          SubmitRecomItem(
                                                              value.recomId,
                                                              count,
                                                              ''));
                                                    }
                                                  }
                                                }
                                              });
                                            });
                                          });

                                          hasRecom = submitRecomList.isNotEmpty
                                              ? true
                                              : false;
                                          print(
                                              'Has recom ${hasRecom} submitRecomList.isNotEmpty ${submitRecomList.isNotEmpty} ${submitRecomList.length}');
                                          if (hasRecom == false) {
                                            CommonMethods.showMessage(context,
                                                'সুপারিশ যোগ করুন', Colors.red);
                                            return;
                                          }
                                        }
                                        if (empmenuInfofData
                                                .asupercomhistinput ==
                                            -1) {
                                          if (supercommentbloc
                                              .supervisorComment.isEmpty) {
                                            CommonMethods.showMessage(
                                                context,
                                                'সরাসরি তত্ত্বাবধায়ক সম্পর্কে মতামত যোগ করুন',
                                                Colors.red);
                                            return;
                                          }
                                        }
                                        if (empmenuInfofData
                                                .recomhrinputactive ==
                                            -1) {
                                          if (apaHrScoreCubit.hrScore.isEmpty) {
                                            CommonMethods.showMessage(
                                                context,
                                                'হিউমান রিসোর্সে স্কোর যোগ করুন ',
                                                Colors.red);
                                            return;
                                          }
                                        }
                                        if (apaEmpInfoCubit
                                                .approvalPathSet!
                                                .data![
                                                    listempBasicInfo.priority! -
                                                        1]
                                                .generalcomments ==
                                            -1) {
                                          if (apaCmntHistoryCubit
                                              .comment.isEmpty) {
                                            CommonMethods.showMessage(context,
                                                'মন্তব্য যোগ করুন', Colors.red);
                                            return;
                                          }
                                        }
                                        //-----------Validation End---------

                                        //----------For when do not found receiver info

                                        var lastStepPriorityNum =
                                            apaEmpInfoCubit
                                                .approvalPathSet!
                                                .data![apaEmpInfoCubit
                                                        .approvalPathSet!
                                                        .data!
                                                        .length -
                                                    1]
                                                .priorotyNo;
                                        var recentPriorityNumber =
                                            widget.arguments.priority;
                                        print(
                                            'lastStepPriorityNum : $lastStepPriorityNum widget.arguments.priority : ${widget.arguments.priority}  listempBasicInfo.priority : ${listempBasicInfo.priority}');
                                        // widget.arguments.priority
                                        if (lastStepPriorityNum ==
                                            recentPriorityNumber) {
                                          // for last step
                                          showModalBottomSheet(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              isDismissible: true,
                                              context: context,
                                              builder: (context) {
                                                return Container(
                                                    //  for last step
                                                    height: 300,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text('প্রাপক',
                                                                  style:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        20,
                                                                    color: ColorResources
                                                                        .GREY_NINETY,
                                                                  )),
                                                              InkWell(
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    child: Icon(
                                                                      Icons
                                                                          .clear,
                                                                      color: ColorResources
                                                                          .GREY_SIXTY,
                                                                    ),
                                                                  ))
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 12,
                                                          ),
                                                          TextFormField(
                                                            onTap: () {},
                                                            autofocus: false,
                                                            enableSuggestions:
                                                                true,
                                                            enabled: false,
                                                            decoration:
                                                                InputDecoration(
                                                              filled: true,
                                                              fillColor:
                                                                  ColorResources
                                                                      .TEXT_FIELD_COLOR,
                                                              suffixIcon:
                                                                  IconButton(
                                                                onPressed:
                                                                    () {},
                                                                icon: Icon(Icons
                                                                    .search),
                                                              ),
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide: BorderSide(
                                                                      color: ColorResources
                                                                          .APP_THEME_COLOR,
                                                                      style: BorderStyle
                                                                          .solid,
                                                                      width:
                                                                          2)),
                                                              enabledBorder:
                                                                  const OutlineInputBorder(
                                                                borderSide: const BorderSide(
                                                                    color: ColorResources
                                                                        .TEXT_FIELD_BORDER_COLOR,
                                                                    width: 0.0),
                                                              ),
                                                              hintText: '',
                                                              hintStyle: Styles
                                                                  .apaHintTextStyle,
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(text,
                                                                  style:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        14,
                                                                    color: ColorResources
                                                                        .GREY_NINETY,
                                                                  )),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: ColorResources
                                                                      .GREY_THIRTY,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  border: Border.all(
                                                                      color: ColorResources
                                                                          .GREY_THIRTY,
                                                                      width: 1),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              5,
                                                                          right:
                                                                              5),
                                                                  child: Text(
                                                                    'Note! \nপ্রাপকের তথ্য প্রয়োজন নেই ( সর্বশেষ ধাপ )',
                                                                    style: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          10,
                                                                      color: ColorResources
                                                                          .GREY_NINETY,
                                                                    ),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines: 5,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 15,
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .bottomCenter,
                                                                  child:
                                                                      Container(
                                                                    height: 56,
                                                                    width: double
                                                                        .infinity,
                                                                    child: ElevatedButton(
                                                                        style: ElevatedButton.styleFrom(
                                                                          elevation:
                                                                              0,
                                                                          backgroundColor:
                                                                              ColorResources.APP_THEME_COLOR,
                                                                          minimumSize: const Size
                                                                              .fromHeight(
                                                                              50), // NEW
                                                                        ),
                                                                        onPressed: () {
                                                                          apaSupervisorInfoCubit.getPathHistory().then((nextPatHistoryId) async =>
                                                                              {
                                                                                apaCmntHistoryCubit.repository
                                                                                    .submitGeneralComment(SubmitGeneralCommentModel(
                                                                                        listempBasicInfo.employeePin!,
                                                                                        listempBasicInfo.qAssignID!,
                                                                                        (nextPatHistoryId!.data![0].pathhistoryid!),
                                                                                        '',
                                                                                        '',
                                                                                        // Get receiver info first time
                                                                                        listempBasicInfo.qSetID!,
                                                                                        (listempBasicInfo.priority! + 1),
                                                                                        apaCmntHistoryCubit.comment.trim()))
                                                                                    .then((value) async => {
                                                                                          if (value.success == true)
                                                                                            {
                                                                                              if (empmenuInfofData.leavehistinput == -1)
                                                                                                {
                                                                                                  await apaMenuInfoCubit.repository.apaSubmitLeaveInfo(SubmitLeaveInfo(nextPatHistoryId.data![0].pathhistoryid!, apaEmpLeaveCubit.leaveReason, apaEmpLeaveCubit.leaveDuration, apaEmpLeaveCubit.leaveRange, apaEmpLeaveCubit.leaveComment)).then((value) async => {})
                                                                                                },
                                                                                              if (empmenuInfofData.recomhrinputactive == -1)
                                                                                                {
                                                                                                  apaMenuInfoCubit.repository.apaSubmitHrScore(SubmitHrScore(nextPatHistoryId.data![0].pathhistoryid!, 3, apaHrScoreCubit.hrScore))
                                                                                                },
                                                                                              if (empmenuInfofData.asupercomhistinput == -1)
                                                                                                {
                                                                                                  apaMenuInfoCubit.repository.apaSubmitSuperComment(SubmitSuperComment(nextPatHistoryId.data![0].pathhistoryid!, supercommentbloc.supervisorComment.trim()))
                                                                                                },
                                                                                              if (empmenuInfofData.questioninputactive == -1)
                                                                                                {
                                                                                                  apaMenuInfoCubit.repository.apaSubmitEmpScore(scoreList, nextPatHistoryId.data![0].pathhistoryid!),
                                                                                                },
                                                                                              if (empmenuInfofData.recominputactive == -1)
                                                                                                {
                                                                                                  apaMenuInfoCubit.repository.apaSubmitRecommendation(submitRecomList, nextPatHistoryId.data![0].pathhistoryid!),
                                                                                                },
                                                                                              if (empmenuInfofData.recomhrinputactive == -1)
                                                                                                {
                                                                                                  apaMenuInfoCubit.repository.apaSubmitHrScore(SubmitHrScore(nextPatHistoryId.data![0].pathhistoryid!, listempBasicInfo.qSetID!, apaHrScoreCubit.hrScore)),
                                                                                                },
                                                                                              if (empmenuInfofData.questiontrgactive == -1)
                                                                                                {
                                                                                                  apaMenuInfoCubit.repository.apaSubmitTargetScore(scoreListTarget, nextPatHistoryId.data![0].pathhistoryid!),
                                                                                                },
                                                                                              CommonMethods.showMessage(context, 'সফলভাবে সাবমিট হয়েছে ', Colors.green),
                                                                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AnnualAppraisalMain(SearchFilter(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)))),
                                                                                            }
                                                                                        }),
                                                                              });
                                                                        },
                                                                        child: Container(
                                                                            height: 56,
                                                                            child: Center(
                                                                                child: Text(
                                                                              'Submit',
                                                                              style: Styles.buttonTextStyle,
                                                                            )))),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ));
                                              }); // for last step
                                        } else {
                                          showModalBottomSheet(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              isDismissible: true,
                                              context: context,
                                              builder: (context) {
                                                return BlocConsumer<
                                                    ApaGetEmployeeCubit,
                                                    ApaGetEmployeeState>(
                                                  listener: (context, state) {
                                                    if (state
                                                        is ApaGetEmployeeErrorState) {
                                                      final snackBar = SnackBar(
                                                        content: Text(Languages
                                                                .of(context)!
                                                            .internetErrorText),
                                                        backgroundColor:
                                                            Colors.red,
                                                      );
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              snackBar);
                                                    }
                                                  },
                                                  buildWhen:
                                                      (previous, current) =>
                                                          previous != current,
                                                  builder: (context, state) {
                                                    if (state
                                                        is ApaGetEmployeeInitialState) {
                                                      return Container(
                                                        // When receiver info not found first view
                                                        height: 300,
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                        'প্রাপক',
                                                                        style: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontSize:
                                                                              20,
                                                                          color:
                                                                              ColorResources.GREY_NINETY,
                                                                        )),
                                                                    InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          child:
                                                                              Icon(
                                                                            Icons.clear,
                                                                            color:
                                                                                ColorResources.GREY_SIXTY,
                                                                          ),
                                                                        ))
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 12,
                                                                ),
                                                                TextFormField(
                                                                  onTap: () {},
                                                                  autofocus:
                                                                      false,
                                                                  enableSuggestions:
                                                                      true,
                                                                  controller:
                                                                      empInfoController,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    filled:
                                                                        true,
                                                                    suffixIcon:
                                                                        IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            'On Search click');
                                                                        apaGetEmployeeCubit
                                                                            .apaGetEmployeeInfo(empInfoController.text
                                                                                .toString())
                                                                            .then((value) =>
                                                                                {});
                                                                      },
                                                                      icon: Icon(
                                                                          Icons
                                                                              .search),
                                                                    ),
                                                                    fillColor:
                                                                        ColorResources
                                                                            .TEXT_FIELD_COLOR,
                                                                    border: OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                4),
                                                                        borderSide: BorderSide(
                                                                            color:
                                                                                ColorResources.APP_THEME_COLOR,
                                                                            style: BorderStyle.solid,
                                                                            width: 2)),
                                                                    enabledBorder:
                                                                        const OutlineInputBorder(
                                                                      borderSide: const BorderSide(
                                                                          color: ColorResources
                                                                              .TEXT_FIELD_BORDER_COLOR,
                                                                          width:
                                                                              0.0),
                                                                    ),
                                                                    hintText:
                                                                        '',
                                                                    hintStyle:
                                                                        Styles
                                                                            .apaHintTextStyle,
                                                                    contentPadding:
                                                                        EdgeInsets.all(
                                                                            10),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(text,
                                                                        style: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              ColorResources.GREY_NINETY,
                                                                        )),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: ColorResources
                                                                            .GREY_THIRTY,
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                        border: Border.all(
                                                                            color:
                                                                                ColorResources.GREY_THIRTY,
                                                                            width: 1),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                5,
                                                                            right:
                                                                                5),
                                                                        child:
                                                                            Text(
                                                                          'Note! \nপ্রাপকের পিন/ কোড যদি ভুল থাকে তবে সঠিক পিন/ কোড দিয়ে পরিবর্তন করুন',
                                                                          style:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                ColorResources.GREY_NINETY,
                                                                          ),
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          maxLines:
                                                                              5,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    } else if (state
                                                        is ApaGetEmployeeLoadingState) {
                                                      return Container(
                                                          height: 300,
                                                          child: Center(
                                                              child:
                                                                  CircularProgressIndicator()));
                                                    } else if (state
                                                        is ApaGetEmployeeLoadedState) {
                                                      return state.data
                                                                  .success ==
                                                              true // after search receiver found
                                                          ? Container(
                                                              height: 300,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        16),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                            'প্রাপক',
                                                                            style:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 20,
                                                                              color: ColorResources.GREY_NINETY,
                                                                            )),
                                                                        InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              child: Icon(
                                                                                Icons.clear,
                                                                                color: ColorResources.GREY_SIXTY,
                                                                              ),
                                                                            ))
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          12,
                                                                    ),
                                                                    TextFormField(
                                                                      onTap:
                                                                          () {},
                                                                      autofocus:
                                                                          false,
                                                                      enableSuggestions:
                                                                          true,
                                                                      controller:
                                                                          empInfoController,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        suffixIcon:
                                                                            IconButton(
                                                                          onPressed:
                                                                              () {
                                                                            print('On Search click');
                                                                            apaGetEmployeeCubit.apaGetEmployeeInfo(empInfoController.text.toString()).then((value) =>
                                                                                {});
                                                                          },
                                                                          icon:
                                                                              Icon(Icons.search),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            ColorResources.TEXT_FIELD_COLOR,
                                                                        border: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(
                                                                                4),
                                                                            borderSide: BorderSide(
                                                                                color: ColorResources.APP_THEME_COLOR,
                                                                                style: BorderStyle.solid,
                                                                                width: 2)),
                                                                        enabledBorder:
                                                                            const OutlineInputBorder(
                                                                          borderSide: const BorderSide(
                                                                              color: ColorResources.TEXT_FIELD_BORDER_COLOR,
                                                                              width: 0.0),
                                                                        ),
                                                                        hintText:
                                                                            '',
                                                                        hintStyle:
                                                                            Styles.apaHintTextStyle,
                                                                        contentPadding:
                                                                            EdgeInsets.all(10),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          15,
                                                                    ),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                            '${state.data.data![0].employeeCode} -  ${state.data.data![0].employeeName} - ${state.data.data![0].designationName}',
                                                                            textAlign: TextAlign
                                                                                .start,
                                                                            overflow: TextOverflow
                                                                                .ellipsis,
                                                                            softWrap:
                                                                                false,
                                                                            maxLines:
                                                                                5,
                                                                            style:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w700,
                                                                              fontSize: 14,
                                                                              color: ColorResources.GREY_NINETY,
                                                                            )),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      child:
                                                                          Align(
                                                                        alignment:
                                                                            Alignment.bottomCenter,
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              56,
                                                                          width:
                                                                              double.infinity,
                                                                          child: ElevatedButton(
                                                                              style: ElevatedButton.styleFrom(
                                                                                elevation: 0,
                                                                                backgroundColor: ColorResources.APP_THEME_COLOR,
                                                                                minimumSize: const Size.fromHeight(50), // NEW
                                                                              ),
                                                                              onPressed: () {
                                                                                apaSupervisorInfoCubit.getPathHistory().then((nextPatHistoryId) async => {
                                                                                      apaCmntHistoryCubit.repository
                                                                                          .submitGeneralComment(SubmitGeneralCommentModel(
                                                                                              listempBasicInfo.employeePin!,
                                                                                              listempBasicInfo.qAssignID!,
                                                                                              (nextPatHistoryId!.data![0].pathhistoryid!),
                                                                                              '',
                                                                                              state.data.data![0].employeeCode!,
                                                                                              // Get receiver info first time
                                                                                              listempBasicInfo.qSetID!,
                                                                                              (listempBasicInfo.priority! + 1),
                                                                                              apaCmntHistoryCubit.comment.trim()))
                                                                                          .then((value) async => {
                                                                                                if (value.success == true)
                                                                                                  {
                                                                                                    if (empmenuInfofData.leavehistinput == -1)
                                                                                                      {
                                                                                                        await apaMenuInfoCubit.repository.apaSubmitLeaveInfo(SubmitLeaveInfo(nextPatHistoryId.data![0].pathhistoryid!, apaEmpLeaveCubit.leaveReason, apaEmpLeaveCubit.leaveDuration, apaEmpLeaveCubit.leaveRange, apaEmpLeaveCubit.leaveComment)).then((value) async => {})
                                                                                                      },
                                                                                                    if (empmenuInfofData.recomhrinputactive == -1)
                                                                                                      {
                                                                                                        apaMenuInfoCubit.repository.apaSubmitHrScore(SubmitHrScore(nextPatHistoryId.data![0].pathhistoryid!, 3, apaHrScoreCubit.hrScore))
                                                                                                      },
                                                                                                    if (empmenuInfofData.asupercomhistinput == -1)
                                                                                                      {
                                                                                                        apaMenuInfoCubit.repository.apaSubmitSuperComment(SubmitSuperComment(nextPatHistoryId.data![0].pathhistoryid!, supercommentbloc.supervisorComment.trim()))
                                                                                                      },
                                                                                                    if (empmenuInfofData.questioninputactive == -1)
                                                                                                      {
                                                                                                        apaMenuInfoCubit.repository.apaSubmitEmpScore(scoreList, nextPatHistoryId.data![0].pathhistoryid!),
                                                                                                      },
                                                                                                    if (empmenuInfofData.recominputactive == -1)
                                                                                                      {
                                                                                                        apaMenuInfoCubit.repository.apaSubmitRecommendation(submitRecomList, nextPatHistoryId.data![0].pathhistoryid!),
                                                                                                      },
                                                                                                    if (empmenuInfofData.recomhrinputactive == -1)
                                                                                                      {
                                                                                                        apaMenuInfoCubit.repository.apaSubmitHrScore(SubmitHrScore(nextPatHistoryId.data![0].pathhistoryid!, listempBasicInfo.qSetID!, apaHrScoreCubit.hrScore)),
                                                                                                      },
                                                                                                    if (empmenuInfofData.questiontrgactive == -1)
                                                                                                      {
                                                                                                        apaMenuInfoCubit.repository.apaSubmitTargetScore(scoreListTarget, nextPatHistoryId.data![0].pathhistoryid!),
                                                                                                      },
                                                                                                    CommonMethods.showMessage(context, 'সফলভাবে সাবমিট হয়েছে ', Colors.green),
                                                                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AnnualAppraisalMain(SearchFilter(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)))),
                                                                                                  }
                                                                                              }),
                                                                                    });
                                                                              },
                                                                              child: Container(
                                                                                  height: 56,
                                                                                  child: Center(
                                                                                      child: Text(
                                                                                    'Submit',
                                                                                    style: Styles.buttonTextStyle,
                                                                                  )))),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          : Container(
                                                              // after search receiver not found
                                                              height: 300,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        16),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                            'প্রাপক',
                                                                            style:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 20,
                                                                              color: ColorResources.GREY_NINETY,
                                                                            )),
                                                                        InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              child: Icon(
                                                                                Icons.clear,
                                                                                color: ColorResources.GREY_SIXTY,
                                                                              ),
                                                                            ))
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          12,
                                                                    ),
                                                                    TextFormField(
                                                                      onTap:
                                                                          () {},
                                                                      controller:
                                                                          empInfoController,
                                                                      autofocus:
                                                                          false,
                                                                      enableSuggestions:
                                                                          true,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            ColorResources.TEXT_FIELD_COLOR,
                                                                        border: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(
                                                                                4),
                                                                            borderSide: BorderSide(
                                                                                color: ColorResources.APP_THEME_COLOR,
                                                                                style: BorderStyle.solid,
                                                                                width: 2)),
                                                                        enabledBorder:
                                                                            const OutlineInputBorder(
                                                                          borderSide: const BorderSide(
                                                                              color: ColorResources.TEXT_FIELD_BORDER_COLOR,
                                                                              width: 0.0),
                                                                        ),
                                                                        hintText:
                                                                            '',
                                                                        hintStyle:
                                                                            Styles.apaHintTextStyle,
                                                                        contentPadding:
                                                                            EdgeInsets.all(20),
                                                                        suffixIcon:
                                                                            IconButton(
                                                                          onPressed:
                                                                              () {
                                                                            print('On Search click');
                                                                            apaGetEmployeeCubit.apaGetEmployeeInfo(empInfoController.text.toString()).then((value) =>
                                                                                {});
                                                                          },
                                                                          icon:
                                                                              Icon(Icons.search),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                            text,
                                                                            style:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w700,
                                                                              fontSize: 14,
                                                                              color: ColorResources.GREY_NINETY,
                                                                            )),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                ColorResources.GREY_THIRTY,
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                            border:
                                                                                Border.all(color: ColorResources.GREY_THIRTY, width: 1),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(left: 5, right: 5),
                                                                            child:
                                                                                Text(
                                                                              'Note! \nপ্রাপকের পিন/ কোড যদি ভুল থাকে তবে সঠিক পিন/ কোড দিয়ে পরিবর্তন করুন',
                                                                              overflow: TextOverflow.ellipsis,
                                                                              maxLines: 5,
                                                                              style: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w400,
                                                                                fontSize: 10,
                                                                                color: ColorResources.GREY_NINETY,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                    } else {
                                                      // (state is WeatherError)
                                                      return Center(
                                                        child: Container(
                                                          child: Text(
                                                              'Network Error'),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                );
                                              });
                                        }
                                      } else {
                                        _curr++;
                                        _animateToIndex(_curr);
                                        setState(() {});
                                      }
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Next',
                                          style: Styles.buttonTextStyle,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Icon(Icons.arrow_forward_ios_outlined,
                                            size: 15,
                                            color: ColorResources.WHITE)
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor:
                                          ColorResources.APP_THEME_COLOR,
                                      minimumSize:
                                          const Size.fromHeight(50), // NEW
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ); // when receiver info not found
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
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  BlocConsumer<ApaEmpInfoCubit, ApaEmpInfoState>(
                    listener: (context, state) {
                      if (state is ApaEmpInfoErrorState) {
                        final snackBar = SnackBar(
                          content:
                              Text(Languages.of(context)!.internetErrorText),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    buildWhen: (previous, current) => previous != current,
                    builder: (context, state) {
                      if (state is ApaEmpInfoInitialState) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is ApaEmpInfoLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is ApaEmpInfoLoadedState) {
                        //print('>>>>>>>>> Loaded state called 2');
                        var empdata = state.apaEmpBasicInfo.data!;
                        var empDetailInfo = empdata[0];
                        String formattedJoinDate = '';
                        String formattedLastInDate = '';
                        if (empDetailInfo.joinigDate != null) {
                          formattedJoinDate = DateFormat.yMMMMd('en_US').format(
                              DateTime.parse(empDetailInfo.joinigDate!));
                        }

                        if (empDetailInfo.lastincrementdate != null) {
                          formattedLastInDate = DateFormat.yMMMMd('en_US')
                              .format(DateTime.parse(
                                  empDetailInfo.lastincrementdate!));
                        }
                        return empdata.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorResources.WHITE,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: ColorResources.GREY_THIRTY,
                                        width: 1),
                                  ),
                                  child: ExpansionTile(
                                    title: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${empDetailInfo.empName}',
                                              style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                                color:
                                                    ColorResources.GREY_NINETY,
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    ColorResources.GREY_THIRTY,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: ColorResources
                                                        .GREY_THIRTY,
                                                    width: 1),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 0, right: 5),
                                                child: Text(
                                                  '${empDetailInfo.designation}',
                                                  style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12,
                                                    color: ColorResources
                                                        .GREY_NINETY,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 15),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Pin Code',
                                                  style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12,
                                                    color: ColorResources
                                                        .GREY_SIXTY,
                                                  ),
                                                ),
                                                Text(
                                                    '${widget.arguments.employeePin}',
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14,
                                                      color: ColorResources
                                                          .GREY_NINETY,
                                                    )),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Working Station',
                                                  style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12,
                                                    color: ColorResources
                                                        .GREY_SIXTY,
                                                  ),
                                                ),
                                                Text(
                                                    '${empDetailInfo.sitename}',
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14,
                                                      color: ColorResources
                                                          .GREY_NINETY,
                                                    ))
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Joining Date',
                                                  style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12,
                                                    color: ColorResources
                                                        .GREY_SIXTY,
                                                  ),
                                                ),
                                                Text('${formattedJoinDate}',
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14,
                                                      color: ColorResources
                                                          .GREY_NINETY,
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 15),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          //mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Qualification',
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      color: ColorResources
                                                          .GREY_SIXTY,
                                                    ),
                                                  ),
                                                  Text(
                                                      '${empDetailInfo.degreeName}',
                                                      style: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 14,
                                                        color: ColorResources
                                                            .GREY_NINETY,
                                                      ))
                                                ],
                                              ),
                                              flex: 2,
                                            ),
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Last increment',
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      color: ColorResources
                                                          .GREY_SIXTY,
                                                    ),
                                                  ),
                                                  Text('${formattedLastInDate}',
                                                      style: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 14,
                                                        color: ColorResources
                                                            .GREY_NINETY,
                                                      ))
                                                ],
                                              ),
                                              flex: 1,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : Center(
                                child: Text(Languages.of(context)!.noDataFound),
                              );
                      } else {
                        // (state is WeatherError)
                        return Center(
                          child: Container(
                            child: Text('Loading.....'),
                          ),
                        );
                      }
                    },
                  ),
                  BlocConsumer<ApaMenuInfoCubit, ApaMenuInfoState>(
                    listener: (context, state) {
                      if (state is ApaMenuInfoErrorState) {
                        final snackBar = SnackBar(
                          content:
                              Text(Languages.of(context)!.internetErrorText),
                          backgroundColor: Colors.red,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    buildWhen: (previous, current) => previous != current,
                    builder: (context, state) {
                      if (state is ApaMenuInfoInitialState) {
                        return SizedBox();
                      } else if (state is ApaMenuInfoLoadingState) {
                        return SizedBox();
                      } else if (state is ApaMenuInfoLoadedState && isLoading) {
                        var menudata = state.empMenuInformation.data!;

                        // print(
                        //     'Menu Info Data  value   "questionactive": ${menudata[0].questionactive} \n'
                        //     "recomactive ${menudata[0].recomactive} \n"
                        //     "recomhractive ${menudata[0].recomhractive} \n"
                        //     "questiontrgactive ${menudata[0].questiontrgactive} \n"
                        //     "leavehisactive ${menudata[0].leavehisactive} \n"
                        //     "deciplinaryrecord ${menudata[0].deciplinaryrecord} \n"
                        //     "generalcomments ${menudata[0].generalcomments} \n"
                        //     "questioninputactive ${menudata[0].questioninputactive} \n"
                        //     "recominputactive ${menudata[0].recominputactive} \n"
                        //     "questiontrginputactive ${menudata[0].questiontrginputactive} \n"
                        //     "recomhrinputactive ${menudata[0].recomhrinputactive} \n"
                        //     "leavehistinput ${menudata[0].leavehistinput} \n"
                        //     "asupercomhistinput ${menudata[0].asupercomhistinput} \n"
                        //     "sendbkbt ${menudata[0].sendbkbt} \n"
                        //     "priorotyno ${menudata[0].priorotyno}"
                        //     '');

                        var menuInfo = menudata[0];
                        print('Count $count');
                        // if(count == 2){
                        if (_widgetList.length == 0 && _list.length == 0) {
                          if (menuInfo.questionactive == -1) {
                            print('In Condition 1');
                            GetEmpScore getEmpScore = GetEmpScore(
                                listempBasicInfo.qAssignID!,
                                listempBasicInfo.qSetID!,
                                listempBasicInfo.fiscalYear!);
                            scoreCubit.getApaEmpScore(getEmpScore);
                            _widgetList.add(_empScore(
                                menuInfo.questioninputactive!,
                                menuInfo.priorotyno!)); //1
                            _list.add('কর্মীর গুণগত দিক');
                          }

                          _widgetList.add(_supervisorComment(
                            menuInfo.asupercomhistinput!,
                          )); //2
                          _list
                              .add('সরাসরি তত্ত্বাবধায়ক সম্পর্কে কর্মীর মতামত');

                          if (menuInfo.recomactive == -1) {
                            print('In Condition 2');
                            print(
                                'recominputactive ${menuInfo.recominputactive} ');
                            _widgetList.add(_recommendation(
                                menuInfo.recominputactive!)); //3
                            _list.add('নিচের তথ্যগুলো পূরণ করুন');
                          }
                          if (menuInfo.questiontrgactive == -1) {
                            print('In Condition 3');
                            _widgetList.add(_empTargetScore(
                                menuInfo.questiontrginputactive!)); //4
                            _list.add('কর্মীর সংখ্যাগত দিক');
                          }
                          if (menuInfo.recomhractive == -1) {
                            print('In Condition 4');
                            _widgetList.add(_empHrScore(
                                menuInfo.recomhrinputactive!,
                                menuInfo.questiontrgactive!)); //5
                            _list.add('প্রাপ্ত নম্বরের সার সংক্ষেপ');
                          }
                          if (menuInfo.leavehisactive == -1) {
                            print('In Condition 5');
                            _widgetList.add(_leave(
                              menuInfo.leavehisactive!,
                              menuInfo.leavehistinput!,
                            )); //6
                            _list.add('বছর ব্যাপী বিনাবেতনে উপভোগ করা ছুটি');
                          }
                          // menuInfo.generalcomments!
                          //_widgetList.add(_comments(listempBasicInfo.priority!)); //7
                          _widgetList
                              .add(_comments(listempBasicInfo.priority!)); //7
                          _list.add('মতামত');
                        }
                        // }

                        return menudata.isNotEmpty &&
                                _widgetList.isNotEmpty &&
                                _list.isNotEmpty
                            ? Column(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 1,
                                      ),
                                      Divider(
                                        height: 2,
                                        color: ColorResources.GREY_THIRTY,
                                        thickness: 1,
                                      ),
                                      Container(
                                        height: 50,
                                        child: ListView.builder(
                                            controller: _controller,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: _list.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5,
                                                          bottom: 5,
                                                          left: 8,
                                                          right: 8),
                                                  child: Container(
                                                    height: 50,
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          _curr = index;
                                                          setState(() {});
                                                          // initState();
                                                          print('Index $_curr');
                                                        },
                                                        child: Text(
                                                          '${_list[index]}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30.0),
                                                              side: BorderSide(
                                                                  color: _curr ==
                                                                          index
                                                                      ? Colors
                                                                          .black
                                                                      : Colors
                                                                          .white))),
                                                          foregroundColor:
                                                              MaterialStateProperty
                                                                  .all<Color>(
                                                                      Colors
                                                                          .white),
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all<Color>(
                                                                      Colors
                                                                          .white),
                                                        )),
                                                  ));
                                            }),
                                      ),
                                      Divider(
                                        height: 1,
                                        thickness: 1,
                                        color: ColorResources.GREY_FOURTY,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 100),
                                        child: _widgetList[_curr],
                                      )
                                    ],
                                  ),
                                ],
                              )
                            : Center(
                                child: Text(Languages.of(context)!.noDataFound),
                              );
                      } else {
                        // (state is WeatherError)
                        return Center(
                          child: Container(
                            child: Text('Loading....'),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Future<bool> _willPopCallback() async {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => AnnualAppraisalMain(
                SearchFilter(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0))));
    return true;
  }

  Widget _empScore(int inputActive, int priorityNum) {
    return Column(
      children: [
        BlocConsumer<ApaEmpScoreCubit, ApaEmpScoreState>(
          listener: (context, state) {
            if (state is ApaEmpScoreErrorState) {
              final snackBar = SnackBar(
                content: Text(Languages.of(context)!.internetErrorText),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state is ApaEmpScoreInitialState) {
              return SizedBox();
            } else if (state is ApaEmpScoreLoadingState) {
              return SizedBox();
            } else if (state is ApaEmpScoreLoadedState) {
              var score = state.data.data!;

              if (score[score.length - 1].description != 'Total') {
                var numberListSum = 0;
                num numberList1Sum = 0;
                num numberList2Sum = 0;
                num numberList5Sum = 0;
                num numberList6Sum = 0;

                EmpScoreData empScoreData = EmpScoreData();

                var scorelength = score.length;
                score.asMap().forEach((index, value) => {
                      if (index != score.length)
                        {
                          numberListSum += value.outofscore!,
                        },
                      if (index != score.length)
                        {
                          if (value.evScore1 != null)
                            {
                              numberList1Sum += value.evScore1!,
                            }
                        },
                      if (index != score.length)
                        {
                          if (value.evScore2 != null)
                            {
                              numberList2Sum += value.evScore2!,
                            }
                          else if (value.evScore3 != null)
                            {
                              numberList2Sum += value.evScore3!,
                            }
                        },
                      if (index != score.length)
                        {
                          if (value.evScore5 != null)
                            {
                              numberList5Sum += value.evScore5!,
                            }
                        },
                      if (index != score.length)
                        {
                          if (value.evScore6 != null)
                            {
                              numberList6Sum += value.evScore6!,
                            }
                        },
                    });
                score.add(empScoreData);
                score[scorelength].outofscore = numberListSum;
                score[scorelength].evScore1 = numberList1Sum;
                score[scorelength].evScore2 = numberList2Sum;
                score[scorelength].evScore5 = numberList5Sum;
                score[scorelength].evScore6 = numberList6Sum;
                score[scorelength].description = 'Total';

                outofScoreTotal = numberListSum;
              }

              return score.isNotEmpty
                  ? Row(
                      children: [
                        FixedColumnWidget(score),
                        ScrollableColumnWidget(score, inputActive, priorityNum),
                      ],
                    )
                  : Center(
                      child: Text(Languages.of(context)!.noDataFound),
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
      ],
    );
  } //1

  Widget _supervisorComment(int inputActive) {
    return BlocConsumer<EmpSupCmmentCubit, EmpSupCmmentState>(
      listener: (context, state) {
        if (state is EmpSupCmmentErrorState) {
          final snackBar = SnackBar(
            content: Text(Languages.of(context)!.internetErrorText),
            backgroundColor: Colors.red,
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is EmpSupCmmentInitialState) {
          return SizedBox();
        } else if (state is EmpSupCmmentLoadingState) {
          return SizedBox();
        } else if (state is EmpSupCmmentLoadedState) {
          var empdata = state.apaSupervisorComment;
          var commentController = TextEditingController();
          if (empdata.data != null) {
            var empDetailInfo = empdata.data![0];

            commentController.text = empDetailInfo.userComment!;
          } else {}

          var superCommentController = TextEditingController();

          if (supercommentbloc.supervisorComment.isNotEmpty) {
            superCommentController.text = supercommentbloc.supervisorComment;
          }

          return empdata.data != null
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'সরাসরি তত্ত্বাবধায়ক সম্পর্কে কর্মীর মতামত',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: ColorResources.GREY_NINETY,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        empdata.data![0].userComment!,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: ColorResources.GREY_SEVENTY,
                        ),
                      ),
                      /*   TextField(
                        enableSuggestions: true,
                        controller: commentController,
                       */ /* decoration: InputDecoration(
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
                            enabled: inputActive == -1 ? true : false,
                            hintStyle: Styles.hintTextStyle,
                            isDense: true),*/ /*
                        onChanged: (value) {
                          print('On Changed called >>>>>>>>>>>>>>>');
                          supercommentbloc.supervisorComment = value.toString();
                        },
                        maxLines: 10,
                        minLines: 1,
                      )*/
                    ],
                  )),
                )
              : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'সরাসরি তত্ত্বাবধায়ক সম্পর্কে কর্মীর মতামত',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: ColorResources.GREY_NINETY,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: superCommentController,
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
                          hintText: 'write message here....',
                          hintStyle: Styles.hintTextStyle,
                        ),
                        onChanged: (value) {
                          //print('On Changed called >>>>>>>>>>>>>>>');
                          supercommentbloc.supervisorComment = value.toString();
                        },
                        maxLines: 10,
                        minLines: 1,
                      )
                    ],
                  )),
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
    );
  } //2

  Widget _empTargetScore(int inputActive) {
    //3
    return Column(
      children: [
        BlocConsumer<ApaTargetScoreCubit, ApaTargetScoreState>(
          listener: (context, state) {
            if (state is ApaTargetScoreErrorState) {
              final snackBar = SnackBar(
                content: Text(Languages.of(context)!.internetErrorText),
                backgroundColor: Colors.red,
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            print('Target Score State ${state}');

            if (state is ApaTargetScoreInitialState) {
              return SizedBox();
            } else if (state is ApaTargetScoreLoadingState) {
              return SizedBox();
            } else if (state is ApaTargetScoreLoadedState) {
              var empdata = state.data.data!;
              //var empDetailInfo = empdata[0];
              // print('Target Score Data ${empdata.length}');
              return empdata.isNotEmpty
                  ? ApaTargetScore(empdata, inputActive)
                  : Center(
                      child: Text(Languages.of(context)!.noDataFound),
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
        SizedBox(
          height: 300,
        )
      ],
    );
  } //4

  Widget _empHrScore(int hrInputActive, int targetActive) {
    var fixedColumn = [];
    fixedColumn.add('কর্মীর গুণগত দিক');
    if (targetActive == -1) {
      fixedColumn.add('কর্মীর সংখ্যাগত দিক');
    }
    fixedColumn.add('ব্যক্তিগত নথি পর্যালোচনা');
    return BlocConsumer<ApaHrScoreCubit, ApaHrScoreState>(
      listener: (context, state) {
        if (state is ApaHrScoreErrorState) {
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

        if (state is ApaHrScoreInitialState) {
          return SizedBox();
        } else if (state is ApaHrScoreLoadingState) {
          return SizedBox();
        } else if (state is ApaHrScoreLoadedState) {
          var hrdata = state.apaHrRecomScore.data!;
          //var empDetailInfo = empdata[0];
          print('Empadata ${hrdata.length}');
          // var scoreList = [];

          return hrdata.isNotEmpty
              ? Row(
                  children: [
                    FixedColumnWidgetHRScore(fixedColumn),
                    ScrollableColumnWidgetHrScore(hrdata, hrInputActive),
                  ],
                )
              // Container(height: 600,color: Colors.orange,)
              : Center(
                  child: Text(Languages.of(context)!.noDataFound),
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
    );
  } //5

  Widget _comments(int priorityNum) {
    return BlocConsumer<ApaCmntHistoryCubit, ApaCmntHistoryState>(
      listener: (context, state) {
        if (state is ApaCmntHistoryErrorState) {
          final snackBar = SnackBar(
            content: Text('${state.error}'),
            backgroundColor: Colors.red,
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        //print('Home page State ${state}');
        if (state is ApaCmntHistoryInitialState) {
          return SizedBox();
        } else if (state is ApaEmpLeaveLoadingState) {
          return SizedBox();
        } else if (state is ApaCmntHistoryLoadedState) {
          var empdata = state.empCommentHistory;
          List<Widget> _commentWidgetList = <Widget>[];

          if (empdata.data != null) {
            empdata.data!.forEach((CommentHisData commentHisData) {
              var generalCommentController = TextEditingController();

              generalCommentController.text =
                  '${commentHisData.comments ?? ''}';
              _commentWidgetList.add(Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 15, bottom: 5),
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${commentHisData.commenttitle}',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: ColorResources.GREY_NINETY,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      commentHisData.comments ?? '',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: ColorResources.GREY_SEVENTY,
                      ),
                    ),
                  ],
                )),
              ));
            });

            var commTitlePriorityNumber = 0;
            var commentController = TextEditingController();

            if (empdata.data != null) {
              commTitlePriorityNumber =
                  empdata.data![empdata.data!.length - 1].priority!;
            } else {
              commTitlePriorityNumber = 0;
            }

            print('commTitlePriorityNumber $commTitlePriorityNumber');

            if (apaCmntHistoryCubit.comment.isNotEmpty) {
              commentController.text = apaCmntHistoryCubit.comment;
            }

            _commentWidgetList.add(Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 10, bottom: 10),
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${apaEmpInfoCubit.approvalPathSet?.data![commTitlePriorityNumber].comtitle}',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: ColorResources.GREY_NINETY,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                    controller: commentController,
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
                      hintText: 'Write your message....',
                      hintStyle: Styles.hintTextStyle,
                    ),
                    onChanged: (comment) {
                      apaCmntHistoryCubit.comment = comment;
                    },
                  )
                ],
              )),
            ));
          } else {
            var commentController = TextEditingController();

            if (apaCmntHistoryCubit.comment.isNotEmpty) {
              commentController.text = apaCmntHistoryCubit.comment;
            }
            _commentWidgetList.add(Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'কর্মীর মতামত',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: ColorResources.GREY_NINETY,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                    controller: commentController,
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
                      hintText: 'Write your message....',
                      hintStyle: Styles.hintTextStyle,
                    ),
                    onChanged: (comment) {
                      apaCmntHistoryCubit.comment = comment;
                    },
                  )
                ],
              )),
            ));
          }

          print('CommonWidgetLength ${_commentWidgetList.length}');

          return Container(
            height: 500,
            child: ListView.builder(
                itemCount: _commentWidgetList.length,
                itemBuilder: (context, index) => _commentWidgetList[index]),
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
    );
  }

  Widget _leave(int active, int inputActive) {
    return BlocConsumer<ApaEmpLeaveCubit, ApaEmpLeaveState>(
      listener: (context, state) {
        if (state is ApaEmpLeaveErrorState) {
          final snackBar = SnackBar(
            content: Text(Languages.of(context)!.internetErrorText),
            backgroundColor: Colors.red,
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is ApaEmpLeaveInitialState) {
          return SizedBox();
        } else if (state is ApaEmpLeaveLoadingState) {
          return SizedBox();
        } else if (state is ApaEmpLeaveLoadedState) {
          var empdata = state.empLeaveHistory;

          if (empdata.success == false) {
            print('Reason ${apaEmpLeaveCubit.leaveReason}');

            if (apaEmpLeaveCubit.leaveReason != null &&
                apaEmpLeaveCubit.leaveReason.toString().isNotEmpty) {
              print('Reason In condition ${apaEmpLeaveCubit.leaveReason} ');
              _controllerLR.text = apaEmpLeaveCubit.leaveReason ?? '';
            }

            if (apaEmpLeaveCubit.leaveDuration != null &&
                apaEmpLeaveCubit.leaveDuration.toString().isNotEmpty) {
              _controllerLDC.text = apaEmpLeaveCubit.leaveDuration ?? '';
            }

            if (apaEmpLeaveCubit.leaveRange != null &&
                apaEmpLeaveCubit.leaveRange.toString().isNotEmpty) {
              _controllerLD.text = apaEmpLeaveCubit.leaveRange ?? '';
            }

            if (apaEmpLeaveCubit.leaveComment != null &&
                apaEmpLeaveCubit.leaveComment.toString().isNotEmpty) {
              _controllerLC.text = apaEmpLeaveCubit.leaveComment ?? '';
            }
          }

          return empdata.success == true
              ? SingleChildScrollView(
                  child: Container(
                      height: 600,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 15, bottom: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'ছুটির কারণ',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: ColorResources.GREY_NINETY,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              empdata.data[0].reasonforleave ?? '',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: ColorResources.GREY_SEVENTY,
                              ),
                              maxLines: 10,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'কত দিন',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: ColorResources.GREY_NINETY,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              empdata.data[0].duration ?? '',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: ColorResources.GREY_SEVENTY,
                              ),
                              maxLines: 10,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'ছুটি ভোগ করণের তারিখ',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: ColorResources.GREY_NINETY,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              empdata.data[0].daterange ?? '',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: ColorResources.GREY_SEVENTY,
                              ),
                              maxLines: 10,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'মন্তব্য',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: ColorResources.GREY_NINETY,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              empdata.data[0].leaveComments ?? '',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: ColorResources.GREY_SEVENTY,
                              ),
                              maxLines: 10,
                            ),
                            /*   TextFormField(
                              controller: controllerLC,
                              enableSuggestions: true,
                              maxLines: 10,
                              minLines: 1,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: ColorResources.TEXT_FIELD_COLOR,
                                  border: InputBorder.none,
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: ColorResources
                                            .TEXT_FIELD_BORDER_COLOR,
                                        width: 0.0),
                                  ),
                                  hintText: '${empdata.data[0].leaveComments}',
                                  hintStyle: Styles.hintTextStyle,

                                  enabled: false),
                            ),*/
                          ],
                        ),
                      )),
                )
              : inputActive == -1
                  ? Container(
                      height: 600,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 15, bottom: 50),
                        child: ListView(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ছুটির কারণ',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: ColorResources.GREY_NINETY,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
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
                                      color: ColorResources
                                          .TEXT_FIELD_BORDER_COLOR,
                                      width: 0.0),
                                ),
                                hintText: 'ছুটির কারণ ...',
                                hintStyle: Styles.hintTextStyle,
                              ),
                              controller: _controllerLR,
                              onChanged: (reason) {
                                print('Reason $reason');

                                apaEmpLeaveCubit.leaveReason =
                                    reason.toString();
                              },
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'কত দিন',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: ColorResources.GREY_NINETY,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              enableSuggestions: true,
                              controller: _controllerLDC,
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
                                hintText: 'কত দিন ...',
                                hintStyle: Styles.hintTextStyle,
                              ),
                              onChanged: (duration) {
                                apaEmpLeaveCubit.leaveDuration = duration;
                              },
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'ছুটি ভোগ করণের তারিখ',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: ColorResources.GREY_NINETY,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              enableSuggestions: true,
                              controller: _controllerLD,
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
                                hintText: 'ছুটি ভোগ করণের তারিখ ...',
                                hintStyle: Styles.hintTextStyle,
                              ),
                              onChanged: (range) {
                                apaEmpLeaveCubit.leaveRange = range;
                              },
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'মন্তব্য',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: ColorResources.GREY_NINETY,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              enableSuggestions: true,
                              controller: _controllerLC,
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
                                hintText: 'মন্তব্য...',
                                hintStyle: Styles.hintTextStyle,
                              ),
                              onChanged: (comments) {
                                apaEmpLeaveCubit.leaveComment = comments;
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: 600,
                      child: Center(
                        child: Text('প্রযোজ্য নয়'),
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
    );
  }

  Widget _recommendation(int inputActive) {
    return Container(
      child: BlocConsumer<ApaRecomHistoryCubit, ApaRecomHistoryState>(
        listener: (context, state) {
          if (state is ApaRecomHistoryInitialState) {
            final snackBar = SnackBar(
              content: Text(Languages.of(context)!.internetErrorText),
              backgroundColor: Colors.red,
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is ApaRecomHistoryInitialState) {
            return SizedBox();
          } else if (state is ApaRecomHistoryLoadingState) {
            return SizedBox();
          } else if (state is ApaRecomHistoryLoadedState) {
            var empdata = state.empRecomHistory.data;
            recomHisData = state.empRecomHistory.data;
            empdata.forEach((element) {
              apaRecomHistoryCubit.addControllerItem(TextEditingController());
              apaRecomHistoryCubit
                  .addCountControllerItem(TextEditingController());
            });
            return empdata.isNotEmpty
                ? ApaRecommendation(
                    empdata, inputActive, listempBasicInfo.priority!)
                : Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'সরাসরি তত্ত্বাবধায়ক সম্পর্কে কর্মীর মতামত',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: ColorResources.GREY_NINETY,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
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
                            hintText: 'write message here....',
                            hintStyle: Styles.hintTextStyle,
                          ),
                        )
                      ],
                    )),
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
    );
  } //3

  @override
  void dispose() {
    print('Input Key Dispose called');
    //apaEmpLeaveCubit.close();
    apaEmpLeaveCubit.clear();
    _widgetList.clear();
    _list.clear();
    // apaEmpInfoCubit.setInitialization();
    // apaMenuInfoCubit.setInitialization();
    // apaEmpInfoCubit.close();
    // scoreCubit.close();
    // supercommentbloc.close();
    // targetScoreCubit.close();
    // apaEmpLeaveCubit.close();
    // apaCmntHistoryCubit.close();
    // apaRecomHistoryCubit.close();
    //
    // apaHrScoreCubit.close();
    // apaGetEmployeeCubit.close();
    // apaSupervisorInfoCubit.close();

    _controllerLR.dispose();
    _controllerLDC.dispose();
    _controllerLD.dispose();
    _controllerLC.dispose();
    _controllerReceiverPin.dispose();

    super.dispose();
  }
}
