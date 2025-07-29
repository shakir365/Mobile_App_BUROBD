part of 'manufecturing_option_one_cubit.dart';

abstract class ManufecturingOptionOneState extends Equatable {
  const ManufecturingOptionOneState();

  @override
    List<Object> get props => [];
}

class ManufecturingOptionOneInitialState extends ManufecturingOptionOneState { }

class ManufecturingOptionOneLoadingState extends ManufecturingOptionOneState { }

class ManufecturingOptionOneLoadedState extends ManufecturingOptionOneState {
    final List <ManufacturingOptionOne> data;

    ManufecturingOptionOneLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class ManufecturingOptionOneFromAPILoadedState extends ManufecturingOptionOneState {
    final List <ManufecturingOptionOneData> data;

    ManufecturingOptionOneFromAPILoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class ManufecturingOptionOneErrorState extends ManufecturingOptionOneState {
    final error;

    ManufecturingOptionOneErrorState(this.error);

    @override
    List<Object> get props => [error];
}
