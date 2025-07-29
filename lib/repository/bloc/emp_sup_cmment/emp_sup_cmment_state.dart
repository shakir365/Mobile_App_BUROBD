part of 'emp_sup_cmment_cubit.dart';

abstract class EmpSupCmmentState extends Equatable {
  const EmpSupCmmentState();

  @override
    List<Object> get props => [];
}

class EmpSupCmmentInitialState extends EmpSupCmmentState { }

class EmpSupCmmentLoadingState extends EmpSupCmmentState { }

class EmpSupCmmentLoadedState extends EmpSupCmmentState {
    final ApaSupervisorComment apaSupervisorComment;

    EmpSupCmmentLoadedState(this.apaSupervisorComment);

    @override
    List<Object> get props => [apaSupervisorComment];
}

class EmpSupCmmentErrorState extends EmpSupCmmentState {
    final error;

    EmpSupCmmentErrorState(this.error);

    @override
    List<Object> get props => [error];
}
