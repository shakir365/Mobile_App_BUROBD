import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/customer_details_edit.dart';
import 'package:equatable/equatable.dart';

import '../../../network/buro_repository.dart';

part 'supplier_verification_state.dart';

class SupplierVerificationCubit extends Cubit<SupplierVerificationState> {
 // SupplierVerificationCubit() : super(SupplierVerificationInitialState());


  final BuroRepository repository;
  //EnterpriseDetailsCubit() : super(EnterpriseDetailsCubit());


  SupplierVerificationCubit(this.repository) : super(SupplierVerificationInitialState());



  Future<SupplierInformationEdit> getSupplierVerificationDetails(int customerID) async {

    emit(SupplierVerificationInitialState());
    // try {
    emit(SupplierVerificationLoadingState());

    var response = await repository.getSupplierVerificationDetails(customerID);


    emit(SupplierVerificationLoadedState(response.data!));


    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }
  }
}
