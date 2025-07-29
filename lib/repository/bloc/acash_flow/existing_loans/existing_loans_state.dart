part of 'existing_loans_cubit.dart';

abstract class ExistingLoansState extends Equatable {
  const ExistingLoansState();

  @override
    List<Object> get props => [];
}

class ExistingLoansInitialState extends ExistingLoansState { }

class ExistingLoansLoadingState extends ExistingLoansState {

}

class ExistingLoansLoadedState extends ExistingLoansState {
    final List<ExistingLoan> data;

    ExistingLoansLoadedState(this.data);

    @override
    List<Object> get props => [data];
}
class ExistingLoansFromAPILoadedState extends ExistingLoansState {
    final List<ExistingLoanEditData> data;

    ExistingLoansFromAPILoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class ExistingLoansErrorState extends ExistingLoansState {
    final error;

    ExistingLoansErrorState(this.error);

    @override
    List<Object> get props => [error];
}
