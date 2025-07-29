import 'package:buro_employee/views/general_info/employee_general_info_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app.dart';
import '../../localization/Language/languages.dart';
import '../../repository/bloc/apply_cubit/apply_cubit.dart';
import '../../repository/bloc/sub_module/sub_module_cubit.dart';
import '../../repository/database/database_handler.dart';
import '../../repository/models/employee_general_info.dart';
import '../../repository/network/buro_repository.dart';
import '../../sessionmanager/session_manager.dart';
import '../../theme/colors.dart';
import '../../theme/styles.dart';
import '../../utilities/analytics.dart';
import '../../utilities/asset_paths.dart';
import '../../utilities/common_methods.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GeneralInfoMain extends StatefulWidget {
  //const GeneralInfoMain({super.key});

  static const routeName = '/generalInfoMain';

  static route() => MaterialPageRoute(builder: (_) => GeneralInfoMain());
  GeneralInfoMain({Key? key}) : super(key: key);

  @override
  State<GeneralInfoMain> createState() => _GeneralInfoMainState();
}

class _GeneralInfoMainState extends State<GeneralInfoMain> {


  var selectedLang;
  var bloc;
  var moduleId;
  late DataBaseHandler handler;
  //List<ApplyRequest> list = [];
  late SessionManager sessionManager;


  var imageList = [
    assetsPath.FIELD_VISIT_ICON, // Apply Field Visit
    assetsPath.MY_REQUEST_ICON,  // My field Visit List
    assetsPath.BILL_SUBMIT_ICON,  // Add Bill
    assetsPath.APPROVAL_REQUEST_ICON,
    assetsPath.APPROVAL_REQUEST_ICON,
    assetsPath.APPROVAL_REQUEST_ICON,
    assetsPath.BILL_SUBMIT_ICON
  ];

  late ApplyCubit applyBloc;
  late BuroRepository buroRepository;




  @override
  void initState() {
    sessionManager = SessionManager();
    this.handler = DataBaseHandler.instance;
    //this.handler.applyList().then((value) => list = value);

    CommonMethods.getSelectedLang().then((value) => {
      selectedLang = value,
      print('Selecetdlang field Visit Main $selectedLang value $value')
    });

    bloc = context.read<SubModuleCubit>();
   // applyBloc = context.read<ApplyCubit>();
    getSelectedModuleId().then((value) =>
    {bloc.getSubModule(value.toString()), moduleId = value.toString()});



    super.initState();
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
    analytics.setCurrentScreen('General Information Main Page ', 'StatefulWidget');
  }

  Future<bool> _willPopCallback() async {
    await sessionManager.clearSubmoduleId();
    Navigator.pushNamedAndRemoveUntil(
        context, LandingScreen.routeName, (r) => false);

    return true;
  }

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
    var selectedItem;
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: ColorResources.WHITE),
          backgroundColor: ColorResources.APP_THEME_COLOR,
          title: Center(
            child: Text(
              '${Languages.of(context)!.employeeInfo}',
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
                                    child: SvgPicture.asset(imageList[index]),
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
                              selectedItem = subModuleList[index].subModuleId;

                              print('Selected ITEm $selectedItem');
                              switch (selectedItem) {
                                case 16:
                                  {

                                    /*  Navigator.pushNamed(
                                          context, EmployeeGeneralInfoList.routeName);*/

                                    Navigator.pushNamed(
                                        context, EmployeeGeneralInfoList.routeName,
                                        arguments: GeneralInfoSearchFilterModel());

                                  }
                                  break;

                                case 17:
                                  {
                                    /*Navigator.pushNamed(
                                        context, RequestList.routeName);*/
                                  }
                                  break;




                                default:
                                  {
                                    //statements;
                                  }
                                  break;
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
        ),
      ),
    );
  }
}
