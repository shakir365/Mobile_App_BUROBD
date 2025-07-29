import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:equatable/equatable.dart';

import '../../network/buro_repository.dart';

part 'apa_supervisor_info_state.dart';

class ApaReceiverInfoCubit extends Cubit<ApaReceiverInfoState> {


  final BuroRepository repository;
  ApaReceiverInfoCubit(this.repository) : super(ApaSupervisorInfoInitialState());


  Future<ApaApprovalPathInfo?> getSuperVisorInfo(GetApprovalPathInfo getApprovalPathInfo) async {
    emit(ApaSupervisorInfoInitialState());
    // try {
    emit(ApaSupervisorInfoLoadingState());
    var response = await repository.getAprvlPathInfo( getApprovalPathInfo);
    /*if(response.data![0].empName != null){
      print('Receiver Info ${response.data![0].empName}');
    } else {*/
      print('Receiver Info  not found');
    /*}*/

    emit(ApaSupervisorInfoLoadedState(response));
    return response;
    //} catch (e) {
    // emit(ApaRecomHistoryErrorState(e));
    //}
  }

  Future<ApaNextPathHistory?> getPathHistory() async {
    emit(ApaSupervisorInfoInitialState());
    // try {
    emit(ApaSupervisorInfoLoadingState());
    var response = await repository.getNextPathHistory( );
    //emit(ApaSupervisorInfoLoadedState(response));
    return response;
    //} catch (e) {
    // emit(ApaRecomHistoryErrorState(e));
    //}
  }



  // Future<ApaEmployeeInfo?> apaGetEmployeeInfo(String empCode) async {
  //   print('apaGetEmployeeInfo called');
  //   emit(ApaGetEmployeeInitialState());
  //   //try {
  //   emit(ApaGetEmployeeLoadingState());
  //   var response = await repository.apaGetEmployeeInfo(empCode);
  //   emit(ApaGetEmployeeLoadedState(response));
  //   return response;
  //   // } catch (e) {
  //   // emit(ApaEmpScoreErrorState(e));
  //   //}
  // }



}
