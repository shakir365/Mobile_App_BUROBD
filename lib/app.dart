import 'dart:convert';
import 'dart:typed_data';

import 'package:buro_employee/config/route.dart';
import 'package:buro_employee/repository/bloc/acash_flow/all_cash_inflow/all_cash_inflow_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/bank_balance/bank_balance_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/business_cash_outflow/business_cash_outflow_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/business_expense_monthly/business_expense_monthly_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/buyer_verification/buyer_verification_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/customer_details/customer_details_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/enterprise_details/enterprise_details_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/existing_loans/existing_loans_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/frequency/frequency_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/house_hold_expenses/house_hold_expenses_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/loan_eligibility/loan_eligibility_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/margin/margin_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/other_income_monthly/other_income_monthly_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/other_recurring_expense/other_recurring_expense_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/personal_expense_monthly/personal_expense_monthly_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/personal_reference_verification/personal_reference_verification_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/proposed_loan_details/proposed_loan_details_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/purchase_cash_book/purchase_cash_book_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/purchases/purchases_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/qualitative_aspects/qualitative_aspects_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/regular_investment/regular_investment_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/sales/sales_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/sales_cash_book/sales_cash_book_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/seasonality_n_margin/seasonality_n_margin_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/stock/stock_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/supplier_verification/supplier_verification_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/working_capital/working_capital_cubit.dart';
import 'package:buro_employee/repository/bloc/acash_flow/working_capital_requirment/working_capital_requirment_cubit.dart';
import 'package:buro_employee/repository/bloc/add_bill_info_cubit/add_bill_info_cubit.dart';
import 'package:buro_employee/repository/bloc/annual_appraisal/apa_employee_list_cubit.dart';
import 'package:buro_employee/repository/bloc/apa_cmnt_history/apa_cmnt_history_cubit.dart';
import 'package:buro_employee/repository/bloc/apa_emp_info/apa_emp_info_cubit.dart';
import 'package:buro_employee/repository/bloc/apa_emp_leave/apa_emp_leave_cubit.dart';
import 'package:buro_employee/repository/bloc/apa_employee_score/apa_emp_score_cubit.dart';
import 'package:buro_employee/repository/bloc/apa_get_employee/apa_get_employee_cubit.dart';
import 'package:buro_employee/repository/bloc/apa_hr_score/apa_hr_score_cubit.dart';
import 'package:buro_employee/repository/bloc/apa_menu_info/apa_menu_info_cubit.dart';
import 'package:buro_employee/repository/bloc/apa_recom_history/apa_recom_history_cubit.dart';
import 'package:buro_employee/repository/bloc/apa_supervisor_info/apa_supervisor_info_cubit.dart';
import 'package:buro_employee/repository/bloc/apa_target_score/apa_target_score_cubit.dart';
import 'package:buro_employee/repository/bloc/apply_cubit/apply_cubit.dart';
import 'package:buro_employee/repository/bloc/approval_details/approval_details_cubit.dart';
import 'package:buro_employee/repository/bloc/approval_request/approval_request_cubit.dart';
import 'package:buro_employee/repository/bloc/area_list/area_list_cubit.dart';
import 'package:buro_employee/repository/bloc/bill_bloc/bill_bloc_cubit.dart';
import 'package:buro_employee/repository/bloc/bill_details/bill_details_cubit.dart';
import 'package:buro_employee/repository/bloc/bill_report_bloc/bill_report_bloc_cubit.dart';
import 'package:buro_employee/repository/bloc/bill_req_list_cubit/bill_req_list_cubit.dart';
import 'package:buro_employee/repository/bloc/change_password/change_pass_cubit.dart';
import 'package:buro_employee/repository/bloc/create_account/create_account_cubit.dart';
import 'package:buro_employee/repository/bloc/customer_list/customer_list_cubit.dart';
import 'package:buro_employee/repository/bloc/department_list/department_list_cubit.dart';
import 'package:buro_employee/repository/bloc/designation_list/designation_list_cubit.dart';
import 'package:buro_employee/repository/bloc/division_list_cubit/division_list_cubit.dart';
import 'package:buro_employee/repository/bloc/emp_general_info/emp_general_info_cubit.dart';
import 'package:buro_employee/repository/bloc/emp_sup_cmment/emp_sup_cmment_cubit.dart';
import 'package:buro_employee/repository/bloc/fiscal_year_list/fiscal_year_list_cubit.dart';
import 'package:buro_employee/repository/bloc/forgot_pass_verification/forgot_pass_verification_cubit.dart';
import 'package:buro_employee/repository/bloc/grade_list/grade_list_cubit.dart';
import 'package:buro_employee/repository/bloc/leave_approval_details/approval_details_cubit.dart';
import 'package:buro_employee/repository/bloc/leave_approval_request/leave_approval_request_cubit.dart';
import 'package:buro_employee/repository/bloc/leave_bloc/leave_bloc_cubit.dart';
import 'package:buro_employee/repository/bloc/liability_list/liability_list_cubit.dart';
import 'package:buro_employee/repository/bloc/login/generate_otp_cubit.dart';
import 'package:buro_employee/repository/bloc/home_cubit/home_cubit.dart';
import 'package:buro_employee/repository/bloc/manufecturing_option_one/manufecturing_option_one_cubit.dart';
import 'package:buro_employee/repository/bloc/menufacturing_option_two/menufacturing_option_two_cubit.dart';
import 'package:buro_employee/repository/bloc/module/module_cubit.dart';
import 'package:buro_employee/repository/bloc/my_request/request_cubit.dart';
import 'package:buro_employee/repository/bloc/plan_approval_cubit/plan_approval_cubit.dart';
import 'package:buro_employee/repository/bloc/plan_approval_details_cubit/plan_approval_details_cubit.dart';
import 'package:buro_employee/repository/bloc/plan_detail_cubit/plan_detail_cubit.dart';
import 'package:buro_employee/repository/bloc/plan_list_cubit/plan_list_cubit.dart';
import 'package:buro_employee/repository/bloc/product_purchase_prize/product_purchase_prize_cubit.dart';
import 'package:buro_employee/repository/bloc/product_sale_price/product_sale_price_cubit.dart';
import 'package:buro_employee/repository/bloc/recommendation_list/recommendation_list_cubit.dart';
import 'package:buro_employee/repository/bloc/request_details/request_details_cubit.dart';
import 'package:buro_employee/repository/bloc/reset_pass/reset_pass_cubit.dart';
import 'package:buro_employee/repository/bloc/sub_module/sub_module_cubit.dart';
import 'package:buro_employee/repository/bloc/zone_list/zone_list_cubit.dart';
import 'package:buro_employee/repository/database/database_handler.dart';

