import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../network/buro_repository.dart';

part 'apa_target_score_state.dart';

class ApaTargetScoreCubit extends Cubit<ApaTargetScoreState> {
  final BuroRepository repository;
  ApaTargetScoreCubit(this.repository) : super(ApaTargetScoreInitialState());


  Future<EmpTargetScore?> getEmpTargetScore(int qAssignId, int fiscalYear) async {
    emit(ApaTargetScoreInitialState());
    // try {
      emit(ApaTargetScoreLoadingState());
      var response = await repository.getEmpTargetScore( qAssignId, fiscalYear);
      emit(ApaTargetScoreLoadedState(response));
      return response;
    // } catch (e) {
    //   emit(ApaTargetScoreErrorState(e));
    // }
  }





  Map<int,TextEditingController> _controllerMapTarget = Map<int,TextEditingController>();
  Map<int,TextEditingController> _controllerMapEarned = Map<int,TextEditingController>();
  Map<int,TextEditingController> _controllerMapPercentage = Map<int,TextEditingController>();
  Map<int,TextEditingController> _controllerMapScore = Map<int,TextEditingController>();
  Map<int,TextEditingController> _controllerMapEarnedScore = Map<int,TextEditingController>();
  List<SubmitTargetScoreItem> _list = [];

  List<SubmitTargetScoreItem> get list => _list;

  set list(List<SubmitTargetScoreItem> value) {
    _list = value;
  }

  Map<int, TextEditingController> get controllerMapTarget =>
      _controllerMapTarget;

  set controllerMapTarget(Map<int, TextEditingController> value) {
    _controllerMapTarget = value;
  }
  // addControllerItem(TextEditingController textEditingController){
  //   _scoreControllerList.add(textEditingController);
  // }



  Map<int, TextEditingController> get controllerMapEarned =>
      _controllerMapEarned;

  set controllerMapEarned(Map<int, TextEditingController> value) {
    _controllerMapEarned = value;
  }

  Map<int, TextEditingController> get controllerMapPercentage =>
      _controllerMapPercentage;

  set controllerMapPercentage(Map<int, TextEditingController> value) {
    _controllerMapPercentage = value;
  }

  Map<int, TextEditingController> get controllerMapScore => _controllerMapScore;

  set controllerMapScore(Map<int, TextEditingController> value) {
    _controllerMapScore = value;
  }

  Map<int, TextEditingController> get controllerMapEarnedScore =>
      _controllerMapEarnedScore;

  set controllerMapEarnedScore(Map<int, TextEditingController> value) {
    _controllerMapEarnedScore = value;
  }





  addControllerItemTarget(int Id,TextEditingController textEditingController, ){
    _controllerMapTarget[Id] = textEditingController;
  }
  addControllerItemEarned(int Id,TextEditingController textEditingController, ){
    _controllerMapEarned[Id] = textEditingController;
  }
  addControllerItemPercentage(int Id,TextEditingController textEditingController, ){
    _controllerMapPercentage[Id] = textEditingController;
  }
  addControllerScore(int Id,TextEditingController textEditingController, ){
    _controllerMapScore[Id] = textEditingController;
  }
  addControllerItemEarnedScore(int Id,TextEditingController textEditingController, ){
    _controllerMapEarnedScore[Id] = textEditingController;
  }



  void clearList(){
    list.clear();
    _controllerMapTarget.clear();
    _controllerMapEarned.clear();
    _controllerMapPercentage.clear();
    _controllerMapScore.clear();
    _controllerMapEarnedScore.clear();
    //scoreControllerList.clear();
  }


}
