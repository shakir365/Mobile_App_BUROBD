import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/OutputSheet.dart';
import 'package:buro_employee/repository/network/buro_repository.dart';
import 'package:equatable/equatable.dart';

part 'loan_eligibility_state.dart';

class LoanEligibilityCubit extends Cubit<LoanEligibilityState> {

  final BuroRepository repository;
  LoanEligibilityCubit(this.repository) : super(LoanEligibilityInitialState());

  Future<LoanEligibilityModel?> getLoanEligibility(int customerID) async {

    emit(LoanEligibilityInitialState());
     try {
    emit(LoanEligibilityLoadingState());
    var response = await repository.getLoanEligibilityRecord(customerID);


    emit(LoanEligibilityLoadedState(response.data!));
    return response;

     } catch (e) {
       emit(LoanEligibilityErrorState(e));
     }
     return null;


  }


}
