import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class NotificationScreen extends StatefulWidget {

  static const routeName = '/Notification';

  static route() => MaterialPageRoute(builder: (_) => NotificationScreen());

  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications'),
        backgroundColor: ColorResources.APP_THEME_COLOR,
      ),
    );
  }
}
