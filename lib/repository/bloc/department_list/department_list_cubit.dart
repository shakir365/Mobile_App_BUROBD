import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:equatable/equatable.dart';

import '../../network/buro_repository.dart';

part 'department_list_state.dart';

class DepartmentListCubit extends Cubit<DepartmentListState> {
 // DepartmentListCubit() : super(DepartmentListInitialState());



  final BuroRepository repository;

  DepartmentListCubit(this.repository) : super(DepartmentListInitialState());



  Future<Department> getDepartmentList() async {


    emit(DepartmentListInitialState());
    // try {
    emit(DepartmentListLoadingState());
    var response = await repository.getDepartmentList();
    response.data!.insert(0, DepartmentData(id:0,departmentCode: '00',departmentName: 'Select'));
    _selectDepartment = response.data!.first;
    emit(DepartmentListLoadedState(response.data!));
    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }
  }



  late DepartmentData _selectDepartment  ;

  DepartmentData get selectDepartment => _selectDepartment;

  set selectDepartment(DepartmentData value) {
    _selectDepartment = value;
  }
}
