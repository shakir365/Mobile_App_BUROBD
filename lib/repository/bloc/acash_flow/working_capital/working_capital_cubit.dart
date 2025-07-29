import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/OutputSheet.dart';
import 'package:equatable/equatable.dart';

import '../../../network/buro_repository.dart';

part 'working_capital_state.dart';

class WorkingCapitalCubit extends Cubit<WorkingCapitalState> {

  final BuroRepository repository;

  WorkingCapitalCubit(this.repository) : super(WorkingCapitalInitialState());

  Future<WorkingCapitalModel?> getWorkingCapital(int customerID) async {

    emit(WorkingCapitalInitialState());
     try {
    emit(WorkingCapitalLoadingState());
    var response = await repository.getWorkingCapital(customerID);


    emit(WorkingCapitalLoadedState(response.data!));
    return response;
     } catch (e) {
       emit(WorkingCapitalErrorState(e));
     }
     return null;
  }







}
