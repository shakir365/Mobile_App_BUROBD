part of 'working_capital_cubit.dart';

abstract class WorkingCapitalState extends Equatable {
  const WorkingCapitalState();

  @override
    List<Object> get props => [];
}

class WorkingCapitalInitialState extends WorkingCapitalState { }

class WorkingCapitalLoadingState extends WorkingCapitalState { }

class WorkingCapitalLoadedState extends WorkingCapitalState {
    final List<WorkingCapitalData> data;

    WorkingCapitalLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class WorkingCapitalErrorState extends WorkingCapitalState {
    final error;

    WorkingCapitalErrorState(this.error);

    @override
    List<Object> get props => [error];
}
