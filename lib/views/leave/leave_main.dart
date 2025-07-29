
import 'package:buro_employee/views/leave/apply_leave.dart';
import 'package:buro_employee/views/leave/leave_authorization_list.dart';
import 'package:buro_employee/views/leave/leave_history.dart';
import 'package:buro_employee/views/leave/pending_leave.dart';
import 'package:flutter/material.dart';

import '../../localization/Language/languages.dart';
import '../../repository/bloc/leave_bloc/leave_bloc_cubit.dart';
import '../../repository/bloc/sub_module/sub_module_cubit.dart';
import '../../repository/network/buro_repository.dart';
import '../../sessionmanager/session_manager.dart';
import '../../theme/colors.dart';
import '../../theme/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:buro_employee/utilities/asset_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utilities/analytics.dart';
import '../../utilities/common_methods.dart';

class LeaveMain extends StatefulWidget {

  static const routeName = '/leaveMain';
  const LeaveMain({Key? key}) : super(key: key);

  @override
  _LeaveMainState createState() => _LeaveMainState();
}

class _LeaveMainState extends State<LeaveMain> {

  var leaveList = ['Apply leave', 'My Pending Leave', 'Approve Leave','Approve Leave','Leave History'];


  var leaveIconList = [
    assetsPath.LEAVE_APPLY_ICON,
    assetsPath.LEAVE_REQUEST_ICON,
    assetsPath.LEAVE_AUTHORIZATION_ICON,
    assetsPath.LEAVE_AUTHORIZATION_ICON,
    assetsPath.LEAVE_AUTHORIZATION_ICON,
    assetsPath.LEAVE_AUTHORIZATION_ICON
  ];

  var selectedLang;
  late SessionManager sessionManager;
  var bloc;
  var moduleId;
  var blocApplyLeave;

 late BuroRepository buroRepository;

  @override
  void initState() {
    sessionManager = SessionManager();
    buroRepository = BuroRepository();
    blocApplyLeave = context.read<LeaveBlocCubit>();

    CommonMethods.getSelectedLang().then((value) => {
      selectedLang = value,
      print('Selecetdlang field Visit Main $selectedLang value $value')
    });

    bloc = context.read<SubModuleCubit>();
    getSelectedModuleId().then((value) =>
    {bloc.getSubModule(value.toString()), moduleId = value.toString()});


    //buroRepository.getLeaveHistoryList();

    if (blocApplyLeave.remainingLeaveList.length < 1) blocApplyLeave.getRemainingLeaveInfo();
    if (blocApplyLeave.countryLeaveList.length < 1) blocApplyLeave.getCountryList();
    if (blocApplyLeave.divisionDropDownList.length < 1) blocApplyLeave.getDivisionList();
    if (blocApplyLeave.districtDropDownList.length < 1) blocApplyLeave.getDistrictListByDivision('D10');

    super.initState();
  }

  /*Future<bool> _willPopCallback() async {
    await sessionManager.clearSubmoduleId();
    Navigator.pushNamedAndRemoveUntil(
        context, LandingScreen.routeName, (r) => false);

    return true;
  }*/

  Future refresh() {
    return Future.delayed(
      Duration(seconds: 1),
          () {
        bloc = context.read<SubModuleCubit>();
        bloc.getSubModule(moduleId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.APP_THEME_COLOR,
        iconTheme: IconThemeData(color: ColorResources.WHITE),
        title: Center(
          child: Text(
            Languages.of(context)!.leave,
            style: Styles.appBarTextStyle,
          ),
        ),
      ),
      body: BlocConsumer<SubModuleCubit, SubModuleState>(
        listener: (context, state) {
          if (state is SubModuleErrorState) {
            final snackBar =  SnackBar(
              content: Text(Languages.of(context)!.internetErrorText),
              backgroundColor: Colors.red,
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          // print('Home page State ${state}');

          if (state is SubModuleInitialState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SubModuleLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SubModuleLoadedState) {
            var subModuleList = state.subModule.data;

            return Padding(
              padding: const EdgeInsets.only(top: 24, left: 12, right: 12),
              child: Container(
                color: ColorResources.PAGE_BACKGROUND,
                child: RefreshIndicator(
                  onRefresh: refresh,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: subModuleList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ListTile(
                          title: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              color: ColorResources.WHITE,
                              border: Border.all(
                                  color: ColorResources.LIST_BORDER_WHITE,
                                  width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(
                                10,
                              )),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  child: SvgPicture.asset(leaveIconList[index]),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  selectedLang == 'bn'
                                      ? '${subModuleList[index].uiVisibleNameBn}'
                                      : '${subModuleList[index].uiVisibleNameEn}',
                                  style: Styles.menuListItemStyle,
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                           // selectedItem = subModuleList[index].subModuleId;

                            // print('Selected ITEm $selectedItem');

                            if(index == 1){
                              Navigator.pushNamed(
                                  context, PendingLeave.routeName);
                            }
                            if(index == 0){
                              Navigator.pushNamed(
                                  context, ApplyLeave.routeName);
                            }

                            if(index == 2){
                              Navigator.pushNamed(
                                  context, LeaveAuthorizationList.routeName);
                            }

                            if(index == 3){
                              Navigator.pushNamed(
                                  context, LeaveHistory.routeName);
                            }

                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: Container(
                child: Text('Network Error'),
              ),
            );
          }
        },
      ));
  }

  @override
  void dispose() {
    print('Dispose called Leave Main');
    super.dispose();

    blocApplyLeave.remainingLeaveList.clear();
    blocApplyLeave.countryLeaveList.clear();
    blocApplyLeave.divisionDropDownList.clear();
    blocApplyLeave.districtDropDownList.clear();
  }
  Future<String> getSelectedLang() async {
    return await sessionManager.selectedLang;
  }

  Future<int> getSelectedModuleId() async {
    return await sessionManager.subModuleId;
  }

  @override
  void didChangeDependencies() {
    getSelectedLang().then((value) => {
      selectedLang = value
    });

    super.didChangeDependencies();
    analytics.setCurrentScreen('Leave Main page ', 'StatefulWidget');
  }
}
