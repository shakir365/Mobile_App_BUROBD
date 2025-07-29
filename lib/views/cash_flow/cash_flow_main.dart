import 'package:buro_employee/repository/models/customer_details.dart';
import 'package:buro_employee/views/cash_flow/customer_details.dart';
import 'package:buro_employee/views/cash_flow/customer_list.dart';
import 'package:buro_employee/views/cash_flow/input_sheet.dart';
import 'package:buro_employee/views/cash_flow/output_sheet.dart';
import 'package:flutter/material.dart';

import '../../localization/Language/languages.dart';
import '../../sessionmanager/session_manager.dart';
import '../../theme/colors.dart';
import '../../theme/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utilities/analytics.dart';
import '../../utilities/asset_paths.dart';

class CashFlowMain extends StatefulWidget {
  static const String routeName = '/cashFlowMain';

  final CustomerDetailsArguments arguments;

  const CashFlowMain(this.arguments, {Key? key}) : super(key: key);

  @override
  _CashFlowMainState createState() => _CashFlowMainState();
}

class _CashFlowMainState extends State<CashFlowMain> {
  List<String> listItem = <String>[
    'Customer Details',
    'Input Sheet',
    'Output Sheet'
  ];

  var leaveIconList = [
    assetsPath.LEAVE_APPLY_ICON,
    assetsPath.LEAVE_AUTHORIZATION_ICON,
    assetsPath.LEAVE_REQUEST_ICON,
  ];

  @override
  Widget build(BuildContext context) {
    print('Cash Flow Main isEditable ${widget.arguments.isEditable}');

    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          iconTheme: IconThemeData(color: ColorResources.WHITE),
          backgroundColor: ColorResources.APP_THEME_COLOR,
          title: Center(
            child: Text(
              '${widget.arguments.name} Cash Flow Analysis',
              style: Styles.appBarTextStyle,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 24, left: 12, right: 12),
          child: Container(
            color: ColorResources.PAGE_BACKGROUND,
            child: ListView.builder(
              itemCount: listItem.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListTile(
                    title: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: ColorResources.WHITE,
                        border: Border.all(
                            color: ColorResources.LIST_BORDER_WHITE, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(
                          10,
                        )),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: SvgPicture.asset(leaveIconList[index]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${listItem[index]}',
                            style: Styles.menuListItemStyle,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      // selectedItem = subModuleList[index].subModuleId;

                      // print('Selected ITEm $selectedItem');

                      if (index == 0) {
                        Navigator.pushNamed(context, CustomerDetails.routeName,
                            arguments: widget.arguments);
                      }

                      if (index == 1) {
                        Navigator.pushNamed(context, InputSheet.routeName,
                            arguments: widget.arguments);
                      }

                      if (index == 2) {
                        Navigator.pushNamed(context, OutputSheet.routeName,
                            arguments: widget.arguments);
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _willPopCallback() async {
    Navigator.pushNamed(
      context,
      CustomerList.routeName,
    );
    return true;
  }

  @override
  void initState() {
    print('cash flow main ${widget.arguments.isEditable}');

    //print('In Session customerID cash_flow_main ${sessionManager.customerID}');

    super.initState();
  }

  @override
  void dispose() {
    sessionManager.clearCustomerId();

    //print('In Session customerID in Dispose clear customerID');
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    analytics.setCurrentScreen('Cash Flow Main page ', 'StatefulWidget');
  }
}
