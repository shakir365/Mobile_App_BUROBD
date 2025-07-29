import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../network/buro_repository.dart';

part 'apa_emp_score_state.dart';

class ApaEmpScoreCubit extends Cubit<ApaEmpScoreState> {


  final BuroRepository repository;

  ApaEmpScoreCubit(this.repository) : super(ApaEmpScoreInitialState());


  Future<ApaEmpScore?> getApaEmpScore(GetEmpScore getEmpScore) async {
    emit(ApaEmpScoreInitialState());
    //try {
      emit(ApaEmpScoreLoadingState());
      var response = await repository.getApaEmpScore(getEmpScore);
      emit(ApaEmpScoreLoadedState(response));
      return response;
   // } catch (e) {
     // emit(ApaEmpScoreErrorState(e));
    //}
  }
  List<SubmitScoreItem> _list = [];

  Map<int,TextEditingController> _controllerMap = Map<int,TextEditingController>();

  Map<int,TextEditingController> get  controllerMap => _controllerMap;

  set controllerMap(value) {
    _controllerMap = value;
  }

  addControllerItem(int Id,TextEditingController textEditingController, ){
     _controllerMap[Id] = textEditingController;
   }




  List<SubmitScoreItem> get list => _list;

  set list(List<SubmitScoreItem> value) {
    _list = value;
  }
  // addControllerItem(TextEditingController textEditingController){
  //   _scoreControllerList.add(textEditingController);
  // }








  void clearList(){
    list.clear();
    _controllerMap.clear();
    //scoreControllerList.clear();
  }
  @override
  Future<void> close() {

    return super.close();
  }



}
