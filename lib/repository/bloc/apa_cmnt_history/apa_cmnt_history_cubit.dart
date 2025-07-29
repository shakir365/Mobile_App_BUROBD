import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:equatable/equatable.dart';

import '../../network/buro_repository.dart';

part 'apa_cmnt_history_state.dart';

class ApaCmntHistoryCubit extends Cubit<ApaCmntHistoryState> {

  final BuroRepository repository;

  ApaCmntHistoryCubit(this.repository) : super(ApaCmntHistoryInitialState());

  Future<EmpCommentHistory?> getEmpCmntHistory(int qAssignId) async {
    emit(ApaCmntHistoryInitialState());
    //try {
      emit(ApaCmntHistoryInitialState());
      var response = await repository.getEmpCmntHistory(qAssignId);
      emit(ApaCmntHistoryLoadedState(response));
      return response;
    //} catch (e) {
     // emit(ApaCmntHistoryErrorState(e));
   // }

  }


  String _comment = '';

  String get comment => _comment;

  set comment(String value) {
    _comment = value;
  }

  void clearComment(){
    _comment = '';
  }
}
