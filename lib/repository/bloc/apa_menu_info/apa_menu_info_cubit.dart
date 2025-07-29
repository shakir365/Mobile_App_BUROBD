import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:equatable/equatable.dart';

import '../../network/buro_repository.dart';

part 'apa_menu_info_state.dart';

class ApaMenuInfoCubit extends Cubit<ApaMenuInfoState> {
  final BuroRepository repository;


  ApaMenuInfoCubit(this.repository) : super(ApaMenuInfoInitialState());


  Future<EmpMenuInformation?> getEmpMenuInfo(GetMenuInfo getMenuInfo) async {

   /* print('YYYYYYY getEmpMenuInfo called');*/

    emit(ApaMenuInfoInitialState());
   // try {
    emit(ApaMenuInfoLoadingState());
    var response = await repository.getEmpMenuInfo(getMenuInfo);
    emit(ApaMenuInfoLoadedState(response));
    return response;
    /*} catch (e) {
    emit(ApaMenuInfoErrorState(e));
    }*/
  }

  void setInitialization (){
    emit(ApaMenuInfoInitialState());
  }

  EmpMenuInfoData? _empMenuInfoData = null;

  EmpMenuInfoData? get empMenuInfoData => _empMenuInfoData;

  set empMenuInfoData(EmpMenuInfoData? value) {
    _empMenuInfoData = value;
  }
}



