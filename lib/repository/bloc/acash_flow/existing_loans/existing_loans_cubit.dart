import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/customer_details.dart';
import 'package:equatable/equatable.dart';

import '../../../models/customer_details_edit.dart';
import '../../../network/buro_repository.dart';

part 'existing_loans_state.dart';

class ExistingLoansCubit extends Cubit<ExistingLoansState> {
  //ExistingLoansCubit() : super(ExistingLoansInitialState());



  BuroRepository repository;

  ExistingLoansCubit(this.repository) : super(ExistingLoansInitialState());
  final List<ExistingLoan> loanList = [] ;


  addLoan(ExistingLoan existingLoan){

    try {
      loanList.add(existingLoan);
    } on Exception catch (e) {
      print('Try catch exception addLoan $e');
    }


  }


  List<ExistingLoan> getLoanList(){

    //print('getExistingLoan getLoanList called');
    //print('Loan List Length ${loanList.length} loan List   $loanList ');

    try {
      emit(ExistingLoansLoadedState(loanList)) ;
    } on Exception catch (e) {
      print('Try catch exception getLoanList $e');
    }

    return loanList;


  }






  Future<ExistingLoanEdit> getExistingLoan(int customerID) async {

    print('getExistingLoan method called');

    emit(ExistingLoansInitialState());
    // try {
    emit(ExistingLoansLoadingState());
    var response = await repository.getExistingLoan(customerID);


    try {
      emit(ExistingLoansFromAPILoadedState(response.data!));
    } on Exception catch (e) {
      print(e);
    }


    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }
  }



}
