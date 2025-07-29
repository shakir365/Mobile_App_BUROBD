import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/customer_details_edit.dart';
import '../../../network/buro_repository.dart';

part 'regular_investment_state.dart';

class RegularInvestmentCubit extends Cubit<RegularInvestmentState> {

  final BuroRepository repository;

  RegularInvestmentCubit(this.repository) : super(RegularInvestmentInitialState());



  Future<RegularInvestmentEdit> getRegularInvestment(int customerID) async {


    emit(RegularInvestmentInitialState());
    // try {
    emit(RegularInvestmentLoadingState());
    var response = await repository.getRegularInvestment(customerID);


    emit(RegularInvestmentLoadedState(response.data));


    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }
  }



}
