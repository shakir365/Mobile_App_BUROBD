import 'package:buro_employee/repository/models/user_authenticate.dart';
import 'package:buro_employee/repository/network/buro_repository.dart';
import 'package:buro_employee/repository/models/login_user.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginCubit extends Cubit<LoginUser?> {
  BuroRepository buroRepository;

  LoginCubit({required this.buroRepository}) : super(null);

  Future<UserAthenticate> getToken(String username, String password, [BuildContext? contextp] ) async {
    var response = await this.buroRepository.getToken(username, password,contextp);

    return response;
  }

  Future<LoginUser> authenticateWithToken(String token) async {
    var response = await this.buroRepository.authenticateWithToken(token);

    emit(response);

    return response;
  }
}
