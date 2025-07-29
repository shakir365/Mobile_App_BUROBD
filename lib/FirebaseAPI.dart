/*

import 'package:firebase_messaging/firebase_messaging.dart';
class FirebaseAPI{

final _firebaseMessaging = FirebaseMessaging.instance;



  Future<void> initNotifucation() async {


    await _firebaseMessaging.requestPermission();

    final fcmToken = await _firebaseMessaging.getToken();
    print('fcmToken $fcmToken');


  }

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


}*/
