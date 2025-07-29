import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


void main() async {
  // Set `enableInDevMode` to true to see reports while in debug mode
  // This is only to be used for confirming that reports are being
  // submitted as expected. It is not intended to be used for everyday
  // development.

  WidgetsFlutterBinding.ensureInitialized();

  //HttpOverrides.global = MyHttpOverrides();

 /* await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/

  await Firebase.initializeApp(
    name: 'buro-employee',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Pass all uncaught "fatal" errors from the framework to Crashlytics

  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };


 // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);



  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });



 /* FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Request permissions on iOS
  await messaging.requestPermission();

  // Optional: Get and log the token
  String? token = await messaging.getAPNSToken();
  print("APNS Token: $token");*/




}


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        // Allowing only our Base API URL.
        List<String> validHosts = ['https://apps.burobd.org/bbhrm_app/'];

        final isValidHost = validHosts.contains(host);
        return isValidHost;

        // return true if you want to allow all host. (This isn't recommended.)
        // return true;
      };
  }
}