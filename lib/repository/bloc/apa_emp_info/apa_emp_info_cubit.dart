import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:equatable/equatable.dart';

import '../../network/buro_repository.dart';

part 'apa_emp_info_state.dart';

class ApaEmpInfoCubit extends Cubit<ApaEmpInfoState> {

  final BuroRepository repository;

  ApaEmpInfoCubit(this.repository) : super(ApaEmpInfoInitialState());

  Future<ApaEmpBasicinfo?> getApaBasicInfo(String empPin, int fiscalYear) async {
    emit(ApaEmpInfoInitialState());


  // try {
      emit(ApaEmpInfoLoadingState());
      var response = await repository.getApaEmpBasicInfo(empPin,fiscalYear);

      emit(ApaEmpInfoLoadedState(response));
      return response;
   /* } catch (e) {
      emit(ApaEmpInfoErrorState(e));
    }*/
  }

  void getApaPathSetInfo(int qSetId) async {
    //emit(ApaEmpInfoInitialState());



      //emit(ApaEmpInfoLoadingState());
      var response = await repository.getApprovalPathSetInfo(qSetId);

      approvalPathSet = response;

      //emit(ApaEmpInfoLoadedState(response));
      //return response;

  }


  void setInitialization (){
    emit(ApaEmpInfoInitialState());
  }

  var _empCode ;
  ApprovalPathSet? _approvalPathSet = null;

  ApprovalPathSet? get approvalPathSet => _approvalPathSet;

  set approvalPathSet(ApprovalPathSet? value) {
    _approvalPathSet = value;
  }

  get empCode => _empCode;

  set empCode(value) {
    _empCode = value;
  }
}
