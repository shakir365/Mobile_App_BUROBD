import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../network/buro_repository.dart';

part 'apa_recom_history_state.dart';

class ApaRecomHistoryCubit extends Cubit<ApaRecomHistoryState> {



  final BuroRepository repository;
  ApaRecomHistoryCubit(this.repository) : super(ApaRecomHistoryInitialState());


  Future<EmpRecomHistory?> getEmpRecomHistory(int qAssignId) async {
    emit(ApaRecomHistoryInitialState());
   // try {
      emit(ApaRecomHistoryLoadingState());
      var response = await repository.getEmpRecomHistory(qAssignId);
      emit(ApaRecomHistoryLoadedState(response));
      return response;
    //} catch (e) {
     // emit(ApaRecomHistoryErrorState(e));
    //}
  }

  Map<int,bool> _checkboxactiveInactiveList = Map();

  Map<int, bool> get checkboxactiveInactiveList => _checkboxactiveInactiveList;

  set checkboxactiveInactiveList(Map<int, bool> value) {
    _checkboxactiveInactiveList = value;
  }

  List<TextEditingController> _controllerList = [];
  List<TextEditingController> _countControllerList = [];
  List<TextEditingController> get countControllerList => _countControllerList;
  set countControllerList(List<TextEditingController> value) {
    _countControllerList = value;
  }

  List<TextEditingController> get controllerList => _controllerList;

  set controllerList(List<TextEditingController> value) {
    _controllerList = value;
  }

  addControllerItem(TextEditingController textEditingController){
    _controllerList.add(textEditingController);
  }


  addCountControllerItem(TextEditingController textEditingController){
    _countControllerList.add(textEditingController);
  }

  addCheckBoxItemWithIndex(int index,bool value){
    _checkboxactiveInactiveList[index] = value;
  }



  List<SubmitRecomItem> _list = [];

  List<SubmitRecomItem> get list => _list;

  set list(List<SubmitRecomItem> value) {
    _list = value;
  }

  void clearList(){
    print(' Clear list called');
    list.clear();
    _controllerList.clear();
    _countControllerList.clear();
  }
  @override
  Future<void> close() {

    return super.close();
  }
}
