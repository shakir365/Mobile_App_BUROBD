import 'package:buro_employee/repository/bloc/apa_emp_leave/apa_emp_leave_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/colors.dart';
import '../../theme/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ApaLeave extends StatefulWidget {
  const ApaLeave({Key? key}) : super(key: key);

  @override
  _ApaLeaveState createState() => _ApaLeaveState();
}

class _ApaLeaveState extends State<ApaLeave> {

  late ApaEmpLeaveCubit apaEmpLeaveCubit;

  @override
  void initState() {
    // TODO: implement initState
    apaEmpLeaveCubit = context.read<ApaEmpLeaveCubit>();;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 100),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ছুটির কারণ',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: ColorResources.GREY_NINETY,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              enableSuggestions: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorResources.TEXT_FIELD_COLOR,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                        color: ColorResources.APP_THEME_COLOR,
                        style: BorderStyle.solid,
                        width: 2)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      color:
                      ColorResources.TEXT_FIELD_BORDER_COLOR,
                      width: 0.0),
                ),
                hintText: 'ছুটির কারণ ...',
                hintStyle: Styles.hintTextStyle,
              ),
              onChanged: (reason) {
                print('Reason $reason');

                apaEmpLeaveCubit.leaveReason = reason.toString();
              },

            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'কত দিন',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: ColorResources.GREY_NINETY,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              enableSuggestions: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorResources.TEXT_FIELD_COLOR,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                        color: ColorResources.APP_THEME_COLOR,
                        style: BorderStyle.solid,
                        width: 2)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      color:
                      ColorResources.TEXT_FIELD_BORDER_COLOR,
                      width: 0.0),
                ),
                hintText: 'কত দিন ...',
                hintStyle: Styles.hintTextStyle,
              ),
              onChanged: (duration) {
                apaEmpLeaveCubit.leaveDuration = duration;
              },
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'ছুটি ভোগ করণের তারিখ',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: ColorResources.GREY_NINETY,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              enableSuggestions: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorResources.TEXT_FIELD_COLOR,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                        color: ColorResources.APP_THEME_COLOR,
                        style: BorderStyle.solid,
                        width: 2)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      color:
                      ColorResources.TEXT_FIELD_BORDER_COLOR,
                      width: 0.0),
                ),
                hintText: 'ছুটি ভোগ করণের তারিখ ...',
                hintStyle: Styles.hintTextStyle,
              ),
              onChanged: (range) {
                apaEmpLeaveCubit.leaveRange = range;
              },
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'মন্তব্য',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: ColorResources.GREY_NINETY,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              enableSuggestions: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorResources.TEXT_FIELD_COLOR,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                        color: ColorResources.APP_THEME_COLOR,
                        style: BorderStyle.solid,
                        width: 2)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      color:
                      ColorResources.TEXT_FIELD_BORDER_COLOR,
                      width: 0.0),
                ),
                hintText: 'মন্তব্য...',
                hintStyle: Styles.hintTextStyle,
              ),
              onChanged: (comments) {
                apaEmpLeaveCubit.leaveComment = comments;
              },
            ),
          ],
        ),
      ),
    );
  }
}
