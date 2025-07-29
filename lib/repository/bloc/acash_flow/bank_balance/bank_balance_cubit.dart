import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/customer_details_edit.dart';
import 'package:equatable/equatable.dart';

import '../../../network/buro_repository.dart';

part 'bank_balance_state.dart';

class BankBalanceCubit extends Cubit<BankBalanceState> {
 // BankBalanceCubit() : super(BankBalanceInitialState());


  final BuroRepository repository;
  //EnterpriseDetailsCubit() : super(EnterpriseDetailsCubit());


  BankBalanceCubit(this.repository) : super(BankBalanceInitialState());



  Future<BankBalanceEdit?> getBankBalance(int customerID) async {

    emit(BankBalanceInitialState());
    try {
    emit(BankBalanceLoadingState());

    var response = await repository.getBankBalance(customerID);

    emit(BankBalanceLoadedState(response.data?? []));

    return response;
     } catch (e) {
       emit(BankBalanceErrorState(e));
       return null;
     }


  }
}
