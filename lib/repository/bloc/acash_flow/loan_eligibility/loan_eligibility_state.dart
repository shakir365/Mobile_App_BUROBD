part of 'loan_eligibility_cubit.dart';

abstract class LoanEligibilityState extends Equatable {
  const LoanEligibilityState();

  @override
    List<Object> get props => [];
}

class LoanEligibilityInitialState extends LoanEligibilityState { }

class LoanEligibilityLoadingState extends LoanEligibilityState { }

class LoanEligibilityLoadedState extends LoanEligibilityState {
    final List<LoanEligibilityData> data;

    LoanEligibilityLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class LoanEligibilityErrorState extends LoanEligibilityState {
    final error;

    LoanEligibilityErrorState(this.error);

    @override
    List<Object> get props => [error];
}
