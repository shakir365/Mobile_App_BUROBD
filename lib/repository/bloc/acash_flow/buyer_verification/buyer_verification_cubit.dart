import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/customer_details_edit.dart';
import 'package:equatable/equatable.dart';

import '../../../network/buro_repository.dart';

part 'buyer_verification_state.dart';

class BuyerVerificationCubit extends Cubit<BuyerVerificationState> {
 // BuyerVerificationCubit() : super(BuyerVerificationInitialState());



  final BuroRepository repository;
  //EnterpriseDetailsCubit() : super(EnterpriseDetailsCubit());


  BuyerVerificationCubit(this.repository) : super(BuyerVerificationInitialState());



  Future<BuyerInformationEdit> getBuyerVerificationDetails(int customerID) async {


    emit(BuyerVerificationInitialState());
    // try {
    emit(BuyerVerificationLoadingState());
    var response = await repository.getBuyerVerificationDetails(customerID);


    emit(BuyerVerificationLoadedState(response.data!));


    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }
  }


}
