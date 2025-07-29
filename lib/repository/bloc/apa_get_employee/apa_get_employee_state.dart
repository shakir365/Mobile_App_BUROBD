part of 'apa_get_employee_cubit.dart';

abstract class ApaGetEmployeeState extends Equatable {
  const ApaGetEmployeeState();

  @override
    List<Object> get props => [];
}

class ApaGetEmployeeInitialState extends ApaGetEmployeeState { }

class ApaGetEmployeeLoadingState extends ApaGetEmployeeState { }

class ApaGetEmployeeLoadedState extends ApaGetEmployeeState {
    final ApaEmployeeInfo data;

    ApaGetEmployeeLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class ApaGetEmployeeErrorState extends ApaGetEmployeeState {
    final error;

    ApaGetEmployeeErrorState(this.error);

    @override
    List<Object> get props => [error];
}
