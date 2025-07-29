part of 'apa_recom_history_cubit.dart';

abstract class ApaRecomHistoryState extends Equatable {
  const ApaRecomHistoryState();

  @override
    List<Object> get props => [];
}

class ApaRecomHistoryInitialState extends ApaRecomHistoryState { }

class ApaRecomHistoryLoadingState extends ApaRecomHistoryState { }

class ApaRecomHistoryLoadedState extends ApaRecomHistoryState {
    final EmpRecomHistory empRecomHistory;

    ApaRecomHistoryLoadedState(this.empRecomHistory);

    @override
    List<Object> get props => [empRecomHistory];
}

class ApaRecomHistoryErrorState extends ApaRecomHistoryState {
    final error;

    ApaRecomHistoryErrorState(this.error);

    @override
    List<Object> get props => [error];
}
