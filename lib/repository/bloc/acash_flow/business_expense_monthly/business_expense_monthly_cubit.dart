import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/customer_details_edit.dart';
import 'package:equatable/equatable.dart';

import '../../../network/buro_repository.dart';

part 'business_expense_monthly_state.dart';

class BusinessExpenseMonthlyCubit extends Cubit<BusinessExpenseMonthlyState> {
  //BusinessExpenseMonthlyCubit() : super(BusinessExpenseMonthlyInitialState());


  final BuroRepository repository;
  //EnterpriseDetailsCubit() : super(EnterpriseDetailsCubit());


  BusinessExpenseMonthlyCubit(this.repository) : super(BusinessExpenseMonthlyInitialState());



  Future<BusinessExpenseMonthlyEdit?> getBusinessExpenseMonthly(int customerID) async {

    emit(BusinessExpenseMonthlyInitialState());
     try {
    emit(BusinessExpenseMonthlyLoadingState());

    var response = await repository.getBusinessExpenseMonthly(customerID);


    emit(BusinessExpenseMonthlyLoadedState(response.data!));


    return response;
     } catch (e) {
       emit(BusinessExpenseMonthlyErrorState(e));
     }


  }
}
