import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/OutputSheet.dart';
import 'package:equatable/equatable.dart';

import '../../../network/buro_repository.dart';

part 'house_hold_expenses_state.dart';

class HouseHoldExpensesCubit extends Cubit<HouseHoldExpensesState> {

  final BuroRepository repository;

  HouseHoldExpensesCubit(this.repository) : super(HouseHoldExpensesInitialState());


  Future<HouseHoldExpensesModel?> getHouseholdExpenses(int customerID) async {

    emit(HouseHoldExpensesInitialState());
    try {

    emit(HouseHoldExpensesLoadingState());
    var response = await repository.getHouseholdExpenses(customerID);
    emit(HouseHoldExpensesLoadedState(response.data!));

    return response;
     } catch (e) {
       emit(HouseHoldExpensesErrorState(e));
     }

     return null;
  }
}
