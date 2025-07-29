import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/OutputSheet.dart';
import 'package:equatable/equatable.dart';

import '../../../network/buro_repository.dart';

part 'working_capital_requirment_state.dart';

class WorkingCapitalRequirmentCubit extends Cubit<WorkingCapitalRequirmentState> {

  final BuroRepository repository;

  WorkingCapitalRequirmentCubit(this.repository) : super(WorkingCapitalRequirmentInitialState());

  Future<WorkingCapitalRequirementModel?> getWorkingCapitalRequirements(int customerID) async {

    emit(WorkingCapitalRequirmentInitialState());
     try {
    emit(WorkingCapitalRequirmentLoadingState());
    var response = await repository.getWorkingCapitalRequirements(customerID);


    emit(WorkingCapitalRequirmentLoadedState(response.data!));
    return response;
     } catch (e) {
       emit(WorkingCapitalRequirmentErrorState(e));
     }

     return null;
  }
}
