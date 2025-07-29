import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/customer_details_edit.dart';
import 'package:equatable/equatable.dart';

import '../../../network/buro_repository.dart';

part 'personal_expense_monthly_state.dart';

class PersonalExpenseMonthlyCubit extends Cubit<PersonalExpenseMonthlyState> {
  //PersonalExpenseMonthlyCubit() : super(PersonalExpenseMonthlyInitialState());


  final BuroRepository repository;
  //EnterpriseDetailsCubit() : super(EnterpriseDetailsCubit());


  PersonalExpenseMonthlyCubit(this.repository) : super(PersonalExpenseMonthlyInitialState());



  Future<PersonalExpenseMonthlyEdit> getPersonalExpenseDetails(int customerID) async {

    emit(PersonalExpenseMonthlyInitialState());
    // try {
    emit(PersonalExpenseMonthlyLoadingState());

    var response = await repository.getPersonalExpenseDetails(customerID);


    emit(PersonalExpenseMonthlyLoadedState(response.data!));


    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }


  }
}
