part of 'pending_leave_cubit.dart';

abstract class PendingLeaveState extends Equatable {
  const PendingLeaveState();

  @override
    List<Object> get props => [];
}

class PendingLeaveInitialState extends PendingLeaveState { }

class PendingLeaveLoadingState extends PendingLeaveState { }

class PendingLeaveLoadedState extends PendingLeaveState {
    final data;

    PendingLeaveLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class PendingLeaveErrorState extends PendingLeaveState {
    final error;

    PendingLeaveErrorState(this.error);

    @override
    List<Object> get props => [error];
}
