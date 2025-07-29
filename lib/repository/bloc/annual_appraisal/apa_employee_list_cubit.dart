import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:equatable/equatable.dart';

import '../../network/buro_repository.dart';

part 'apa_employee_list_state.dart';

class AnnualAppraisalCubit extends Cubit<AnnualAppraisalState> {


  final BuroRepository repository;

  AnnualAppraisalCubit(this.repository) : super(AnnualAppraisalInitialState());

  Future<ApaEmployeeList?> getApaEmployeeList(
      int fdesignationId,
      String searchEmpPin,
      int departmentId,
      int branchId,
      int zoneId,
      int  empJobStatus,
      int gradeId,
      int liabilityId,
      int fiscalYear,
      int divisionId,
      int areaId,
      int recomId,
      int recomCount


      ) async {
    emit(AnnualAppraisalInitialState());
   // try {
      emit(AnnualAppraisalLoadingState());
      var response = await repository.getApaEmployeeList(
          fdesignationId,
          searchEmpPin,
          departmentId,
          branchId,
          zoneId,
          empJobStatus,
          gradeId,
          liabilityId,
          fiscalYear,
          divisionId,
          areaId,
          recomId,
          recomCount
      );

     // print('Employee List Count >>>>>>> ${response.data?.length!!}');
      count = response.data?.length!!;
      emit(AnnualAppraisalLoadedState(response));
      return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }
  }



  int? _count = 0;

  int? get count => _count;

  set count(int? value) {
    _count = value;
  }
}
