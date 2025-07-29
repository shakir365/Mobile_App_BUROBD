import 'package:buro_employee/localization/Language/languages.dart';
import 'package:buro_employee/repository/bloc/reset_pass/reset_pass_cubit.dart';
import 'package:buro_employee/theme/colors.dart';
import 'package:buro_employee/theme/styles.dart';
import 'package:buro_employee/utilities/common_methods.dart';
import 'package:buro_employee/widgets/white_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_screen.dart';

class ResetPassword extends StatefulWidget {
  static const routeName = '/resetPassword';

  final String arguments;

  ResetPassword(this.arguments, {Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool _isObscureNew = true;
  bool _isObscureConfirm = true;
  late ResetPassCubit bloc;
  var selectedLang;

  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();
  var newPassFocusNode = FocusNode();
  var confirmPassFocusNode = FocusNode();

  @override
  initState() {
    super.initState();
    CommonMethods.getSelectedLang().then((value) => {
          selectedLang = value,
          print('Selecetdlang change password $selectedLang value $value')
        });

    bloc = context.read<ResetPassCubit>();
    bloc.initState();
    //print('Change password initState called');
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 2;

    return Scaffold(body: Builder(
      builder: (BuildContext context) {
        return Column(
          children: [
            Flexible(
              flex: 2,
              child: CommonMethods.topBanner(width),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          Languages.of(context)!.resetPassword,
                          style: TextStyle(fontSize: 28, color: Colors.black),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          Languages.of(context)!.resetPasswordInstructionText,
                          style: TextStyle(
                              fontSize: 14,
                              color: ColorResources.GREY_DARK_SIXTY),
                        )),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                          child: TextFormField(
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
                            hintText: Languages.of(context)!.newPassText,
                            contentPadding: EdgeInsets.all(20),
                            hintStyle:
                                TextStyle(color: ColorResources.GREY_SEVENTY),
                            suffixIcon: IconButton(
                                icon: Icon(_isObscureNew
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscureNew = !_isObscureNew;
                                  });
                                })),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _isObscureNew,
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: 1,
                        controller: newPassController,
                      )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Container(
                          child: TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorResources.TEXT_FIELD_COLOR,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: ColorResources.APP_THEME_COLOR,
                                    style: BorderStyle.solid,
                                    width: 2)),
                            hintText: Languages.of(context)!.confirmPassText,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: ColorResources.TEXT_FIELD_BORDER_COLOR,
                                  width: 0.0),
                            ),
                            contentPadding: EdgeInsets.all(20),
                            hintStyle:
                                TextStyle(color: ColorResources.GREY_SEVENTY),
                            suffixIcon: IconButton(
                                icon: Icon(_isObscureConfirm
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscureConfirm = !_isObscureConfirm;
                                  });
                                })),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _isObscureConfirm,
                        cursorColor: Color.fromRGBO(0, 0, 0, 0.1),
                        style: Styles.hintTextStyle,
                        maxLines: 1,
                        controller: confirmPassController,
                      )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        //style: ButtonStyle(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorResources.APP_THEME_COLOR,
                          minimumSize: const Size.fromHeight(50),
                          // NEW
                        ),
                        onPressed: () async {
                          if (newPassController.text.isEmpty) {
                            newPassFocusNode.requestFocus();
                            CommonMethods.showMessage(
                                context,
                                Languages.of(context)!.newPassEmptyValidation,
                                Colors.red);
                          } else if (newPassController.text.length < 5) {
                            CommonMethods.showMessage(
                                context,
                                Languages.of(context)!.fiveDigitValidation,
                                Colors.red);
                          } else if (confirmPassController.text.isEmpty) {
                            confirmPassFocusNode.requestFocus();
                            CommonMethods.showMessage(
                                context,
                                Languages.of(context)!
                                    .confirmPassEmptyValidation,
                                Colors.red);
                          } else if (confirmPassController.text.length < 5) {
                            confirmPassFocusNode.requestFocus();
                            CommonMethods.showMessage(
                                context,
                                Languages.of(context)!.fiveDigitValidation,
                                Colors.red);
                          } else {
                            if (newPassController.text !=
                                confirmPassController.text) {
                              CommonMethods.showMessage(
                                  context,
                                  Languages.of(context)!
                                      .passwordMatchValidation,
                                  Colors.red);
                            } else {
                              CommonMethods.showLoaderDialog(context);
                              try {
                                bloc.resetPass(
                                    widget.arguments,
                                    newPassController.text,
                                    confirmPassController.text)
                                    .then((value) => {
                                      if (value!.success)
                                      {
                                        CommonMethods.showMessage(context,
                                            value.messageEn, Colors.green),
                                        Navigator.pop(context),
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            LoginScreen.routeName,
                                                (route) => false),
                                          } else
                                            {
                                              Navigator.pop(context),
                                              CommonMethods.showMessage(context, value.messageEn, Colors.red)
                                            }


                                    });
                              } catch (e) {
                                print(e);
                                Navigator.pop(context);
                                CommonMethods.showMessage(context, 'Something went wrong', Colors.red);
                              }
                            }
                          }
                        },
                        child: Container(
                          height: 56,
                          child: Center(
                            child: Text(Languages.of(context)!.submitButton,
                                style: Styles.buttonTextStyle),
                          ),
                        ))
                  ],
                ),
              ),
            )
          ],
        );
      },
    ));
  }
}
