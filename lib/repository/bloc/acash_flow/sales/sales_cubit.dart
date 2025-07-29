import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/customer_details_edit.dart';
import 'package:equatable/equatable.dart';

import '../../../network/buro_repository.dart';

part 'sales_state.dart';

class SalesCubit extends Cubit<SalesState> {

  final BuroRepository repository;
  //SalesCubit() : super(SalesInitialState());


  SalesCubit(this.repository) : super(SalesInitialState());



  Future<SalesEdit> getSales(int customerID) async {

    emit(SalesInitialState());
    // try {
    emit(SalesLoadingState());

    var response = await repository.getSales(customerID);


    emit(SalesLoadedState(response.data!));


    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }
  }
}
