part of 'leave_bloc_cubit.dart';

abstract class LeaveBlocState extends Equatable {
  const LeaveBlocState();

  @override
    List<Object> get props => [];
}

class LeaveBlocInitialState extends LeaveBlocState { }

class LeaveBlocLoadingState extends LeaveBlocState { }

class LeaveBlocLoadedState extends LeaveBlocState {
    final data;

    LeaveBlocLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class LeaveBlocErrorState extends LeaveBlocState {
    final error;

    LeaveBlocErrorState(this.error);

    @override
    List<Object> get props => [error];
}
