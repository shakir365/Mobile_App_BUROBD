import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:equatable/equatable.dart';

import '../../network/buro_repository.dart';

part 'apa_emp_leave_state.dart';

class ApaEmpLeaveCubit extends Cubit<ApaEmpLeaveState> {


  final BuroRepository repository;

  ApaEmpLeaveCubit(this.repository) : super(ApaEmpLeaveInitialState());

  Future<EmpLeaveHistory?> getEmpLeaveInfo(int qAssignId) async {
    emit(ApaEmpLeaveInitialState());
    //try {
      emit(ApaEmpLeaveLoadingState());
      var response = await repository.getEmpLeaveInfo(qAssignId);
      emit(ApaEmpLeaveLoadedState(response));
      return response;
    //} catch (e) {
    //  emit(ApaEmpLeaveErrorState(e));
    //}
  }



  Future<ApaSubmit?> submitLeaveInfo(SubmitLeaveInfo submitLeaveInfo) async {
   // emit(ApaEmpLeaveInitialState());
    //try {
   // emit(ApaEmpLeaveLoadingState());
    var response = await repository.apaSubmitLeaveInfo(submitLeaveInfo);
    //emit(ApaEmpLeaveLoadedState(response));
    return response;
    //} catch (e) {
    //  emit(ApaEmpLeaveErrorState(e));
    //}
  }

   String _leaveDuration = '';
  String _leaveRange = '' ;
  String _leaveComment = '' ;
   String _leaveReason = '' ;

  get leaveReason => _leaveReason;

  set leaveReason(value) {
    _leaveReason = value;
  }



  get leaveDuration => _leaveDuration;

  set leaveDuration(value) {
    _leaveDuration = value;
  }

  get leaveRange => _leaveRange;

  set leaveRange(value) {
    _leaveRange = value;
  }

  get leaveComment => _leaveComment;

  set leaveComment(value) {
    _leaveComment = value;
  }

  void clear (){

    leaveReason = '';
    leaveDuration = '';
    leaveRange = '';
    leaveComment = '';
  }


}
