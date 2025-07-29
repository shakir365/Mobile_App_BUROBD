
import 'package:flutter/material.dart';

import '../../repository/models/annual_appraisal.dart';

class FixedColumnWidget extends StatelessWidget {
  FixedColumnWidget(this.score);

  List<EmpScoreData> score;

  @override
  Widget build(BuildContext context) {

    var questionList = [];

    score.forEach((element) {
     // print('Element $element');
      questionList.add(element.description);
    });

    return DataTable(
      columnSpacing: 1,
      showBottomBorder: true,
      headingRowColor: MaterialStateProperty.all(Colors.green[300]),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
      ),
      columns: [
        DataColumn(label: Text('মূল্যায়নের\nক্ষেত্রঃ')),
      ],
      rows: [
        ...questionList.map((question) => DataRow(
              cells: [
                DataCell(
                  SizedBox(
                    width: 100,
                    child: Text(
                      '${question}',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 10),
                      softWrap: true,

                      //maxLines: 10,
                    ),
                  ),

                ),
              ],
            ))
      ],
    );
  }
}

class FixedColumnWidgetTarget extends StatelessWidget {
  FixedColumnWidgetTarget(this.score);

 final List<EmpTargetData> score;

  @override
  Widget build(BuildContext context) {
    var questionList = [];

    score.forEach((element) {

      questionList.add(element.aDescriptionBn);
    });

    return DataTable(
      columnSpacing: 1,
      showBottomBorder: true,
      headingRowColor: MaterialStateProperty.all(Colors.green[300]),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      columns: [
        DataColumn(
            label: SizedBox(
              width: 70,
              child: Text(
          'বিবরণ',
          style: TextStyle(),
        ),
            )),
      ],
      rows: [
        ...questionList.map((team) => DataRow(
              cells: [
                DataCell(
                  SizedBox(
                    width: 70,
                    child: Text(
                      '${team}',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 10),
                      softWrap: true,
                      //maxLines: 10,
                    ),
                  ),


                ),
              ],
            ))
      ],
    );
  }
}

class FixedColumnWidgetHRScore extends StatelessWidget {
  FixedColumnWidgetHRScore(this.heading);

  var heading = [];

  @override
  Widget build(BuildContext context) {

    return DataTable(
      columnSpacing: 2,
      showBottomBorder: true,
      headingRowColor: MaterialStateProperty.all(Colors.green[300]),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
      ),
      columns: [
        DataColumn(label: Text('বিবরণ')),
      ],
      rows: [
        ...heading.map((team) => DataRow(
              cells: [
                DataCell(Container(
                  width: 100,
                  child: Text(
                    '${team}',
                    softWrap: true,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black,fontSize: 10),
                  ),
                )),
              ],
            ))
      ],
    );
  }
}

class FixedColumnWidgetRecomScore extends StatelessWidget {
  FixedColumnWidgetRecomScore(this.recomList);

  final List<RecomHisData> recomList;

  @override
  Widget build(BuildContext context) {
    var questionList = [];

    recomList.forEach((element) {

      questionList.add(element.recomDescriptionBn);
    });

    return DataTable(
      columnSpacing: 1,
      showBottomBorder: true,
      headingRowColor: MaterialStateProperty.all(Colors.green[300]),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
      ),
      columns: [
        DataColumn(label: Text('সুপারিশ')),
      ],
      rows: [
        ...questionList.map((team) => DataRow(
              cells: [
                DataCell(Container(
                  width: 100,
                 // height: 150,
                  child: Text(
                    '${team}',
                    softWrap: true,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black,fontSize: 10),
                  ),
                )),
              ],
            ))
      ],
    );
  }
}
