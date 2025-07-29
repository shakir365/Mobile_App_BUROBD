import 'package:buro_employee/repository/models/employee_general_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../network/buro_repository.dart';


part 'emp_general_info_state.dart';

class EmpGeneralInfoCubit extends Cubit<EmpGeneralInfoState> {

  final BuroRepository repository;

  EmpGeneralInfoCubit(this.repository) : super(EmpGeneralInfoState());

  Future<EmpGeneralInfoListModel?> getEmpGeneralInfo(GeneralInfoSearchFilterModel generalInfoFilter) async {
    emit(EmpGeneralInfoInitialState());

    emit(EmpGeneralInfoLoadingState());
    var response = await repository.getEmpGeneralInfo(generalInfoFilter);
    count = response.data?.length!!;
    emit(EmpGeneralInfoLoadedState(response));
    return response;

  }



  int? _count = 0;

  int? get count => _count;

  set count(int? value) {
    _count = value;
  }




}




