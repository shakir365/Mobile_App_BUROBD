import 'package:buro_employee/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginTestPage extends StatefulWidget {
  const LoginTestPage({Key? key}) : super(key: key);

  @override
  _LoginTestPageState createState() => _LoginTestPageState();
}





class _LoginTestPageState extends State<LoginTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),backgroundColor: ColorResources.APP_THEME_COLOR,
        automaticallyImplyLeading: false,
      ),

      body: Center(child: Text('Login Successful'),),);
  }
}
