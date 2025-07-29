import 'dart:io';
import 'dart:typed_data';

import 'package:buro_employee/localization/Language/languages.dart';
import 'package:buro_employee/repository/bloc/bill_req_list_cubit/bill_req_list_cubit.dart';
import 'package:buro_employee/repository/models/bill_download_info.dart';
import 'package:buro_employee/theme/colors.dart';
import 'package:buro_employee/theme/styles.dart';
import 'package:buro_employee/utilities/common_methods.dart';
import 'package:buro_employee/views/field_visit/field_visit_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:number_to_words/number_to_words.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'bill_submit.dart';

class BillReqList extends StatefulWidget {
  static const routeName = '/acceptedRequestList';

  //const BillSubmit({Key? key}) : super(key: key);
  static route() => MaterialPageRoute(builder: (_) => BillReqList());

  @override
  _BillReqListState createState() => _BillReqListState();
}

class _BillReqListState extends State<BillReqList> {
  late BillReqListCubit bloc;
  var selectedLang;
  var source;
  var downloadStatus = false;
  late ByteData imageData;

  late Map<int, bool> checkBoxList = Map();
  late Map<int, bool> selectedCheckBoxList = Map();
  late Map<int, int> applicationIDList = Map();

  int index = 0;

  @override
  void initState() {
    //checkBoxList[index] = false;
    CommonMethods.getSelectedLang().then(
        (value) => {selectedLang = value, print('Selecetdlang $selectedLang')});

    rootBundle
        .load('assets/buro_launcher_icon.png')
        .then((data) => setState(() => this.imageData = data));
    bloc = context.read<BillReqListCubit>();

    bloc.getBillReqList().then((value) => {
          value!.data.forEach((element) {
            checkBoxList[index] = false;
            index++;
          })
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorResources.APP_THEME_COLOR,
            iconTheme: IconThemeData(color: ColorResources.WHITE),
            title: Center(
                child: Text(
              Languages.of(context)!.acceptedListHeaderText,
              style: Styles.appBarTextStyle,
            )),
            actions: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: OutlinedButton(
                      onPressed: () {
                        //print('Selected items ${applicationIDList}');

                        if (applicationIDList.isNotEmpty) {
                          String result =
                              mapToCommaSeparatedString(applicationIDList);
                          //print(result);
                          showLoaderDialog(context);

                          bloc.getBillDownloadInfo(result)
                              .then((value) => generateBill(value!)
                                  //print(value)

                                  );
                        } else
                          CommonMethods.showMessage(
                              context, 'Please, Select an item', Colors.red);
                      },
                      child: Row(
                        children: [

                          Text('Print', style: Styles.appBarTextStyle),
                          Icon(
                            Icons.download_rounded,
                            color: ColorResources.ACCEPT_COLOR_BACKGROUND,
                          ),
                        ],
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.only(right: 15, left: 10),
                        side: BorderSide(
                            width: .5,
                            color: ColorResources.APP_THEME_COLOR),
                        // Border color and width
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // Optional: rounded corners
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          body: BlocConsumer<BillReqListCubit, BillReqListState>(
            listener: (context, state) {
              if (state is BillReqListErrorState) {
                final snackBar = SnackBar(
                  content: Text(Languages.of(context)!.internetErrorText),
                  backgroundColor: Colors.red,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                // Scaffold.of(context)
              }
            },
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              if (state is BillReqListInitialState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is BillReqListLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is BillReqListLoadedState) {
                var billreqList = state.billRequest.data;

                //print('billreqList ${billreqList.length}');
                //print('CheckBoxList ${checkBoxList.length}');
                return billreqList.isNotEmpty
                    ? RefreshIndicator(
                        onRefresh: refresh,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: billreqList.length,
                            itemBuilder: (context, index) {
                              var item = billreqList[index];
                              String formattedStartDate =
                                  DateFormat.yMMMMd('en_US')
                                      .format(DateTime.parse(item.startDate));
                              String formattedEndDate =
                                  DateFormat.yMMMMd('en_US')
                                      .format(DateTime.parse(item.endDate));
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 25, right: 25, top: 20, bottom: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorResources.WHITE,
                                    border: Border.all(
                                        color: ColorResources.LIST_BORDER_WHITE,
                                        width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(
                                      10,
                                    )),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0,
                                        right: 16,
                                        top: 14,
                                        bottom: 16),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child: Wrap(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Flexible(
                                                                  child: Text(
                                                                    '${item.applicationID} - $formattedStartDate to $formattedEndDate',
                                                                    style: Styles
                                                                        .listHeaderTextStyle,
                                                                  ),
                                                                  flex: 3,
                                                                ),
                                                                Flexible(
                                                                  flex: 1,
                                                                  child: Checkbox(
                                                                      value: checkBoxList[index],
                                                                      onChanged: (bool? newValue) {
                                                                        setState(
                                                                            () {
                                                                          checkBoxList[index] =
                                                                              newValue!;

                                                                          if (newValue) {
                                                                            applicationIDList[index] =
                                                                                item.applicationID;
                                                                          } else {
                                                                            if (index ==
                                                                                0) {
                                                                              applicationIDList.remove(index);
                                                                            } else {
                                                                              applicationIDList.remove(index);
                                                                            }
                                                                          }

                                                                          //print('applicationIDList $applicationIDList');
                                                                        });
                                                                      }),
                                                                )
                                                              ],
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.place,
                                                                  size: 18,
                                                                  color: ColorResources
                                                                      .GREY_DARK_SIXTY,
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    '${item.places} ',
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines: 1,
                                                                    softWrap:
                                                                        false,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .watch_later_outlined,
                                                                  size: 18,
                                                                  color: ColorResources
                                                                      .GREY_DARK_SIXTY,
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  'Status : ${item.approvalStatus}',
                                                                  style: Styles
                                                                      .mediumTextStyle,
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .payment_outlined,
                                                                  size: 18,
                                                                  color: ColorResources
                                                                      .GREY_DARK_SIXTY,
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      'Payment Status : ',
                                                                      style: Styles
                                                                          .mediumTextStyle,
                                                                    ),
                                                                    Text(
                                                                      item.billPaymentStatus ==
                                                                              "1"
                                                                          ? 'Pending'
                                                                          : item.billPaymentStatus == "2"
                                                                              ? 'Paid'
                                                                              : item.billPaymentStatus == "3"
                                                                                  ? 'Rejected'
                                                                                  : 'Pending',
                                                                      // Fallback in case of an unexpected value
                                                                      style: Styles
                                                                          .paymentTextStyle,
                                                                    )
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                flex: 7,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10,
                                                            right: 10,
                                                            left: 10),
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        elevation: 0,
                                                        backgroundColor:
                                                            ColorResources
                                                                .GREY_THIRTY,
                                                        // minimumSize: const Size.fromHeight(50), // NEW
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                            context,
                                                            BillSubmit
                                                                .routeName,
                                                            arguments: item
                                                                .applicationID);
                                                      },
                                                      child: Container(
                                                        height: 42,
                                                        child: Center(
                                                          child: Text(
                                                            Languages.of(
                                                                    context)!
                                                                .editBillText,
                                                            style: Styles
                                                                .editBillButtonTextStyle,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  flex: 1,
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10, right: 10),
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        elevation: 0,
                                                        backgroundColor:
                                                            ColorResources
                                                                .DOWNLOAD_BUTTON_COLOR,
                                                        // minimumSize: const Size.fromHeight(50), // NEW
                                                      ),
                                                      onPressed: () {
                                                        showLoaderDialog(
                                                            context);
                                                        bloc
                                                            .getBillDownloadInfo(
                                                                "${item.applicationID}")
                                                            .then((value) =>
                                                                    generateBill(
                                                                        value!)
                                                                //print(value)

                                                                );
                                                      },
                                                      child: Container(
                                                        height: 42,
                                                        child: Center(
                                                          child: Text(
                                                            Languages.of(
                                                                    context)!
                                                                .downloadBillText,
                                                            style: Styles
                                                                .downBillButtonTextStyle,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  flex: 1,
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    : Center(
                        child: Text(Languages.of(context)!.noDataFound),
                      );
              } else {
                // (state is WeatherError)
                return Center(
                  child: Container(
                    child: Text('Network Error'),
                  ),
                );
              }
            },
          )),
    );
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Downloading...")),
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

  Future<bool> _willPopCallback() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => FieldVisitMain()));
    return true;
  }

  Future refresh() {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        bloc = context.read<BillReqListCubit>();
        bloc.getBillReqList();
      },
    );
  }

  Future<void> generateBill(BillDownloadInfo info) async {
    /*final PdfDocument document = PdfDocument();
    document.pageSettings.size = PdfPageSize.a4;
    document.pageSettings.orientation = PdfPageOrientation.landscape;
    final PdfBitmap image = PdfBitmap(imageData.buffer.asUint8List());
    final PdfPage page = document.pages.add();
    final Size pageSize = page.getClientSize();

    print('Page Size ${document.pages.count}');

    // Another Footer---------------

    var now = DateTime.now();
    var formatterDate = DateFormat('dd-MM-yy');
    var formatterTime = DateFormat('hh:mm a');
    String actualDate = formatterDate.format(now);
    String actualTime = formatterTime.format(now);

    String footerContent2 =
        '''Developed By : BURO Bangladesh ICT-Department ''';
    String footerContent1 =
        '''Print Date : ${actualDate.toString()} ${actualTime.toString()} ''';

    //Create a PDF page template and add footer content.
    final PdfPageTemplateElement footerTemplate =
        PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50));
    final PdfPageTemplateElement footerTemplate2 =
        PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50));
//Draw text in the footer.
    footerTemplate.graphics.drawString('Submitted By',
        PdfStandardFont(PdfFontFamily.helvetica, 7, style: PdfFontStyle.bold),
        bounds: const Rect.fromLTWH(30, 15, 200, 20));
    footerTemplate.graphics.drawString('Supervised By',
        PdfStandardFont(PdfFontFamily.helvetica, 7, style: PdfFontStyle.bold),
        bounds: const Rect.fromLTWH(160, 15, 200, 20));
    footerTemplate.graphics.drawString('Checked By',
        PdfStandardFont(PdfFontFamily.helvetica, 7, style: PdfFontStyle.bold),
        bounds: const Rect.fromLTWH(290, 15, 200, 20));
    footerTemplate.graphics.drawString('Approved By',
        PdfStandardFont(PdfFontFamily.helvetica, 7, style: PdfFontStyle.bold),
        bounds: const Rect.fromLTWH(430, 15, 200, 20));
    footerTemplate.graphics.drawString(
        footerContent1, PdfStandardFont(PdfFontFamily.helvetica, 5),
        bounds: const Rect.fromLTWH(0, 40, 200, 20));

    footerTemplate.graphics.drawString(footerContent2,
        PdfStandardFont(PdfFontFamily.helvetica, 5, style: PdfFontStyle.bold),
        bounds: const Rect.fromLTWH(160, 40, 200, 20));

    //Create the page number field
    PdfPageNumberField pageNumber = PdfPageNumberField(
        font: PdfStandardFont(PdfFontFamily.timesRoman, 19),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)));

//Sets the number style for page number
    pageNumber.numberStyle = PdfNumberStyle.numeric;

//Create the page count field
    PdfPageCountField count = PdfPageCountField(
        font: PdfStandardFont(PdfFontFamily.timesRoman, 19),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)));



    page.graphics.drawImage(image, Rect.fromLTWH(0, 0, 70, 70));

    final PdfGrid grid = getGrid(info);
    final PdfLayoutResult result = drawHeader(page, pageSize, grid, info);
    drawGrid(page, grid, result, info);*/
    //drawFooter(page, pageSize);
    // -----------------New Code Start---------------------------
    var now = DateTime.now();
    var formatterDate = DateFormat('dd-MM-yy');
    var formatterTime = DateFormat('hh:mm a');
    String actualDate = formatterDate.format(now);
    String actualTime = formatterTime.format(now);
    String footerContentTwo =
    '''Developed By : BURO Bangladesh ICT-Department ''';
    String footerContentOne =
    '''Print Date : ${actualDate.toString()} ${actualTime.toString()} ''';
    final PdfDocument document = PdfDocument();
    // Set the page size and orientation
    document.pageSettings.size = PdfPageSize.a4;
    document.pageSettings.orientation = PdfPageOrientation.landscape;

    // Header Template
    final PdfPageTemplateElement headerTemplate =
    PdfPageTemplateElement(Rect.fromLTWH(0, 0, document.pageSettings.size.width, 50));


    final PdfPageTemplateElement headerTemplateInfo =
    PdfPageTemplateElement(Rect.fromLTWH(100, headerTemplate.height + 10, 200, 200));



    final PdfBitmap image = PdfBitmap(imageData.buffer.asUint8List());
    final PdfPage page = document.pages.add();
    final Size pageSize = page.getClientSize();



    headerTemplate.graphics.drawString('BURO Bangladesh',
        PdfStandardFont(PdfFontFamily.timesRoman, 10, style: PdfFontStyle.bold),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(350, -40, pageSize.width - 115, 90),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    headerTemplate.graphics.drawString(
        'Form No - 45',
        PdfStandardFont(PdfFontFamily.timesRoman,6,),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(800, -40, pageSize.width - 115, 90),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    // Draw image at the top of the first page
    page.graphics.drawImage(image, Rect.fromLTWH(0,0,0,0));
    //page.graphics.setClip()


    headerTemplate.graphics.drawString(
        'Branch : ${info.data[0].siteCode} - ${info.data[0].siteName}',
        PdfStandardFont(PdfFontFamily.timesRoman, 10),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(330, -25, pageSize.width - 115, 90),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));


    headerTemplate.graphics.drawString('Daily Bill Form',
        PdfStandardFont(PdfFontFamily.timesRoman, 8.5, style: PdfFontStyle.bold),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(360, -10, pageSize.width - 115, 90),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));


    headerTemplateInfo.graphics.drawString('Daily Bill Form',
        PdfStandardFont(PdfFontFamily.timesRoman, 8.5, style: PdfFontStyle.bold),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(360, -10, pageSize.width - 115, 90),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

   /* headerTemplate.graphics.drawString('lksklskfsnfnvmcm',
        PdfStandardFont(PdfFontFamily.helvetica, 8.5, style: PdfFontStyle.bold),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(360, -1, pageSize.width - 130, 90),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));*/

    document.template.top = headerTemplate;
   /* document.template.top = headerTemplateInfo;*/
    var footerHeight = 50; // Set according to footer's height
   var availableHeight = pageSize.height - footerHeight;
    // Footer Template
    final PdfPageTemplateElement footerTemplate =
    PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50));


    footerTemplate.graphics.drawString('Submitted By',
        PdfStandardFont(PdfFontFamily.timesRoman, 7, style: PdfFontStyle.bold),
        bounds: const Rect.fromLTWH(30, 15, 200, 20));
    footerTemplate.graphics.drawString('Supervised By',
        PdfStandardFont(PdfFontFamily.timesRoman, 7, style: PdfFontStyle.bold),
        bounds: const Rect.fromLTWH(160, 15, 200, 20));
    footerTemplate.graphics.drawString('Checked By',
        PdfStandardFont(PdfFontFamily.timesRoman, 7, style: PdfFontStyle.bold),
        bounds: const Rect.fromLTWH(290, 15, 200, 20));
    footerTemplate.graphics.drawString('Approved By',
        PdfStandardFont(PdfFontFamily.timesRoman, 7, style: PdfFontStyle.bold),
        bounds: const Rect.fromLTWH(430, 15, 200, 20));
    footerTemplate.graphics.drawString(
        footerContentOne, PdfStandardFont(PdfFontFamily.timesRoman, 5),
        bounds: const Rect.fromLTWH(0, 40, 200, 20));

    footerTemplate.graphics.drawString(footerContentTwo,
        PdfStandardFont(PdfFontFamily.timesRoman, 5, style: PdfFontStyle.bold),
        bounds: const Rect.fromLTWH(160, 40, 200, 20));
    final PdfGrid grid = getGrid(info);
    // Add footer to document template so it appears on all pages
    document.template.bottom = footerTemplate;
    // Generate grid and add other content

    final PdfLayoutResult result = drawHeader(page, pageSize, grid, info);


    drawGrid(page, grid, result, info);



    //---------------------------New COde End-----------------------------------



    final List<int> bytes = document.saveSync();

    var externalStorageDirPath = await getTemporaryDirectory();
    var path = externalStorageDirPath.path;
    //print('Path $path');
    var bytesNew = Uint8List.fromList(bytes);
    var file = File("$path/Report.pdf");

    file.writeAsBytes(bytesNew);
    var message = await OpenFilex.open("$path/Report.pdf");
    Navigator.pop(context);
  }

  Future<void> deleteFile(File file) async {
    try {
      if (await file.exists()) {
        print('Yes File Exist ${file.exists()}');

        file.exists().then((value) => {
              print('Is File Exist $value'),
              file.delete().whenComplete(() => {print('File Deleted')}),
            });
      } else {
        print('No File not Exist');
      }
    } catch (e) {
      print('File Error ${e.toString()}');
    }
  }

  String mapToCommaSeparatedString(Map<int, int> map) {
    return map.entries.map((entry) => '${entry.value}').join(',');
  }

  PdfLayoutResult drawHeader(
    PdfPage page,
    Size pageSize,
    PdfGrid grid,
    BillDownloadInfo info,
  ) {
    page.graphics.drawString('Name - ${info.data[0].employeeName}',
        PdfStandardFont(PdfFontFamily.timesRoman, 10),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(90, 25, pageSize.width - 115, 90),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('Pin : ${info.data[0].employeeCode}',
        PdfStandardFont(PdfFontFamily.timesRoman, 10),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(260, 25, pageSize.width - 115, 90),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString('Designation - ${info.data[0].designationName}',
        PdfStandardFont(PdfFontFamily.timesRoman, 10),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(330, 25, pageSize.width - 115, 90),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
    page.graphics.drawString(
        'Work Station : ${info.data[0].siteCode} - ${info.data[0].siteName}',
        PdfStandardFont(PdfFontFamily.timesRoman, 10),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(550, 25, pageSize.width - 115, 90),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.timesRoman, 5);

    final DateFormat format = DateFormat.yMMMMd('en_US');
    final String invoiceNumber =
        'Invoice Number: 2058557939\r\n\r\nDate: ${format.format(DateTime.now())}';
    final Size contentSize = contentFont.measureString(invoiceNumber);


    return PdfTextElement(font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(30, 65, pageSize.width - (contentSize.width + 30),
            pageSize.height - 150))!;

  }






  void drawGrid(
      PdfPage page, PdfGrid grid, PdfLayoutResult result, BillDownloadInfo) {

    /// New Code Start --------------

    // Define the grid layout settings
    grid.style = PdfGridStyle(
        cellPadding: PdfPaddings(left: 1, right: 1, top: 1, bottom: 1),
        font: PdfStandardFont(PdfFontFamily.timesRoman, 8),
        cellSpacing: 0);

    // Loop through each row and set the border explicitly
    for (int i = 0; i < grid.rows.count; i++) {
      for (int j = 0; j < grid.columns.count; j++) {
        grid.rows[i].cells[j].style.borders = PdfBorders(
          left: PdfPen(PdfColor(0, 0, 0), width: 0.5),
          top: PdfPen(PdfColor(0, 0, 0), width: 0.5),
          right: PdfPen(PdfColor(0, 0, 0), width: 0.5),
          bottom: PdfPen(PdfColor(0, 0, 0), width: 0.5),
        );
      }
    }

    // Draw the grid on the page

    /// New Code End

 /*   Rect? totalPriceCellBounds;
    Rect? quantityCellBounds;
    //Invoke the beginCellLayout event.
    grid.beginCellLayout = (Object sender, PdfGridBeginCellLayoutArgs args) {
      final PdfGrid grid = sender as PdfGrid;
      if (args.cellIndex == grid.columns.count - 1) {
        totalPriceCellBounds = args.bounds;
      } else if (args.cellIndex == grid.columns.count - 2) {
        quantityCellBounds = args.bounds;
      }
    };*/



    /* PdfLayoutFormat layoutFormat = PdfLayoutFormat(layoutType: PdfLayoutType.paginate);
    grid.draw(
      page: page,
      bounds: Rect.fromLTWH(
          0, result.bounds.bottom + 10, page.getClientSize().width, page.getClientSize().height),
      format: layoutFormat,
    );*/

    PdfLayoutFormat format = PdfLayoutFormat(
        layoutType: PdfLayoutType.paginate);

    result = grid.draw(
        page: page,
        bounds: Rect.fromLTWH(0, result.bounds.bottom + 20, 0, page.getClientSize().height+100),
        format: format)!;
  }

  PdfGrid getGrid(BillDownloadInfo info) {
    final PdfGrid grid = PdfGrid();

    grid.style = PdfGridStyle(
        cellPadding: PdfPaddings(left: 0, right: 0, top: 10, bottom: 0),
        cellSpacing: 0,
        font: PdfStandardFont(
            PdfFontFamily.timesRoman, 7)); //Here is the text Size

    grid.columns.add(count: 16);

    final PdfGridRow headerRow = grid.headers.add(1)[0];
    headerRow.style.textBrush = PdfBrushes.black;
    headerRow.style = PdfGridRowStyle(
        font: PdfStandardFont(PdfFontFamily.timesRoman, 7,
            style: PdfFontStyle.bold));
    headerRow.cells[0].value = 'Bill ID';
    headerRow.cells[1].value = 'Date';
    headerRow.cells[2].value = 'Visit Start';
    headerRow.cells[4].value = 'Visit End';
    headerRow.cells[6].value = 'Reason';
    headerRow.cells[7].value = 'Transport';
    headerRow.cells[9].value = 'Food & Accommodation';
    headerRow.cells[13].value = 'Daily Allowance';
    headerRow.cells[14].value = 'Special Allowance';
    headerRow.cells[15].value = 'Total';

    headerRow.cells[14].stringFormat.lineAlignment =
        PdfVerticalAlignment.middle;
    headerRow.cells[0].stringFormat.lineAlignment = PdfVerticalAlignment.middle;
    headerRow.cells[1].stringFormat.lineAlignment = PdfVerticalAlignment.middle;
    headerRow.cells[1].stringFormat.alignment = PdfTextAlignment.center;
    headerRow.cells[2].stringFormat.lineAlignment = PdfVerticalAlignment.middle;
    headerRow.cells[4].stringFormat.lineAlignment = PdfVerticalAlignment.middle;
    headerRow.cells[6].stringFormat.lineAlignment = PdfVerticalAlignment.middle;
    headerRow.cells[7].stringFormat.lineAlignment = PdfVerticalAlignment.middle;
    headerRow.cells[9].stringFormat.lineAlignment = PdfVerticalAlignment.middle;
    headerRow.cells[13].stringFormat.lineAlignment =
        PdfVerticalAlignment.middle;
    headerRow.cells[15].stringFormat.lineAlignment =
        PdfVerticalAlignment.middle;

    var row = grid.rows.add();

    row.cells[2].stringFormat.alignment = PdfTextAlignment.center;
    row.cells[3].stringFormat.alignment = PdfTextAlignment.center;
    row.cells[4].stringFormat.alignment = PdfTextAlignment.center;
    row.cells[5].stringFormat.alignment = PdfTextAlignment.center;
    row.cells[7].stringFormat.alignment = PdfTextAlignment.center;
    row.cells[8].stringFormat.alignment = PdfTextAlignment.center;
    row.cells[9].stringFormat.alignment = PdfTextAlignment.center;
    row.cells[10].stringFormat.alignment = PdfTextAlignment.center;
    row.cells[11].stringFormat.alignment = PdfTextAlignment.center;
    row.cells[12].stringFormat.alignment = PdfTextAlignment.center;

    row.cells[2].value = 'Time';
    row.cells[3].value = 'Place';
    row.cells[4].value = 'Time';
    row.cells[5].value = 'Place';
    row.cells[7].value = 'Type';
    row.cells[8].value = 'Fare';
    row.cells[9].value = 'Morning';
    row.cells[10].value = 'Afternoon';
    row.cells[11].value = 'Night';
    row.cells[12].value = 'Hotel';

    row.cells[2].style = PdfGridCellStyle(font: PdfStandardFont(PdfFontFamily.timesRoman, 7, style: PdfFontStyle.bold));
    row.cells[3].style = PdfGridCellStyle(font: PdfStandardFont(PdfFontFamily.timesRoman, 7, style: PdfFontStyle.bold));
    row.cells[4].style = PdfGridCellStyle(font: PdfStandardFont(PdfFontFamily.timesRoman, 7, style: PdfFontStyle.bold));
    row.cells[5].style = PdfGridCellStyle(font: PdfStandardFont(PdfFontFamily.timesRoman, 7, style: PdfFontStyle.bold));
    row.cells[7].style = PdfGridCellStyle(font: PdfStandardFont(PdfFontFamily.timesRoman, 7, style: PdfFontStyle.bold));
    row.cells[8].style = PdfGridCellStyle(font: PdfStandardFont(PdfFontFamily.timesRoman, 7, style: PdfFontStyle.bold));
    row.cells[9].style = PdfGridCellStyle(font: PdfStandardFont(PdfFontFamily.timesRoman, 7, style: PdfFontStyle.bold));
    row.cells[10].style = PdfGridCellStyle(font: PdfStandardFont(PdfFontFamily.timesRoman, 7, style: PdfFontStyle.bold));
    row.cells[11].style = PdfGridCellStyle(font: PdfStandardFont(PdfFontFamily.timesRoman, 7, style: PdfFontStyle.bold));
    row.cells[12].style = PdfGridCellStyle(font: PdfStandardFont(PdfFontFamily.timesRoman, 7, style: PdfFontStyle.bold));

    headerRow.cells[2].stringFormat.lineAlignment = PdfVerticalAlignment.middle;
    headerRow.cells[3].stringFormat.lineAlignment = PdfVerticalAlignment.middle;
    headerRow.cells[4].stringFormat.lineAlignment = PdfVerticalAlignment.middle;
    headerRow.cells[5].stringFormat.lineAlignment = PdfVerticalAlignment.middle;
    headerRow.cells[8].stringFormat.lineAlignment = PdfVerticalAlignment.middle;
    headerRow.cells[9].stringFormat.lineAlignment = PdfVerticalAlignment.middle;
    headerRow.cells[10].stringFormat.lineAlignment = PdfVerticalAlignment.middle;
    headerRow.cells[11].stringFormat.lineAlignment = PdfVerticalAlignment.middle;
    headerRow.cells[12].stringFormat.lineAlignment = PdfVerticalAlignment.middle;
    headerRow.cells[7].stringFormat.lineAlignment = PdfVerticalAlignment.middle;

    var transportTotal = 0;
    var morningTotal = 0;
    var eveingTotal = 0;
    var nightTotal = 0;
    var hotelTotal = 0;
    var dailyTotal = 0;
    var specialTotal = 0;
    var totalTotal = 0;

    int previousApplicationID = -1;
    info.data.asMap().forEach((key, value) {
      var row = grid.rows.add();

      bool isSameApplicationID = value.applicationid == previousApplicationID;

      // Center-align cells in this row
      for (int i = 0; i < row.cells.count; i++) {
        row.cells[i].stringFormat.alignment = PdfTextAlignment.center;
        row.cells[i].stringFormat.lineAlignment = PdfVerticalAlignment.middle;
      }

      if (!isSameApplicationID) {
        // Set values and row span for the new applicationID
        /* row.cells[0].value = "${value.applicationid}";*/
        row.cells[0].value =
            "${value.billPaymentStatus == "1" ? '${value.applicationid}' : value.billPaymentStatus == "2" ? '${value.applicationid} - Paid' : value.billPaymentStatus == "3" ? '${value.applicationid}' : '${value.applicationid}'}";
        row.cells[0].rowSpan = info.data
            .where((v) => v.applicationid == value.applicationid)
            .length;
      }

      row.cells[0].stringFormat.alignment = PdfTextAlignment.center;
      row.cells[1].stringFormat.alignment = PdfTextAlignment.center;
      row.cells[2].stringFormat.alignment = PdfTextAlignment.center;
      row.cells[3].stringFormat.alignment = PdfTextAlignment.center;
      row.cells[4].stringFormat.alignment = PdfTextAlignment.center;
      row.cells[5].stringFormat.alignment = PdfTextAlignment.center;
      row.cells[6].stringFormat.alignment = PdfTextAlignment.center;
      row.cells[7].stringFormat.alignment = PdfTextAlignment.center;
      row.cells[8].stringFormat.alignment = PdfTextAlignment.center;
      row.cells[9].stringFormat.alignment = PdfTextAlignment.center;
      row.cells[10].stringFormat.alignment = PdfTextAlignment.center;
      row.cells[11].stringFormat.alignment = PdfTextAlignment.center;
      row.cells[12].stringFormat.alignment = PdfTextAlignment.center;
      row.cells[13].stringFormat.alignment = PdfTextAlignment.center;
      row.cells[14].stringFormat.alignment = PdfTextAlignment.center;
      row.cells[15].stringFormat.alignment = PdfTextAlignment.center;

      row.cells[1].value = value.startDate;
      DateTime parsedTimeStart = DateFormat("HH:mm").parse(value.startTimePart);
      DateTime parsedTimeEnd = DateFormat("HH:mm").parse(value.endTimePart);
      String formattedTimeStart = DateFormat('hh:mm a').format(parsedTimeStart);
      String formattedTimeEnd = DateFormat('hh:mm a').format(parsedTimeEnd);
      row.cells[2].value = formattedTimeStart;
      row.cells[3].value = value.fromplace;
      row.cells[4].value = formattedTimeEnd;
      row.cells[5].value = value.toplace;
      row.cells[6].value = value.reason;
      row.cells[7].value = value.transportby == null ? '' : value.transportby;
      row.cells[8].value =
          value.transport > 0 ? value.transport.toString() : '';
      row.cells[9].value = value.morning > 0 ? value.morning.toString() : '';
      row.cells[10].value = value.evening > 0 ? value.evening.toString() : '';
      row.cells[11].value = value.night > 0 ? value.night.toString() : '';
      row.cells[12].value = value.hotel > 0 ? value.hotel.toString() : '';
      row.cells[13].value =
          value.dailyBill > 0 ? value.dailyBill.toString() : '';
      row.cells[14].value =
          value.specialBill > 0 ? value.specialBill.toString() : '';
      row.cells[15].value = value.total > 0 ? value.total.toString() : '';

      transportTotal += value.transport;
      morningTotal += value.morning;
      eveingTotal += value.evening;
      nightTotal += value.night;
      hotelTotal += value.hotel;
      dailyTotal += value.dailyBill;
      specialTotal += value.specialBill;
      totalTotal += value.total;

      previousApplicationID = value.applicationid;
    });

    final PdfGridRow row4 = grid.rows.add();

    row4.cells[1].value = 'Total';
    row4.cells[2].value = '';
    row4.cells[3].value = '';
    row4.cells[4].value = '';
    row4.cells[5].value = '';
    row4.cells[6].value = '';
    row4.cells[7].value = '';
    row4.cells[8].value =
        transportTotal > 0 ? transportTotal.toString() : ''; // Transport Total
    row4.cells[9].value =
        morningTotal > 0 ? morningTotal.toString() : ''; //morning total
    row4.cells[10].value =
        eveingTotal > 0 ? eveingTotal.toString() : ''; //evening total
    row4.cells[11].value =
        nightTotal > 0 ? nightTotal.toString() : ''; //Night total
    row4.cells[12].value =
        hotelTotal > 0 ? hotelTotal.toString() : ''; //Hotel Total
    row4.cells[13].value =
        dailyTotal > 0 ? dailyTotal.toString() : ''; // daily Total
    row4.cells[14].value =
        specialTotal > 0 ? specialTotal.toString() : ''; //special Total
    row4.cells[15].value =
        totalTotal > 0 ? totalTotal.toString() : ''; // total total
    row4.cells[1].columnSpan = 7;

    row4.cells[2].stringFormat.alignment = PdfTextAlignment.center;
    row4.cells[3].stringFormat.alignment = PdfTextAlignment.center;
    row4.cells[4].stringFormat.alignment = PdfTextAlignment.center;
    row4.cells[5].stringFormat.alignment = PdfTextAlignment.center;
    row4.cells[6].stringFormat.alignment = PdfTextAlignment.center;
    row4.cells[7].stringFormat.alignment = PdfTextAlignment.center;
    row4.cells[8].stringFormat.alignment = PdfTextAlignment.center;
    row4.cells[9].stringFormat.alignment = PdfTextAlignment.center;
    row4.cells[10].stringFormat.alignment = PdfTextAlignment.center;
    row4.cells[11].stringFormat.alignment = PdfTextAlignment.center;
    row4.cells[12].stringFormat.alignment = PdfTextAlignment.center;
    row4.cells[13].stringFormat.alignment = PdfTextAlignment.center;
    row4.cells[14].stringFormat.alignment = PdfTextAlignment.center;
    row4.cells[15].stringFormat.alignment = PdfTextAlignment.center;

    final PdfGridRow row5 = grid.rows.add();

    var totalInwords = NumberToWord().convert('en-in', totalTotal);

    row5.cells[1].columnSpan = 15;
    row5.cells[1].stringFormat.alignment = PdfTextAlignment.left;
    row5.cells[1].value = 'In Word : $totalInwords taka only';
    headerRow.cells[2].columnSpan = 2;
    headerRow.cells[4].columnSpan = 2;
    headerRow.cells[9].columnSpan = 4;
    headerRow.cells[7].columnSpan = 2;

    grid.columns[0].width = 50; //Bill-Id
    grid.columns[1].width = 37; //Date
    grid.columns[2].width = 45; //Start Time
    grid.columns[4].width = 45; //End Time
    grid.columns[8].width = 35; //Transport Fare
    grid.columns[9].width = 35; //Morning
    grid.columns[10].width = 35; //Evening
    grid.columns[11].width = 25; //Night
    grid.columns[12].width = 25; //Hotel
    grid.columns[13].width = 35; // Daily Allowance
    grid.columns[14].width = 35; // Special Allowance
    grid.columns[15].width = 30; //Total
    //grid.columns[16].width = 50; //Bill-Id

    //grid.columns[5].width = 80;
    for (int i = 0; i < headerRow.cells.count; i++) {
      headerRow.cells[i].style.cellPadding =
          PdfPaddings(bottom: 1, left: 1, right: 1, top: 1);
      headerRow.cells[i].stringFormat.alignment = PdfTextAlignment.center;
    }
    for (int i = 0; i < grid.rows.count; i++) {
      final PdfGridRow row = grid.rows[i];
      for (int j = 0; j < row.cells.count; j++) {
        final PdfGridCell cell = row.cells[j];
        if (j == 0) {
          //cell.stringFormat.alignment = PdfTextAlignment.center;
        }
        cell.style.cellPadding =
            PdfPaddings(bottom: 1, left: 1, right: 1, top: 1);
      }
    }
    return grid;
  }
}
