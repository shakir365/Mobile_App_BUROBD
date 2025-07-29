import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/customer_details_edit.dart';
import '../../../network/buro_repository.dart';

part 'purchases_state.dart';

class PurchasesCubit extends Cubit<PurchasesState> {
  final BuroRepository repository;



  PurchasesCubit(this.repository) : super(PurchasesInitialState());



  Future<PurchaseEdit> getPurchaseDetails(int customerID) async {

    emit(PurchasesInitialState());

    emit(PurchasesLoadingState());

    var response = await repository.getPurchaseDetails(customerID);


    emit(PurchasesLoadedState(response.data));


    return response;



  }
}
