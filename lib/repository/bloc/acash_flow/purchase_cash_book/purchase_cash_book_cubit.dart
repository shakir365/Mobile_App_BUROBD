import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/customer_details_edit.dart';
import 'package:equatable/equatable.dart';

import '../../../network/buro_repository.dart';

part 'purchase_cash_book_state.dart';

class PurchaseCashBookCubit extends Cubit<PurchaseCashBookState> {
  //PurchaseCashBookCubit() : super(PurchaseCashBookInitialState());


  final BuroRepository repository;
  //EnterpriseDetailsCubit() : super(EnterpriseDetailsCubit());


  PurchaseCashBookCubit(this.repository) : super(PurchaseCashBookInitialState());



  Future<PurchaseCashbookEdit> getPurchaseCashBook(int customerID) async {

    emit(PurchaseCashBookInitialState());
    // try {
    emit(PurchaseCashBookLoadingState());

    var response = await repository.getPurchaseCashBook(customerID);


    emit(PurchaseCashBookLoadedState(response.data!));


    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }


  }


}
