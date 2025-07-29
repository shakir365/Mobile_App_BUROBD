import 'package:flutter/cupertino.dart';

import '../../repository/models/annual_appraisal.dart';
import 'FixedColumWidget.dart';
import 'ScrollableColumnWidget.dart';

class ApaTargetScore extends StatefulWidget {


  ApaTargetScore(this.score,this.inputActive);

  List<EmpTargetData> score;

  int inputActive ;

  @override
  State<ApaTargetScore> createState() => _ApaTargetScoreState();
}

class _ApaTargetScoreState extends State<ApaTargetScore> {
  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        FixedColumnWidgetTarget(widget.score),
        ScrollableColumnWidgetTarget(widget.score,widget.inputActive),
      ],
    );
  }
}