part of 'proposed_loan_details_cubit.dart';

abstract class ProposedLoanDetailsState extends Equatable {
  const ProposedLoanDetailsState();

  @override
    List<Object> get props => [];
}

class ProposedLoanDetailsInitialState extends ProposedLoanDetailsState { }

class ProposedLoanDetailsLoadingState extends ProposedLoanDetailsState { }

class ProposedLoanDetailsLoadedState extends ProposedLoanDetailsState {
    final List<ProposedLoanEditData> data;

    ProposedLoanDetailsLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class ProposedLoanDetailsErrorState extends ProposedLoanDetailsState {
    final error;

    ProposedLoanDetailsErrorState(this.error);

    @override
    List<Object> get props => [error];
}
