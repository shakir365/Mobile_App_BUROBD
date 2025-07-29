import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:equatable/equatable.dart';

import '../../network/buro_repository.dart';

part 'apa_get_employee_state.dart';

class ApaGetEmployeeCubit extends Cubit<ApaGetEmployeeState> {



  final BuroRepository repository;

  ApaGetEmployeeCubit(this.repository) : super(ApaGetEmployeeInitialState());


  Future<ApaEmployeeInfo?> apaGetEmployeeInfo(String empCode) async {
    emit(ApaGetEmployeeInitialState());
    //try {
    emit(ApaGetEmployeeLoadingState());
    var response = await repository.apaGetEmployeeInfo(empCode);
    emit(ApaGetEmployeeLoadedState(response));
    return response;
    // } catch (e) {
    // emit(ApaEmpScoreErrorState(e));
    //}
  }

  void setInitialState(){
    emit(ApaGetEmployeeInitialState());
  }
}
