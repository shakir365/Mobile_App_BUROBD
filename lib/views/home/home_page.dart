

import 'package:buro_employee/repository/bloc/home_cubit/home_cubit.dart';
import 'package:buro_employee/repository/bloc/module/module_cubit.dart';
import 'package:buro_employee/repository/models/device_info.dart';
import 'package:buro_employee/sessionmanager/session_manager.dart';
import 'package:buro_employee/theme/colors.dart';
import 'package:buro_employee/theme/styles.dart';
import 'package:buro_employee/utilities/analytics.dart';
import 'package:buro_employee/utilities/asset_paths.dart';
import 'package:buro_employee/utilities/common_methods.dart';
import 'package:buro_employee/views/annual_appraisal/annual_appraisal_main.dart';
import 'package:buro_employee/views/cash_flow/cash_flow_main.dart';
import 'package:buro_employee/views/cash_flow/customer_list.dart';
import 'package:buro_employee/views/general_info/employee_general_info_list.dart';
import 'package:buro_employee/views/general_info/generalinfo_main.dart';
import 'package:flutter/material.dart';
import '../../repository/models/annual_appraisal.dart';
import '../../utilities/constants.dart';
import '../field_visit/field_visit_main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../leave/leave_main.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  static route() => MaterialPageRoute(builder: (_) => HomeScreen());

  @override
  State<StatefulWidget> createState() => _HomePageSate();
}

