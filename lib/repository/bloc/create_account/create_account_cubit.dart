import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/change_pass_model.dart';
import 'package:buro_employee/repository/network/buro_repository.dart';
import 'package:equatable/equatable.dart';

import '../../models/employee_general_info.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  final BuroRepository repository;
  CreateAccountCubit(this.repository) : super(CreateAccountInitialState());


  Future<ChangePasswordModel?> submitChangePass( String pin, String mobileOTP,String newPass, String confirmPass) async {

    print('Submit Change pass called');

    emit(CreateAccountInitialState());
    try {
      emit(CreateAccountLoadingState());
      var response = await repository.changePasswordForRegistration( pin, mobileOTP,newPass, confirmPass);
      //emit(CreateAccountLoadedState(response));
      return response;


    } catch (e) {
      print('Home ModuleErrorState ${e.toString()}');
      emit(CreateAccountErrorState(e));
    }
  }


  Future<EmpGeneralInfoListModel?> getEmpInfoRegistration( String pin) async {

    print('Submit Change pass called');

    emit(CreateAccountInitialState());
    try {
      emit(CreateAccountLoadingState());
      var response = await repository.getEmpGeneralInfoForRegistration( pin);
      emit(CreateAccountLoadedState(response));
      return response;


    } catch (e) {
      print('Home ModuleErrorState ${e.toString()}');
      emit(CreateAccountErrorState(e));
    }
  }




}
