import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/annual_appraisal.dart';
import '../../network/buro_repository.dart';

part 'emp_sup_cmment_state.dart';

class EmpSupCmmentCubit extends Cubit<EmpSupCmmentState> {



  final BuroRepository repository;

  EmpSupCmmentCubit(this.repository) : super(EmpSupCmmentInitialState());

  Future<ApaSupervisorComment?> getSuperComment(var qAssignId) async {
    emit(EmpSupCmmentInitialState());
    try {
      emit(EmpSupCmmentInitialState());
      var response = await repository.getEmpSupComment(qAssignId);
      emit(EmpSupCmmentLoadedState(response));
      return response;
    } catch (e) {
      emit(EmpSupCmmentErrorState(e));
    }
  }

  String _supervisorComment ='';

  String get supervisorComment => _supervisorComment;

  set supervisorComment(String value) {
    _supervisorComment = value;
  }

  void clearSuperComment(){
    supervisorComment = '';
  }
}
