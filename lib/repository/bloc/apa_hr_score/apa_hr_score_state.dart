part of 'apa_hr_score_cubit.dart';

abstract class ApaHrScoreState extends Equatable {
  const ApaHrScoreState();

  @override
    List<Object> get props => [];
}

class ApaHrScoreInitialState extends ApaHrScoreState { }

class ApaHrScoreLoadingState extends ApaHrScoreState { }

class ApaHrScoreLoadedState extends ApaHrScoreState {
    final ApaHrRecomScore apaHrRecomScore;

    ApaHrScoreLoadedState(this.apaHrRecomScore);

    @override
    List<Object> get props => [apaHrRecomScore];
}

class ApaHrScoreErrorState extends ApaHrScoreState {
    final error;

    ApaHrScoreErrorState(this.error);

    @override
    List<Object> get props => [error];
}
