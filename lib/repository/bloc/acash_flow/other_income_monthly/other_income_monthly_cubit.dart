import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/customer_details_edit.dart';
import 'package:equatable/equatable.dart';

import '../../../network/buro_repository.dart';

part 'other_income_monthly_state.dart';

class OtherIncomeMonthlyCubit extends Cubit<OtherIncomeMonthlyState> {
  //OtherIncomeMonthlyCubit() : super(OtherIncomeMonthlyInitialState());

  final BuroRepository repository;
  //EnterpriseDetailsCubit() : super(EnterpriseDetailsCubit());


  OtherIncomeMonthlyCubit(this.repository) : super(OtherIncomeMonthlyInitialState());



  Future<OtherIncomeMonthlyEdit> getOtherIncomeMonthly(int customerID) async {

    emit(OtherIncomeMonthlyInitialState());
    // try {
    emit(OtherIncomeMonthlyLoadingState());

    var response = await repository.getOtherIncomeMonthly(customerID);


    emit(OtherIncomeMonthlyLoadedState(response.data));


    return response;
    /* } catch (e) {
       emit(OtherIncomeMonthlyErrorState(e));
       return null;
     }*/


  }




}
