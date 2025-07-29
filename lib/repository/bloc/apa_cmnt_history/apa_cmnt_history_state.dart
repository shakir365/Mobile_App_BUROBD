part of 'apa_cmnt_history_cubit.dart';

abstract class ApaCmntHistoryState extends Equatable {
  const ApaCmntHistoryState();

  @override
    List<Object> get props => [];
}

class ApaCmntHistoryInitialState extends ApaCmntHistoryState { }

class ApaCmntHistoryLoadingState extends ApaCmntHistoryState { }

class ApaCmntHistoryLoadedState extends ApaCmntHistoryState {
    final EmpCommentHistory empCommentHistory;

    ApaCmntHistoryLoadedState(this.empCommentHistory);

    @override
    List<Object> get props => [empCommentHistory];
}

class ApaCmntHistoryErrorState extends ApaCmntHistoryState {
    final error;

    ApaCmntHistoryErrorState(this.error);

    @override
    List<Object> get props => [error];
}
