import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/customer_model.dart';
import '../../../network/buro_repository.dart';

part 'customer_details_state.dart';

class CustomerDetailsCubit extends Cubit<CustomerDetailsState> {

  final BuroRepository repository;

  CustomerDetailsCubit(this.repository) : super(CustomerDetailsInitialState());



  Future<ExistingCustomerInfo?> getExistingCustomerInfo(String customerID) async {


    emit(CustomerDetailsInitialState());
  /*  try {*/
      emit(CustomerDetailsLoadingState());
      var response = await repository.getExistingCustomerInfo(customerID);

      if(response.success == true){
        emit(CustomerDetailsLoadedState(response.data!));
      } else {
        emit(CustomerDetailsErrorState('No data found'));
      }



      return response;
    /*} catch (e) {

      emit(CustomerDetailsErrorState(e));
    }*/
  }



  @override
  void emit(CustomerDetailsState state) {
    // TODO: implement emit
    super.emit(state);
  }




}
