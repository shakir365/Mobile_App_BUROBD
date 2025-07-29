import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/customer_details_edit.dart';
import 'package:equatable/equatable.dart';

import '../../../network/buro_repository.dart';

part 'proposed_loan_details_state.dart';

class ProposedLoanDetailsCubit extends Cubit<ProposedLoanDetailsState> {
  //ProposedLoanDetailsCubit() : super(ProposedLoanDetailsInitialState());


  final BuroRepository repository;
  //EnterpriseDetailsCubit() : super(EnterpriseDetailsCubit());


  ProposedLoanDetailsCubit(this.repository) : super(ProposedLoanDetailsInitialState());



  Future<ProposedLoanEdit> getProposedLoanDetails(int customerID) async {

    print(' jskdh kjkjhd');
    emit(ProposedLoanDetailsInitialState());
    // try {
    emit(ProposedLoanDetailsLoadingState());

    var response = await repository.getLoanDetails(customerID);
    print(' jskdh kjkjhd 2');

    emit(ProposedLoanDetailsLoadedState(response.data!));


    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }
  }

}