import 'package:buro_employee/repository/network/buro_repository.dart';
import 'package:buro_employee/repository/bloc/login/login_cubit.dart';
import 'package:buro_employee/repository/bloc/login/verify_otp_cubit.dart';
import 'package:buro_employee/sessionmanager/session_manager.dart';
import 'package:buro_employee/theme/colors.dart';
import 'package:buro_employee/theme/styles.dart';
import 'package:buro_employee/views/home/change_password.dart';
import 'package:buro_employee/views/home/employee_profile.dart';
import 'package:buro_employee/views/home/home_page.dart';
import 'package:buro_employee/views/leave/apply_leave.dart';
import 'package:buro_employee/views/login/login_screen.dart';
import 'package:buro_employee/views/login/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'bloc/branch_list/branch_list_cubit.dart';
import 'localization/Language/languages.dart';
import 'localization/locale_constants.dart';
import 'localization/localizations_delegate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:buro_employee/views/home/notification.dart';

class MyApp extends StatefulWidget {
  static GlobalKey<NavigatorState> materialKey = GlobalKey();

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale = null;
  final appRouter = AppRouter();
  String? _fcmToken;
  String? _apnsToken;



  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {


    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    requestPermission();

  }




  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return _InitProviders(
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        navigatorKey: MyApp.materialKey,
        onGenerateRoute: appRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
        navigatorObservers: <NavigatorObserver>[observer],
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        locale: _locale,
        supportedLocales: [
          Locale('en', ''),
          Locale('bn', ''),
        ],
        localizationsDelegates: [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode &&
                supportedLocale.countryCode == locale?.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
      ),
    );
  }




  /// Request notification permission
  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User granted permission");
    } else {
      print("User denied permission");
    }
  }

  /// Get FCM Token
  void getFCMToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();
    setState(() {
      _fcmToken = token;
    });
    print("Device FCM Token: $token");
  }





  /// Initialize Firebase Messaging
  void initializeFirebaseMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Foreground message received: ${message.notification?.title}");
      //_showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Notification clicked: ${message.notification?.title}");
    });
  }



}

