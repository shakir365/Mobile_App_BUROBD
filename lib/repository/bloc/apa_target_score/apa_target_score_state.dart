part of 'apa_target_score_cubit.dart';

abstract class ApaTargetScoreState extends Equatable {
  const ApaTargetScoreState();

  @override
    List<Object> get props => [];
}

class ApaTargetScoreInitialState extends ApaTargetScoreState { }

class ApaTargetScoreLoadingState extends ApaTargetScoreState { }

class ApaTargetScoreLoadedState extends ApaTargetScoreState {
    final EmpTargetScore data;

    ApaTargetScoreLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class ApaTargetScoreErrorState extends ApaTargetScoreState {
    final error;

    ApaTargetScoreErrorState(this.error);

    @override
    List<Object> get props => [error];
}
