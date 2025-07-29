import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/customer_details_edit.dart';
import 'package:equatable/equatable.dart';

import '../../../network/buro_repository.dart';

part 'stock_state.dart';

class StockCubit extends Cubit<StockState> {
  //StockCubit() : super(StockInitialState());

  final BuroRepository repository;
  //EnterpriseDetailsCubit() : super(EnterpriseDetailsCubit());


  StockCubit(this.repository) : super(StockInitialState());



  Future<StockEdit> getStockDetails(int customerID) async {

    emit(StockInitialState());
    // try {
    emit(StockLoadingState());

    var response = await repository.getStockDetails(customerID);


    emit(StockLoadedState(response.data!));

    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }


  }
}
