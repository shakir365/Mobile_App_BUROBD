import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/customer_details_edit.dart';
import 'package:equatable/equatable.dart';

import '../../../network/buro_repository.dart';

part 'enterprise_details_state.dart';

class EnterpriseDetailsCubit extends Cubit<EnterpriseDetailsState> {

  final BuroRepository repository;
  //EnterpriseDetailsCubit() : super(EnterpriseDetailsCubit());


  EnterpriseDetailsCubit(this.repository) : super(EnterpriseDetailsInitialState());



  Future<EnterpriseListEdit> getEnterpriseDetails(int customerID) async {


    emit(EnterpriseDetailsInitialState());
    // try {
    emit(EnterpriseDetailsLoadingState());
    var response = await repository.getEnterpriseDetails(customerID);

    emit(EnterpriseDetailsLoadedState(response.data!));


    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }
  }


}