class LandingScreen extends StatefulWidget {
  static const routeName = '/landing';

  static route() =>
      MaterialPageRoute(builder: (_) => LandingScreen(title: "title"));

  LandingScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _currentIndex = 0;
  var selectedLang;
  var isSelected = <bool>[true, false];
  var appVersion;
  String selectedText = "English";
  bool isChanged = true;


  final List<Widget> _children = [
    HomeScreen(), //0
    EmployeeProfile(), //1
    ChangePassword(), //2
    NotificationScreen()//3

  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    getSelectedLang().then((value) => {
          selectedLang = value,
          if (selectedLang.toString().isEmpty)
            {
              selectedText = 'বাংলা',
            }
          else if (selectedLang.toString() == 'bn')
            {
              selectedText = 'English',
            }
          else if (selectedLang.toString() == 'en')
            {selectedText = 'বাংলা'},
          setState(() {}),
        });

    update();
  }

  void update() {
    final modulebloc = context.read<ModuleCubit>();
    modulebloc.getModule();
  }

  Future<String> getSelectedLang() async {
    return await sessionManager.selectedLang;
  }

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    var bang = false;
    var eng = false;
    isSelected = <bool>[bang, eng];
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ModuleCubit, ModuleState>(
      listener: (context, state) {
        if (state is ModuleErrorState) {
          /* Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Network Error"),
            ),
          );*/
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        //print('App Module state $state');
        if (state is ModuleInitial) {
          return Scaffold(
              endDrawer: _endDrawer(),
              body: Center(
                child: CircularProgressIndicator(),
              ));
        } else if (state is ModuleLoading) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: ColorResources.APP_THEME_COLOR,
                title: Text(
                  '${Languages.of(context)?.labelWelcome}',
                  style: Styles.titleStyle,
                ),
              ),
              endDrawer: _endDrawer(),
              body: Center(
                child: CircularProgressIndicator(),
              ));
        } else if (state is ModuleLoaded) {
          var prflImgSrc;


          if(state.module.data.imgEmp != null){
            prflImgSrc  = base64Decode(state.module.data.imgEmp!);
          }

          var supervisor = state.module.data.supervisor;
          var name = state.module.data.employeeName;
          var designation = state.module.data.designationName;
          var employeeCode = state.module.data.employeeCode;

          sessionManager.setSupervisorInfo(supervisor);
          var messageBn = state.module.data.broadcastMsgBn;
          var messageEn = state.module.data.broadcastMsgEn;

          return Scaffold(
            endDrawer:state.module.data.imgEmp == null? _endDrawer():_endDrawerWIthImage(prflImgSrc, name, designation?? '') ,
            key: _scaffoldKey,
            body: Builder(builder: (BuildContext context) {
              return Stack(
                children: [
                  Container(
                    height: 310,
                    child: Stack(
                      children: [
                        ClipPath(
                          clipper: OvalBottomBorderClipper(),
                          child: Container(
                            color: ColorResources.APP_THEME_COLOR,
                            height: 350.0,
                          ),
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              state.module.data.imgEmp != null  ? CircleAvatar(
                                backgroundColor: ColorResources.APP_THEME_COLOR,
                                radius: 60,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: ClipOval(
                                    child: Image.memory(prflImgSrc),
                                  ),
                                ),
                              ): Container(color: Colors.red,),
                              Expanded(
                                child: state.module.data.imgEmp != null? Padding(
                                  padding: const EdgeInsets.only(top: 107),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name,
                                        maxLines: 10,
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color:
                                                ColorResources.NAME_TEXT_COLOR),
                                      ),
                                      Text(
                                        '$designation',
                                        /*overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        maxLines: 2,*/
                                        maxLines: 10,
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: ColorResources.WHITE),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('Employee ID',
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color:
                                                  ColorResources.NAME_TEXT_COLOR),
                                          textAlign: TextAlign.left),
                                      Text(employeeCode,
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: ColorResources.WHITE),
                                          textAlign: TextAlign.start)
                                    ],
                                  ),
                                ):Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 107),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          name,
                                          maxLines: 10,
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color:
                                              ColorResources.NAME_TEXT_COLOR),
                                        ),
                                        Text(
                                          '$designation',
                                          /*overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                          maxLines: 2,*/
                                          maxLines: 10,
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: ColorResources.WHITE),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Employee ID',
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                color:
                                                ColorResources.NAME_TEXT_COLOR),
                                            textAlign: TextAlign.left),
                                        Text(employeeCode,
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: ColorResources.WHITE),
                                            textAlign: TextAlign.start)
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, right: 15),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                color: Colors.white,
                                icon: Icon(Icons.menu),
                                onPressed: () {
                                  Scaffold.of(context).openEndDrawer();

                                  //}
                                },
                              )),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    padding: new EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .23,
                    ),
                    child: new Container(
                        //height: 500.0,
                        width: MediaQuery.of(context).size.width,
                        child: _children[_currentIndex]),
                  ),
                ],
              );
            }),
          );
          //return Container();
        } else if (state is ModuleErrorState) {
          //forceLogOut();
          return Scaffold(
              appBar: AppBar(
                backgroundColor: ColorResources.APP_THEME_COLOR,
                title: Text(
                  '${Languages.of(context)?.labelWelcome}',
                  style: Styles.titleStyle,
                ),
              ),
              endDrawer: _endDrawer(),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: ColorResources.PAGE_BACKGROUND,
                  child: RefreshIndicator(
                    onRefresh: refresh,
                    child: Center(
                      child: Container(
                        child: Text('Network Error r'),
                      ),
                    ),
                  ),
                ),
              ));
        } else if (state is ModuleAuthenticationErrorState) {
          print('${state.error}');
          // Navigator.of(context).pop();
          //forceLogOut();
          return Scaffold(
              appBar: AppBar(
                backgroundColor: ColorResources.APP_THEME_COLOR,
                title: Text(
                  '${Languages.of(context)?.labelWelcome}',
                  style: Styles.titleStyle,
                ),
              ),
              endDrawer: _endDrawer(),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: ColorResources.PAGE_BACKGROUND,
                  child: RefreshIndicator(
                    onRefresh: refresh,
                    child: Center(
                      child: Container(
                        child: Text('Authentication Error'),
                      ),
                    ),
                  ),
                ),
              ));
        } else {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: ColorResources.APP_THEME_COLOR,
                title: Text(
                  '${Languages.of(context)?.labelWelcome}',
                  style: Styles.titleStyle,
                ),
              ),
              endDrawer: _endDrawer(),
              body: Center(
                child: Container(
                  child: Text('Error'),
                ),
              ));
        }
      },
    );
  }

  Drawer _endDrawer() {
    return Drawer(
      elevation: 10,
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: ColorResources.NAME_BLACK_COLOR),
                      ),
                      Text(
                        '',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: ColorResources.NAME_BLACK_COLOR),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: ColorResources.GREY_THIRTY,
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  Icon(Icons.home,color: ColorResources.APP_THEME_COLOR,),
                  SizedBox(width: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop(); // onTabTapped(0);
                      setState(() {
                        _currentIndex = 0;
                      });
                    },
                    child: Text(Languages.of(context)!.home,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: ColorResources.APP_THEME_COLOR)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  Icon(Icons.person,color: ColorResources.APP_THEME_COLOR,),
                  SizedBox(width: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      setState(() {
                        _currentIndex = 1;
                      });
                    },
                    child: Text(Languages.of(context)!.profile,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: ColorResources.APP_THEME_COLOR)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  Icon(Icons.language,color: ColorResources.APP_THEME_COLOR,),
                  TextButton(
                    onPressed: () {
                      isChanged = !isChanged;
                      setState(() {
                        if (isChanged == true) {
                          selectedText = "English";
                          changeLanguage(context, 'en');

                          update();
                        } else {
                          update();

                          selectedText = "বাংলা";
                          changeLanguage(context, 'bn');
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('$selectedText',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: ColorResources.APP_THEME_COLOR)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.lock_open_outlined,color: ColorResources.APP_THEME_COLOR,),
                  SizedBox(width: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      setState(() {
                        _currentIndex = 2;
                      });
                    },
                    child: Text(Languages.of(context)!.changePassword,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: ColorResources.APP_THEME_COLOR)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: ColorResources.GREY_THIRTY,
            ),
            SizedBox(
              height: 20,
            ),
            Row(children: [

              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Icon(Icons.logout,color: ColorResources.LIGHT_YELLOW,),
              ),
              TextButton(
                  onPressed: logOut,
                  child: Text('${Languages.of(context)!.logout}',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: ColorResources.LIGHT_YELLOW))),
            ],),
            SizedBox(
              height: 20,
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: ColorResources.GREY_THIRTY,
            ),
          ],
        ),
      ),
    );
  }

  Drawer _endDrawerWIthImage(
      Uint8List profileImage, String name, String designation) {
    return Drawer(
      elevation: 10,
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child:profileImage != null ? CircleAvatar(
                    backgroundColor: ColorResources.WHITE,
                    radius: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: ClipOval(
                        child: Image.memory(profileImage),
                      ),
                    ),
                  ) : Container(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width:  180,
                        child: Text(
                          name,
                         // softWrap: true,
                          //overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: ColorResources.NAME_BLACK_COLOR),
                        ),
                      ),
                      Container(
                        width: 180,
                        child: Text(
                          designation,
                          // softWrap: true,
                          //overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: ColorResources.NAME_BLACK_COLOR),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              /*  InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Badge(
                        isLabelVisible : false,
                         label: Text('10'),
                        child: Icon(Icons.notifications_active_outlined)


                    ),

                  ),

                  onTap: (){

                    //Navigator.of(context).pop(); // onTabTapped(0);
                    setState(() {
                      _currentIndex = 3;
                    });
                    //Navigator.of(context).pop();
                    Navigator.pushNamed(context, NotificationScreen.routeName);

                  },
                )*/
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: ColorResources.GREY_THIRTY,
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  Row(children: [

                    Icon(Icons.home,color: ColorResources.APP_THEME_COLOR,),
                    SizedBox(width: 5,),
                    ],),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop(); // onTabTapped(0);
                      setState(() {
                        _currentIndex = 0;
                      });
                    },
                    child: Text(Languages.of(context)!.home,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: ColorResources.APP_THEME_COLOR)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  Icon(Icons.person,color: ColorResources.APP_THEME_COLOR,),
                  SizedBox(width: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      setState(() {
                        _currentIndex = 1;
                      });
                    },
                    child: Text(Languages.of(context)!.profile,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: ColorResources.APP_THEME_COLOR)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  Icon(Icons.language,color: ColorResources.APP_THEME_COLOR,),
                  TextButton(
                    onPressed: () {
                      isChanged = !isChanged;
                      //print('Selected Text $selectedText');
                      if (isChanged == true) {
                        selectedText = "বাংলা";
                        changeLanguage(context, 'en');
                        //initState();
                        update();
                      } else {
                        selectedText = "English";
                        changeLanguage(context, 'bn');
                        //initState();
                        update();
                      }
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('$selectedText',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: ColorResources.APP_THEME_COLOR)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  Icon(Icons.lock_open_outlined,color: ColorResources.APP_THEME_COLOR,),
                  SizedBox(width: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      setState(() {
                        _currentIndex = 2;
                      });
                    },
                    child: Text(Languages.of(context)!.changePassword,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: ColorResources.APP_THEME_COLOR)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: ColorResources.GREY_THIRTY,
            ),
            SizedBox(
              height: 20,
            ),
            Row(

              children: [

              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Icon(Icons.logout,color: ColorResources.LIGHT_YELLOW,),
              ),
              TextButton(
                  onPressed: logOut,
                  child: Text('${Languages.of(context)!.logout}',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: ColorResources.LIGHT_YELLOW))),
            ],),
            SizedBox(
              height: 20,
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: ColorResources.GREY_THIRTY,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logOut() async {
    Navigator.of(context).pop();
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Languages.of(context)!.dialogHeader),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(Languages.of(context)!.logOutText),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(Languages.of(context)!.no),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the Dialog
              },
            ),
            TextButton(
              child: Text(Languages.of(context)!.yes),
              onPressed: () async {
                await DataBaseHandler.instance.clearDatabase();
                await sessionManager.clearPreferences();
               /* sessionManager.setIsLoggedIn(false);
                sessionManager.setUserID('');
                sessionManager.setPassword('');
                sessionManager.setToken('');
                sessionManager.clearCoreFinanceSiteCode();
                sessionManager.clearGradeID();*/
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> forceLogOut() async {
    sessionManager.setIsLoggedIn(false);
    sessionManager.setUserID('');
    sessionManager.setPassword('');

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
  }

  Future refresh() {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        final bloc = context.read<ModuleCubit>();
        bloc.getModule();
        //initState();
        /// adding elements in list after [1 seconds] delay
        /// to mimic network call
        ///
        /// Remember: [setState] is necessary so that
        /// build method will run again otherwise
        /// list will not show all elements

        // showing snackbar
        // CommonMethods.showMessage(context, "Refreshed", Colors.green);
      },
    );
  }




}

