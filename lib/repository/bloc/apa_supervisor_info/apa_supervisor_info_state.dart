part of 'apa_supervisor_info_cubit.dart';

abstract class ApaReceiverInfoState extends Equatable {
  const ApaReceiverInfoState();

  @override
    List<Object> get props => [];
}

class ApaSupervisorInfoInitialState extends ApaReceiverInfoState { }

class ApaSupervisorInfoLoadingState extends ApaReceiverInfoState { }

class ApaSupervisorInfoLoadedState extends ApaReceiverInfoState {
    final ApaApprovalPathInfo data;

    ApaSupervisorInfoLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class ApaSupervisorInfoErrorState extends ApaReceiverInfoState {
    final error;

    ApaSupervisorInfoErrorState(this.error);

    @override
    List<Object> get props => [error];
}


