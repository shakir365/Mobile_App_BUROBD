import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/customer_details_edit.dart';
import 'package:equatable/equatable.dart';

import '../../../network/buro_repository.dart';

part 'personal_reference_verification_state.dart';

class PersonalReferenceVerificationCubit extends Cubit<PersonalReferenceVerificationState> {

  //ProposedLoanDetailsCubit() : super(ProposedLoanDetailsInitialState());


  final BuroRepository repository;
  //EnterpriseDetailsCubit() : super(EnterpriseDetailsCubit());


  PersonalReferenceVerificationCubit(this.repository) : super(PersonalReferenceVerificationInitialState());



  Future<PersonalReferenceEdit> getPersonalReferenceInformation(int customerID) async {

  emit(PersonalReferenceVerificationInitialState());
  // try {
  emit(PersonalReferenceVerificationLoadingState());

  var response = await repository.getPersonalReferenceInformation(customerID);


  emit(PersonalReferenceVerificationLoadedState(response.data!));


  return response;
  // } catch (e) {
  //   emit(AnnualAppraisalErrorState(e));
  // }


  }



}