class _InitProviders extends StatelessWidget {
  final Widget child;

  const _InitProviders({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (BuildContext context) =>
              LoginCubit(buroRepository: BuroRepository()),
        ),
        BlocProvider<VerifyOtpCubit>(
          create: (BuildContext context) => VerifyOtpCubit(BuroRepository()),
        ),
        BlocProvider<ModuleCubit>(
          create: (BuildContext context) =>
              ModuleCubit(BuroRepository(), context),
        ),
        BlocProvider<SubModuleCubit>(
          create: (context) => SubModuleCubit(BuroRepository()),
        ),
        BlocProvider<RequestCubit>(
          create: (context) => RequestCubit(BuroRepository()),
        ),
        BlocProvider<RequestDetailsCubit>(
          create: (context) => RequestDetailsCubit(BuroRepository()),
        ),
        BlocProvider<ApprovalRequestCubit>(
          create: (context) => ApprovalRequestCubit(BuroRepository()),
        ),
        BlocProvider<ApprovalDetailsCubit>(
          create: (context) => ApprovalDetailsCubit(BuroRepository()),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(BuroRepository()),
        ),
        BlocProvider<ChangePasswordCubit>(
          create: (context) => ChangePasswordCubit(BuroRepository()),
        ),
        BlocProvider<GenerateOtpCubit>(
          create: (BuildContext context) =>
              GenerateOtpCubit(buroRepository: BuroRepository()),
        ),
        BlocProvider<ForgotPassVerificationCubit>(
          create: (BuildContext context) =>
              ForgotPassVerificationCubit(buroRepository: BuroRepository()),
        ),
        BlocProvider<BillBlocCubit>(
          create: (BuildContext context) =>
              BillBlocCubit(buroRepository: BuroRepository()),
        ),
        BlocProvider<BillReqListCubit>(
          create: (BuildContext context) => BillReqListCubit(BuroRepository()),
        ),
        BlocProvider<ResetPassCubit>(
          create: (BuildContext context) => ResetPassCubit(BuroRepository()),
        ),
        BlocProvider<BillDetailsCubit>(
          create: (BuildContext context) => BillDetailsCubit(BuroRepository()),
        ),
        BlocProvider<PlanListCubit>(
          create: (BuildContext context) => PlanListCubit(BuroRepository()),
        ),
        BlocProvider<PlanDetailCubit>(
          create: (BuildContext context) => PlanDetailCubit(BuroRepository()),
        ),
        BlocProvider<PlanApprovalCubit>(
          create: (BuildContext context) => PlanApprovalCubit(BuroRepository()),
        ),
        BlocProvider<PlanApprovalDetailsCubit>(
          create: (BuildContext context) => PlanApprovalDetailsCubit(BuroRepository()),
        ),
        BlocProvider<ApplyCubit>(
          create: (BuildContext context) => ApplyCubit(BuroRepository()),
        ),
        BlocProvider<AnnualAppraisalCubit>(
          create: (BuildContext context) => AnnualAppraisalCubit(BuroRepository()),
        ),
        BlocProvider<ApaEmpInfoCubit>(
          create: (BuildContext context) => ApaEmpInfoCubit(BuroRepository()),
        ),
        BlocProvider<ApaEmpScoreCubit>(
          create: (BuildContext context) => ApaEmpScoreCubit(BuroRepository()),
        ),
        BlocProvider<EmpSupCmmentCubit>(
          create: (BuildContext context) => EmpSupCmmentCubit(BuroRepository()),
        ),
        BlocProvider<ApaTargetScoreCubit>(
          create: (BuildContext context) => ApaTargetScoreCubit(BuroRepository()),
        ),
        BlocProvider<ApaEmpLeaveCubit>(
          create: (BuildContext context) => ApaEmpLeaveCubit(BuroRepository()),
        ),
        BlocProvider<ApaCmntHistoryCubit>(
          create: (BuildContext context) => ApaCmntHistoryCubit(BuroRepository()),
        ),
        BlocProvider<ApaRecomHistoryCubit>(
          create: (BuildContext context) => ApaRecomHistoryCubit(BuroRepository()),
        ),
        BlocProvider<ApaMenuInfoCubit>(
          create: (BuildContext context) => ApaMenuInfoCubit(BuroRepository()),
        ),
        BlocProvider<ApaHrScoreCubit>(
          create: (BuildContext context) => ApaHrScoreCubit(BuroRepository()),
        ),
        BlocProvider<ApaReceiverInfoCubit>(
          create: (BuildContext context) => ApaReceiverInfoCubit(BuroRepository())),
        BlocProvider<ApaGetEmployeeCubit>(
          create: (BuildContext context) => ApaGetEmployeeCubit(BuroRepository()),
        ),
        BlocProvider<DesignationListCubit>(
          create: (BuildContext context) => DesignationListCubit(BuroRepository()),
        ),


        BlocProvider<ZoneListCubit>(
          create: (BuildContext context) => ZoneListCubit(BuroRepository()),
        ),

        BlocProvider<FiscalYearListCubit>(
          create: (BuildContext context) => FiscalYearListCubit(BuroRepository()),
        ),

        BlocProvider<LiabilityListCubit>(
          create: (BuildContext context) => LiabilityListCubit(BuroRepository()),
        ),

        BlocProvider<GradeListCubit>(
          create: (BuildContext context) => GradeListCubit(BuroRepository()),
        ),


        BlocProvider<BranchListCubit>(
          create: (BuildContext context) => BranchListCubit(BuroRepository()),
        ),
        BlocProvider<DepartmentListCubit>(
          create: (BuildContext context) => DepartmentListCubit(BuroRepository()),
        ),
        BlocProvider<DivisionListCubit>(
          create: (BuildContext context) => DivisionListCubit(BuroRepository()),
        ),
        BlocProvider<AreaListCubit>(
          create: (BuildContext context) => AreaListCubit(BuroRepository()),
        ),
        BlocProvider<RecommendationListCubit>(
          create: (BuildContext context) => RecommendationListCubit(BuroRepository()),
        ),
        BlocProvider<LeaveApprovalRequestCubit>(
          create: (BuildContext context) => LeaveApprovalRequestCubit(BuroRepository()),
        ),
        BlocProvider<LeaveApprovalDetailsCubit>(
          create: (BuildContext context) => LeaveApprovalDetailsCubit(BuroRepository()),
        ),
        BlocProvider<ProductSalePriceCubit>(
          create: (BuildContext context) => ProductSalePriceCubit(BuroRepository()),
        ),

        BlocProvider<ProductPurchasePrizeCubit>(
          create: (BuildContext context) => ProductPurchasePrizeCubit(BuroRepository()),
        ),


        BlocProvider<AllCashInflowCubit>(
          create: (BuildContext context) => AllCashInflowCubit(BuroRepository()),
        ),


        BlocProvider<BusinessCashOutflowCubit>(
          create: (BuildContext context) => BusinessCashOutflowCubit(BuroRepository()),
        ),

        BlocProvider<HouseHoldExpensesCubit>(
          create: (BuildContext context) => HouseHoldExpensesCubit(BuroRepository()),
        ),

        BlocProvider<HouseHoldExpensesCubit>(
          create: (BuildContext context) => HouseHoldExpensesCubit(BuroRepository()),
        ),

        BlocProvider<OtherRecurringExpenseCubit>(
          create: (BuildContext context) => OtherRecurringExpenseCubit(BuroRepository()),
        ),

        BlocProvider<OtherRecurringExpenseCubit>(
          create: (BuildContext context) => OtherRecurringExpenseCubit(BuroRepository()),
        ),

        BlocProvider<LoanEligibilityCubit>(
          create: (BuildContext context) => LoanEligibilityCubit(BuroRepository()),
        ),
        BlocProvider<ExistingLoansCubit>(
          create: (BuildContext context) => ExistingLoansCubit(BuroRepository()),
        ),
        BlocProvider<CustomerListCubit>(
          create: (BuildContext context) => CustomerListCubit(BuroRepository()),
        ),
        BlocProvider<ManufecturingOptionOneCubit>(
          create: (BuildContext context) => ManufecturingOptionOneCubit(BuroRepository()),
        ),
        BlocProvider<ManufacturingOptionTwoCubit>(
          create: (BuildContext context) => ManufacturingOptionTwoCubit(BuroRepository()),
        ),


        BlocProvider<EnterpriseDetailsCubit>(
          create: (BuildContext context) => EnterpriseDetailsCubit(BuroRepository()),
        ),

        BlocProvider<ProposedLoanDetailsCubit>(
          create: (BuildContext context) => ProposedLoanDetailsCubit(BuroRepository()),
        ),

        BlocProvider<SupplierVerificationCubit>(
          create: (BuildContext context) => SupplierVerificationCubit(BuroRepository()),
        ),

        BlocProvider<BuyerVerificationCubit>(
          create: (BuildContext context) => BuyerVerificationCubit(BuroRepository()),
        ),

        BlocProvider<PersonalReferenceVerificationCubit>(
          create: (BuildContext context) => PersonalReferenceVerificationCubit(BuroRepository()),
        ),

        BlocProvider<SalesCubit>(
          create: (BuildContext context) => SalesCubit(BuroRepository()),
        ),

        BlocProvider<PurchasesCubit>(
          create: (BuildContext context) => PurchasesCubit(BuroRepository()),
        ),

        BlocProvider<BankBalanceCubit>(
          create: (BuildContext context) => BankBalanceCubit(BuroRepository()),
        ),
        BlocProvider<SalesCashBookCubit>(
          create: (BuildContext context) => SalesCashBookCubit(BuroRepository()),
        ),

        BlocProvider<PurchasesCubit>(
          create: (BuildContext context) => PurchasesCubit(BuroRepository()),
        ),

        BlocProvider<StockCubit>(
          create: (BuildContext context) => StockCubit(BuroRepository()),
        ),

        BlocProvider<BusinessExpenseMonthlyCubit>(
          create: (BuildContext context) => BusinessExpenseMonthlyCubit(BuroRepository()),
        ),

        BlocProvider<OtherIncomeMonthlyCubit>(
          create: (BuildContext context) => OtherIncomeMonthlyCubit(BuroRepository()),
        ),

        BlocProvider<PersonalExpenseMonthlyCubit>(
          create: (BuildContext context) => PersonalExpenseMonthlyCubit(BuroRepository()),
        ),
        BlocProvider<ExistingLoansCubit>(
          create: (BuildContext context) => ExistingLoansCubit(BuroRepository()),
        ),

        BlocProvider<RegularInvestmentCubit>(
          create: (BuildContext context) => RegularInvestmentCubit(BuroRepository()),
        ),

        BlocProvider<QualitativeAspectsCubit>(
          create: (BuildContext context) => QualitativeAspectsCubit(BuroRepository()),
        ),
        BlocProvider<PurchaseCashBookCubit>(
          create: (BuildContext context) => PurchaseCashBookCubit(BuroRepository()),
        ),
        BlocProvider<FrequencyCubit>(
          create: (BuildContext context) => FrequencyCubit(BuroRepository()),
        ),
        BlocProvider<SeasonalityNMarginCubit>(
          create: (BuildContext context) => SeasonalityNMarginCubit(BuroRepository()),
        ),

        BlocProvider<WorkingCapitalCubit>(
          create: (BuildContext context) => WorkingCapitalCubit(BuroRepository()),
        ),
        BlocProvider<WorkingCapitalRequirmentCubit>(
          create: (BuildContext context) => WorkingCapitalRequirmentCubit(BuroRepository()),
        ),

        BlocProvider<MarginCubit>(
          create: (BuildContext context) => MarginCubit(BuroRepository()),
        ),

        BlocProvider<CustomerDetailsCubit>(
          create: (BuildContext context) => CustomerDetailsCubit(BuroRepository()),
        ),
        BlocProvider<AddBillInfoCubit>(
          create: (BuildContext context) => AddBillInfoCubit(BuroRepository()),
        ),
        BlocProvider<LeaveBlocCubit>(
          create: (BuildContext context) => LeaveBlocCubit(BuroRepository()),
        ),

        BlocProvider<BillReportBlocCubit>(
          create: (BuildContext context) => BillReportBlocCubit(BuroRepository()),
        ),

        BlocProvider<EmpGeneralInfoCubit>(
          create: (BuildContext context) => EmpGeneralInfoCubit(BuroRepository()),
        ),

        BlocProvider<CreateAccountCubit>(
          create: (BuildContext context) => CreateAccountCubit(BuroRepository()),
        ),


      ],
      child: child,
    );
  }
}
