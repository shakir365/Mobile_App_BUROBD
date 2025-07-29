part of 'apa_emp_leave_cubit.dart';

abstract class ApaEmpLeaveState extends Equatable {
  const ApaEmpLeaveState();

  @override
    List<Object> get props => [];
}

class ApaEmpLeaveInitialState extends ApaEmpLeaveState { }

class ApaEmpLeaveLoadingState extends ApaEmpLeaveState { }

class ApaEmpLeaveLoadedState extends ApaEmpLeaveState {
    final EmpLeaveHistory empLeaveHistory;

    ApaEmpLeaveLoadedState(this.empLeaveHistory);

    @override
    List<Object> get props => [empLeaveHistory];
}

class ApaEmpLeaveErrorState extends ApaEmpLeaveState {
    final error;

    ApaEmpLeaveErrorState(this.error);

    @override
    List<Object> get props => [error];
}
