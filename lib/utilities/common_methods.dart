import 'dart:ui';
import 'package:buro_employee/sessionmanager/session_manager.dart';
import 'package:buro_employee/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'asset_paths.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonMethods {

  static var log = 'EMPLOYEE';

  static void showMessage(BuildContext context, String message, Color color) {

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
      ),
      backgroundColor: color,
    ));
  }

  static Future<String> getSelectedLang() async {
    return await sessionManager.selectedLang;
  }

  static Future<bool> getLoginStatus() async {
    return await sessionManager.isLoggedIn;
  }

  static Widget topBanner(double width) {
    /*return Container(
      //height: 350.0,
      decoration: new BoxDecoration(
        color: ColorResources.APP_THEME_COLOR,
        borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(
              width, )),
      ),
      child: Center(child: SvgPicture.asset(
          assetsPath.BURO_WHITE_ICON


      ),),

    );*/

    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        height: 350.0,
        color: ColorResources.APP_THEME_COLOR,
        child: Center(
          child: SvgPicture.asset(assetsPath.BURO_WHITE_ICON),
        ),
      ),
    );
  }

  static showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Connecting...")),
        ],
      ),
    );

    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static loaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );

    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  static void hideLoaderDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop(); // Close the dialog
  }
  static Widget getStatus(String activityName) {
    switch (activityName) {
      case "Pending":
        return Container(
          decoration: BoxDecoration(
            color: ColorResources.PENDING_COLOR,
            borderRadius: BorderRadius.all(Radius.circular(
              6,
            )),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 13, right: 13, top: 5, bottom: 5),
            child: Text('${activityName}',
                style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: ColorResources.BLACK)),
          ),
        );
      case "Approved":
        return Container(
          decoration: BoxDecoration(
            color: ColorResources.APPROVE_COLOR,
            borderRadius: BorderRadius.all(Radius.circular(
              6,
            )),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 13, right: 13, top: 5, bottom: 5),
            child: Text(
              '${activityName}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: ColorResources.WHITE),
            ),
          ),
        );
      case "Rejected":
        return Container(
          decoration: BoxDecoration(
            color: ColorResources.REJECT_COLOR,
            borderRadius: BorderRadius.all(Radius.circular(
              6,
            )),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 13, right: 13, top: 5, bottom: 5),
            child: Text(
              '${activityName}',
              style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: ColorResources.WHITE),
            ),
          ),
        );

      case "Partially Approved":
        return Container(
          decoration: BoxDecoration(
            color: ColorResources.PARTIALLY_APPROVE_COLOR,
            borderRadius: BorderRadius.all(Radius.circular(
              6,
            )),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 13, right: 13, top: 5, bottom: 5),
            child: Text(
              'Partially...',
              maxLines: 2,
              textAlign: TextAlign.start,
              style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: ColorResources.WHITE),
            ),
          ),
        );
      default:
        {
          print("Invalid choice");
        }
        return Container();
        break;
    }
  }

  static Widget emptyListDropDownView(){
    return TextFormField(
      enabled: false,
      decoration: InputDecoration(
          filled: true,
          fillColor: ColorResources.TEXT_FIELD_COLOR,
          contentPadding: EdgeInsets.only(
              left: 10.0, right: 5.0, top: 16.0, bottom: 16.0),
          hintStyle: TextStyle(color: ColorResources.GREY_SEVENTY),
          errorStyle: TextStyle(color: Colors.redAccent, fontSize: 13.0),
          hintText: 'Select District',
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: ColorResources.GREY_FOURTY, // Change this to the desired focused border color
              width: 1,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: ColorResources.GREY_FOURTY, // Border color when not focused
              width: 1,

            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: ColorResources.GREY_FOURTY, // Change this to the desired enabled border color
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.red, // Change this to the desired error border color
              width: 2,
            ),
          ),
          suffixIcon: Icon(Icons.arrow_drop_down_sharp)
      ),
    );

  }

  /*static showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Connecting...")),
        ],
      ),
    );

    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }*/


   static void makePhoneCall(String phoneNumber) async {
    final Uri url = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(url)) {
      await launchUrl(url,mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }


}

//https://medium.com/icnh/adding-a-gap-to-flutter-e4277715b6a5
//https://romain-rastel.medium.com/gap-a-simple-example-to-create-your-own-renderobject-88eacca2a4

/*class Gap extends SingleChildRenderObjectWidget {
  const Gap({required Key key, this.size = 16})
      : assert(size != null),
        super(key: key);

  final double size;

  @override
  RenderGap createRenderObject(BuildContext context) {
    return RenderGap(size);
  }

  @override
  void updateRenderObject(BuildContext context, RenderGap renderObject) {
    renderObject.gapSize = size;
  }

  static var small = Gap(size: 8, key: null,);
  static const medium = Gap(size: 16);
  static const large = Gap(size: 32);
}

class RenderGap extends RenderBox {
  RenderGap(this._gapSize);

  double _gapSize;
  double get gapSize => _gapSize;
  set gapSize(double gapSize) {
    if (_gapSize != gapSize) {
      _gapSize = gapSize;
      markNeedsLayout();
    }
  }

  @override
  void performLayout() {
    final parent = this.parent;
    if (parent is RenderFlex) {
      if (parent.direction == Axis.horizontal) {
        size = constraints.constrain(Size(_gapSize, 0));
      } else {
        size = constraints.constrain(Size(0, _gapSize));
      }
    } else {
      throw FlutterError('Gap must be used inside a Flex widget');
    }
  }

  @override
  double computeMinIntrinsicWidth(double width) {
    final parent = this.parent;
    if (parent is RenderFlex && parent.direction == Axis.horizontal) {
      return gapSize;
    }
    return super.computeMinIntrinsicWidth(width);
  }

  @override
  double computeMaxIntrinsicWidth(double width) {
    return computeMinIntrinsicWidth(width);
  }

  @override
  double computeMinIntrinsicHeight(double height) {
    final parent = this.parent;
    if (parent is RenderFlex && parent.direction == Axis.vertical) {
      return gapSize;
    }
    return super.computeMinIntrinsicHeight(height);
  }

  @override
  double computeMaxIntrinsicHeight(double height) {
    return computeMaxIntrinsicHeight(height);
  }
}*/

