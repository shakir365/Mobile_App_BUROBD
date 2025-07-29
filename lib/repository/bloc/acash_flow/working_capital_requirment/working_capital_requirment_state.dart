part of 'working_capital_requirment_cubit.dart';

abstract class WorkingCapitalRequirmentState extends Equatable {
  const WorkingCapitalRequirmentState();

  @override
    List<Object> get props => [];
}

class WorkingCapitalRequirmentInitialState extends WorkingCapitalRequirmentState { }

class WorkingCapitalRequirmentLoadingState extends WorkingCapitalRequirmentState { }

class WorkingCapitalRequirmentLoadedState extends WorkingCapitalRequirmentState {
    final List<WorkingCapitalRequirementData> data;

    WorkingCapitalRequirmentLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class WorkingCapitalRequirmentErrorState extends WorkingCapitalRequirmentState {
    final error;

    WorkingCapitalRequirmentErrorState(this.error);

    @override
    List<Object> get props => [error];
}
