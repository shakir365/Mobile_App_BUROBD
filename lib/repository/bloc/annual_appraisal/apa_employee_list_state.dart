part of 'apa_employee_list_cubit.dart';

abstract class AnnualAppraisalState extends Equatable {
  const AnnualAppraisalState();

  @override
    List<Object> get props => [];
}

class AnnualAppraisalInitialState extends AnnualAppraisalState { }

class AnnualAppraisalLoadingState extends AnnualAppraisalState { }

class AnnualAppraisalLoadedState extends AnnualAppraisalState {

  final ApaEmployeeList apaEmployeeList;

    AnnualAppraisalLoadedState(this.apaEmployeeList);

    @override
    List<Object> get props => [apaEmployeeList];
}

class AnnualAppraisalErrorState extends AnnualAppraisalState {
    final error;

    AnnualAppraisalErrorState(this.error);

    @override
    List<Object> get props => [error];
}