class _HomePageSate extends State<HomeScreen> {
  var selectedLang;
  var imageList = [
    assetsPath.FIELD_VISIT_MODULE_ICON,
    assetsPath.ANNUAL_APPRAISAL_ICON,
    assetsPath.APPLY_LEAVE_ICON,
    assetsPath.COLLECTION_SUMMERY_ICON,
    assetsPath.CALENDER_ICON,
    assetsPath.APPLY_LEAVE_ICON,
    assetsPath.FIELD_VISIT_MODULE_ICON,
    assetsPath.APPLY_LEAVE_ICON,
    assetsPath.CALENDER_ICON,
    assetsPath.COLLECTION_SUMMERY_ICON,
    assetsPath.ANNUAL_APPRAISAL_ICON,
    assetsPath.CALENDER_ICON,
    assetsPath.COLLECTION_SUMMERY_ICON,
    assetsPath.ANNUAL_APPRAISAL_ICON
  ];
  String? _fcmToken;
  String? _apnsToken;
  late  FirebaseMessaging messaging;
  late HomeCubit bloc;
  @override
  void initState()  {
    messaging = FirebaseMessaging.instance;
    CommonMethods.getSelectedLang().then((value) => {
          selectedLang = value,
        });

    bloc = context.read<HomeCubit>();
    bloc.getHomeData();
    super.initState();
    //getFCMToken();
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      print("New FCM Token: $newToken");
      addDeviceInfo(newToken);
    });

    initializeFirebaseMessaging();


    updateDeviceInformation();

    //getAPNSToken();

  }

  @override
  void didChangeDependencies() {
    analytics.setCurrentScreen('Home Page', 'StatefulWidget');
    super.didChangeDependencies();
  }

  Future<String> getSelectedLang() async {
    return await sessionManager.selectedLang;
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state is HomeInitialState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is HomeLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is HomeLoadedState) {
              var moduleList = state.module.data.moduleAccess;
              sessionManager.setCoreFinanceSiteCode(
                  state.module.data.coreFinanceSiteCode?? '');
              sessionManager.setGradeID(
                  state.module.data.gradeID??'');
              return moduleList.isNotEmpty
                  ? Container(
                      child: RefreshIndicator(
                      onRefresh: refresh,
                      child: GridView.count(
                        crossAxisSpacing: 00,
                        mainAxisSpacing: 00,
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        children: List.generate(moduleList.length, (index) {
                          return Center(
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
                              margin: const EdgeInsets.all(0),
                              child: InkWell(
                                  splashColor: Colors.blue.withAlpha(20),
                                  onTap: () {
                                    var currentModuleId = state.module.data
                                        .moduleAccess[index].moduleId;
                                    if (currentModuleId == 1) {

                                      //FirebaseCrashlytics.instance.crash();

                                      sessionManager
                                          .setSubmoduleId(currentModuleId);
                                      Navigator.pushNamed(
                                          context, FieldVisitMain.routeName);
                                    } else if (currentModuleId == 2) {
                                      Navigator.pushNamed(context,
                                          AnnualAppraisalMain.routeName,
                                          arguments: SearchFilter(0, 0, 0, 0, 0,
                                              0, 0, 0, 0, 0, 0, 0));
                                    } else if (currentModuleId == 3) {
                                      sessionManager
                                          .setSubmoduleId(currentModuleId);
                                      Navigator.pushNamed(
                                          context, LeaveMain.routeName);

                                    } else if (currentModuleId == 4) {
                                      Navigator.pushNamed(
                                        context,
                                        CustomerList.routeName,
                                      );
                                    } else if (currentModuleId == 5) {
                                      sessionManager
                                        .setSubmoduleId(currentModuleId);
                                      Navigator.pushNamed(
                                        context,
                                        GeneralInfoMain.routeName,
                                      );
                                    }
                                  },
                                  child: Container(
                                      height: 129,
                                      width: 155,
                                      child: Column(
                                        children: [
                                          Flexible(
                                            flex: 6,
                                            child: Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    imageList[index],
                                                    height: 50,
                                                    width: 50,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Center(
                                                    child: index == 3
                                                        ? Text(
                                                            'Cash Flow Analysis',
                                                            style: Styles
                                                                .mediumTextStyle,
                                                            textAlign: TextAlign
                                                                .center,
                                                            maxLines: 1,
                                                            softWrap: false,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          )
                                                        : Text(
                                                            selectedLang == 'bn'
                                                                ? '${moduleList[index].moduleNameBn}'
                                                                : '${moduleList[index].moduleNameEn}',
                                                            style: Styles
                                                                .mediumTextStyle,
                                                            textAlign: TextAlign
                                                                .center,
                                                            maxLines: 1,
                                                            softWrap: false,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                              flex: 1,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: Container(
                                                  height: 4,
                                                  decoration: BoxDecoration(
                                                    color: getColor(index),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                      10,
                                                    )),
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ))),
                            ),
                          );
                        }),
                        physics: const AlwaysScrollableScrollPhysics(),
                      ),
                    ))
                  : Center(
                      child: Text('You Have no Module to access!'),
                    );
            } else if (state is ModuleErrorState) {
              return RefreshIndicator(
                onRefresh: refresh,
                child: Center(
                  child: Container(
                    child: Text('Network Error hhbn'),
                  ),
                ),
              );
            } else {
              return RefreshIndicator(
                onRefresh: refresh,
                child: Center(
                  child: Container(
                    child: Text(' Error'),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }

  Color getColor(int index) {
    switch (index) {
      case 0:
        return ColorResources.APP_THEME_COLOR;
        break;
      case 1:
        return ColorResources.LIGHT_YELLOW;
        break;
      case 2:
        return ColorResources.APP_THEME_COLOR;
        break;
      case 3:
        return ColorResources.LIGHT_YELLOW;
        break;

      default:
        {
          return ColorResources.APP_THEME_COLOR;
        }
    }
  }

  Future refresh() {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        final bloc = context.read<ModuleCubit>();
        bloc.getModule();
      },
    );
  }

  void initializeFirebaseMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Foreground message received: ${message.notification?.title}");
      if (mounted) {
        _showNotification(message);
      }

    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Notification clicked: ${message.notification?.title}");
      //message.data

      String? title = message.notification?.title;


      print('Title $title');


      if(title == 'Field Visit'){

        sessionManager
            .setSubmoduleId(1);
        Navigator.pushNamed(
            context, FieldVisitMain.routeName);

      } else if (title == 'Leave'){

        sessionManager
            .setSubmoduleId(3);
        Navigator.pushNamed(
            context, LeaveMain.routeName);
      }




    });
  }

  /// Get FCM Token
  void _showNotification(RemoteMessage message) {
    final title = message.notification?.title ?? "No Title";
    final body = message.notification?.body ?? "No Body";

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }


  Future<void> updateDeviceInformation() async {
    bool isDeviceInfoAdded =  await sessionManager.IsUpdateDeviceInfoCall;

    //print('isFirstInstallValue $isDeviceInfoAdded');

    if (isDeviceInfoAdded == false) {

      /*FirebaseMessaging messaging = FirebaseMessaging.instance;
      String? token = await messaging.getToken();
      setState(() {
        _fcmToken = token;
      });*/
      String? token;
      if (Platform.isAndroid) {
       token = await messaging.getToken();
      } else if (Platform.isIOS) {
        token = await messaging.getAPNSToken();
      } else  {
        token = await messaging.getToken();
      }


      //print("Device FCM or APNS Token: $token");

      addDeviceInfo(token!);

      sessionManager.setIsUpdateDeviceInfoCall(true) ;
    }
  }


  void addDeviceInfo(String token) async {

    String deviceInfo = "";
    String deviceType = "";

    if (Platform.isAndroid) {
      deviceInfo = "Platform: Android\n";
      deviceType = "Android";
    } else if (Platform.isIOS) {
      deviceInfo = "Platform: IOs\n";
      deviceType = "IOs";
    } else if (Platform.isWindows) {
      deviceInfo = "Platform: Windows\n";
    } else if (Platform.isLinux) {
      deviceInfo = "Platform: Linux\n";
    } else if (Platform.isMacOS) {
      deviceInfo = "Platform: macOS\n";
    } else if (Platform.isFuchsia) {
      deviceInfo = "Platform: Fuchsia\n";
    }

    deviceInfo += "Operating System: ${Platform.operatingSystem}\n";
    deviceInfo += "OS Version: ${Platform.operatingSystemVersion}\n";


    print('Device Info $deviceInfo');
    var employeeCode = await sessionManager.userID;

    DeviceInfo info = new DeviceInfo(id: 0, employeeCode: employeeCode ,  isLoggedIn: 1, deviceType: deviceType, deviceOS: Platform.operatingSystemVersion, fcmAndroid: token, fcmIos: token);

    bloc.updateDeviceInfo(info);

  }

  void getAPNSToken() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    String? token = await messaging.getAPNSToken();
    print("IOS Device APNS Token: $token");
    setState(() {
      _apnsToken = token;
    });

  }


}
