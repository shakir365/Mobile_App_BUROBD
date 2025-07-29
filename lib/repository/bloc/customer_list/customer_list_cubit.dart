import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/bloc/acash_flow/customer_details/customer_details_cubit.dart';
import 'package:buro_employee/repository/models/customer_model.dart';
import 'package:equatable/equatable.dart';

import '../../network/buro_repository.dart';

part 'customer_list_state.dart';

class CustomerListCubit extends Cubit<CustomerListState> {
  //CustomerListCubit() : super(CustomerListInitialState());
  final BuroRepository repository;
   bool _hasCustomerInfo = false;
   bool _hasEnterpriseInfo = false;
   bool _hasLoanInfo = false;
   bool _hasSupplierInfo = false;
   bool _hasBuyerInfo = false;
   bool _hasReferenceInfo = false;



  bool get hasEnterpriseInfo => _hasEnterpriseInfo;

  set hasEnterpriseInfo(bool value) {
    _hasEnterpriseInfo = value;
  }



  bool get hasCustomerInfo => _hasCustomerInfo;

  set hasCustomerInfo(bool value) {
    print('hasCustomerInfo ${value}');
    _hasCustomerInfo = value;
    print('hasCustomerInfo ${_hasCustomerInfo}');
  }

  CustomerListCubit(this.repository) : super(CustomerListInitialState());



  Future<CustomerListModel> getCustomerList(String memberID) async {

    //print('getCustomerList  ${memberID}');

    emit(CustomerListInitialState());
    // try {
    emit(CustomerListLoadingState());
    var response = await repository.getCustomerList(memberID);


    emit(CustomerListLoadedState(response.data!));


    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }
  }




  Future<ExistingCustomerInfo?> getExistingCustomerInfo(String customerID) async {


    emit(CustomerListInitialState());
     try {
    emit(CustomerListLoadingState());
    var response = await repository.getExistingCustomerInfo(customerID);

    emit(CustomerDetailLoadedState(response.data!));


    return response;
     } catch (e) {

       emit(CustomerDetailErrorState(e));
     }
  }

  bool get hasLoanInfo => _hasLoanInfo;

  set hasLoanInfo(bool value) {
    _hasLoanInfo = value;
  }

  bool get hasSupplierInfo => _hasSupplierInfo;

  set hasSupplierInfo(bool value) {
    _hasSupplierInfo = value;
  }

  bool get hasBuyerInfo => _hasBuyerInfo;

  set hasBuyerInfo(bool value) {
    _hasBuyerInfo = value;
  }

  bool get hasReferenceInfo => _hasReferenceInfo;

  set hasReferenceInfo(bool value) {
    _hasReferenceInfo = value;
  }
}
