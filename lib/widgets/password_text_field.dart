import 'package:buro_employee/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final String hint;
  final TextEditingController? controller;
  final bool? passwordField;
  final bool? emailField;
  final bool? usernameField;
  final Color? textColor;
  final bool isNumeric;
  final int? maxLines;

  const PasswordTextField({
    Key? key,
    this.onChanged,
    this.controller,
    this.passwordField,
    this.onEditingComplete,
    this.onSubmitted,
    required this.isNumeric,
    this.emailField,
    this.usernameField,
    this.textColor,
    this.maxLines,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      enableSuggestions: true,
      controller: controller,
     // inputFormatters: isNumeric ?[WhitelistingTextInputFormatter.digitsOnly]:[],
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorResources.TEXT_FIELD_COLOR,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                color: ColorResources.APP_THEME_COLOR,
                style: BorderStyle.solid,
                width: 2

            )
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: ColorResources.TEXT_FIELD_BORDER_COLOR, width: 0.0),
        ),
        hintText: hint,

        /* obscureText: true,
        enableSuggestions: false,
        autocorrect: false,*/
        contentPadding: EdgeInsets.all(15),
        //hintStyle: TextStyle(color: Colors.black),
      ),

    );
  }
}
