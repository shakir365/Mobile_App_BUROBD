import 'dart:io';
import 'package:buro_employee/localization/Language/languages.dart';
import 'package:buro_employee/repository/bloc/login/login_cubit.dart';
import 'package:buro_employee/repository/network/buro_repository.dart';
import 'package:buro_employee/sessionmanager/session_manager.dart';
import 'package:buro_employee/theme/colors.dart';
import 'package:buro_employee/theme/styles.dart';
import 'package:buro_employee/utilities/analytics.dart';
import 'package:buro_employee/utilities/common_methods.dart';
import 'package:buro_employee/views/login/create_account.dart';
import 'package:buro_employee/views/login/forget_password.dart';
import 'package:buro_employee/views/login/login_verification.dart';
import 'package:buro_employee/widgets/white_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../app.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
//import 'package:firebase_remote_config/firebase_remote_config.dart';
class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userIdController = TextEditingController();
  final passwordController = TextEditingController();
  //final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;
  late LoginCubit loginBloc;
  bool _isObscure = true;
  var repository = BuroRepository();
  String welcomeMessage = 'Loading...';
  bool buttonShow = true;

  @override
  void initState() {
    loginBloc = context.read<LoginCubit>();

   // fetchRemoteConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 2;

    return Scaffold(
        body: Builder(
      builder: (context) => Column(
        children: [
          Flexible(flex: 2, child: CommonMethods.topBanner(width)),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: ListView(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        Languages.of(context)!.login,
                        style: TextStyle(fontSize: 28, color: Colors.black),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        Languages.of(context)!.loginIntroText,
                        style: TextStyle(
                            fontSize: 14, color: ColorResources.GREY_DARK),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  WhiteTextField(
                    isNumeric: false,
                    hint: Languages.of(context)!.userHint,
                    controller: userIdController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
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
                        hintText: Languages.of(context)!.password,
                        contentPadding: EdgeInsets.all(20),
                        hintStyle:
                            TextStyle(color: ColorResources.GREY_SEVENTY),
                        suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            })),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _isObscure,
                    cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                    style: Styles.hintTextStyle,
                    maxLines: 1,
                    controller: passwordController,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Row(children: [

                    Visibility(
                      visible: false,
                      child: InkWell(
                        onTap: () {
                          //openLinkInBrowser('https://www.burobd.org/about-buro');
                          Navigator.pushNamed(context, CreateAccount.routeName);
                        },
                        child: Align(
                          alignment: Alignment.centerLeft, // Adjust as needed
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.app_registration_outlined,
                                  size: 17,// Use any icon (e.g., Icons.info, Icons.language, etc.)
                                  color: ColorResources.LIGHT_YELLOW,
                                ),
                                SizedBox(width: 6), // spacing between icon and text
                                Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: ColorResources.LIGHT_YELLOW,

                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      child: Align(

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${Languages.of(context)!.forgotPassword}?',
                              style:
                              TextStyle(color: ColorResources.LIGHT_YELLOW),
                            ),
                          )),
                      onTap: () {
                        Navigator.pushNamed(context, ForgetPassword.routeName);
                      },
                    ),

                  ],

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      //style: ButtonStyle(),
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0, backgroundColor: ColorResources.APP_THEME_COLOR,
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                      onPressed: () async {
                        //throw Exception();
                       // FirebaseCrashlytics.instance.crash();
                        if (userIdController.text.isEmpty) {
                          CommonMethods.showMessage(
                              context,
                              Languages.of(context)!.userIdEmptyValidation,
                              Colors.red);
                        } else if (passwordController.text.isEmpty) {
                          CommonMethods.showMessage(
                              context,
                              Languages.of(context)!.passwordValidation,
                              Colors.red);
                        } else {
                          CommonMethods.showLoaderDialog(context);

                         /* if(userIdController.text == 'admin' && passwordController.text == 'admin@123'){
                            CommonMethods.showLoaderDialog(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginTestPage()));

                          } else {*/
                            var token;
                            try {
                              final result =
                              await InternetAddress.lookup('google.com');
                              if (result.isNotEmpty &&
                                  result[0].rawAddress.isNotEmpty) {
                                loginBloc
                                    .getToken(userIdController.text,
                                    passwordController.text, context)
                                    .then((value) => {
                                  token = value.token,
                                  if (value.token.isNotEmpty)
                                    {
                                      loginBloc
                                          .authenticateWithToken(
                                          value.token)
                                          .then((value) => {
                                        if (value.success)
                                          {
                                            if (value.data
                                                .otpToMobile ==
                                                false &&
                                                value.data
                                                    .otpToEmail ==
                                                    false)
                                              {
                                                sessionManager
                                                    .setUserID(
                                                    userIdController
                                                        .text),
                                                sessionManager
                                                    .setPassword(
                                                    passwordController
                                                        .text),
                                                sessionManager
                                                    .setIsLoggedIn(
                                                    true),
                                                repository
                                                    .getBranchList()
                                                    .whenComplete(
                                                        () {
                                                      analytics.firebaseAnalytics.logEvent(name: 'Login');
                                                      //analytics.setUserId(_username);
                                                      //analytics.setUserProperty(_username);
                                                      Navigator.pop(context);
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => LandingScreen(
                                                                title: 'BURO Employee',
                                                              )));
                                                    })
                                              }
                                            else
                                              {
                                                sessionManager
                                                    .setUserID(
                                                    userIdController
                                                        .text),
                                                sessionManager
                                                    .setPassword(
                                                    passwordController
                                                        .text),
                                                sessionManager
                                                    .setToken(
                                                    token),
                                                analytics
                                                    .firebaseAnalytics
                                                    .logEvent(
                                                    name:
                                                    'Login'),
                                                //analytics.setUserId(_username);
                                                //analytics.setUserProperty(_username);

                                                Navigator.of(
                                                    context)
                                                    .pushNamedAndRemoveUntil(
                                                    LoginVerification
                                                        .routeName,
                                                        (route) =>
                                                    false,
                                                    arguments:
                                                    value),
                                              }
                                          }
                                        else
                                          {
                                            Navigator.pop(
                                                context),
                                            CommonMethods.showMessage(
                                                context,
                                                Languages.of(
                                                    context)!
                                                    .somethingWrongText,
                                                Colors.red),
                                          }
                                      })
                                    }
                                })
                                    .onError((error, stackTrace) => {});
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


                        //}
                      },
                      child: Container(
                        height: 56,
                        child: Center(
                          child: Text(
                            Languages.of(context)!.login,
                            style: Styles.buttonTextStyle,
                          ),
                        ),
                      )),


                  Visibility(
                    visible: false,
                    child: InkWell(
                      child: Align(
                         alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Do not have any account ? \n'
                                  '             Sign Up',
                              style:
                              TextStyle(color: ColorResources.LIGHT_YELLOW),
                            ),
                          )),
                      onTap: () {
                       /* Navigator.pushNamed(context, CreateAccount.routeName);*/
                        Navigator.pop(context);
                        Navigator.pushNamed(context, CreateAccount.routeName);
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }


  /*Future<void> fetchRemoteConfig() async {
    try {
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: Duration(seconds: 10),
        minimumFetchInterval: Duration(hours: 1),
      ));

      await _remoteConfig.fetchAndActivate();
      buttonShow = _remoteConfig.getBool('CreateAccountButton');
      setState(() {

        print('Remote Config button Show $buttonShow');
      });


    } catch (e) {
      setState(() {
        welcomeMessage = 'Failed to load';
      });
      print('Remote Config Error: $e');
    }
  }*/
}





Future<void> openLinkInBrowser(String url) async {
  final Uri uri = Uri.parse(url);

  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = ColorResources.APP_THEME_COLOR;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
