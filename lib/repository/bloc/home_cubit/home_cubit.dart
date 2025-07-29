import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/device_info.dart';
import 'package:buro_employee/repository/models/module.dart';
import 'package:buro_employee/repository/network/buro_repository.dart';
import 'package:equatable/equatable.dart';

import '../../models/apply_submit.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BuroRepository repository;

  HomeCubit(this.repository) : super(HomeInitialState());

  Future<Module?> getHomeData() async {
    emit(HomeInitialState());
    try {
      emit(HomeLoadingState());
      var response = await repository.getModule();
      emit(HomeLoadedState(response!));
      return response;
    } catch (e) {
      print('Home ModuleErrorState ${e.toString()}');
      emit(HomeErrorState(e));
    }
  }


  Future<ApplySubmit?> updateDeviceInfo(DeviceInfo deviceInfo) async {

   /* try {*/
      emit(HomeLoadingState());
      var response = await repository.setDeviceInfo(deviceInfo);
      //emit(HomeLoadedState(response!));
      return response;
   /* } catch (e) {
      print('Home ModuleErrorState ${e.toString()}');
      emit(HomeErrorState(e));
    }*/
  }
}
