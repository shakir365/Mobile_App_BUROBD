import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/module.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../network/buro_repository.dart';

part 'module_state.dart';

class ModuleCubit extends Cubit<ModuleState> {
  final BuroRepository repository;
  final BuildContext context;

  ModuleCubit(this.repository, this.context) : super(ModuleInitial());

  Future<Module?> getModule() async {
    emit(ModuleInitial());
    //try {
      emit(ModuleLoading());
      var response = await repository.getModule();
      emit(ModuleLoaded(response!));
      return response;
    // } catch (e) {
    //   if (e.toString() == 'Authentication failed.') {
    //     emit(ModuleAuthenticationErrorState(e));
    //   } else {
    //     emit(ModuleErrorState(e));
    //   }
    // }
  }

  void getLanguage() async {}
}
