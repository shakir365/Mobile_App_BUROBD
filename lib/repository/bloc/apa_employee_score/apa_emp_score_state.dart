part of 'apa_emp_score_cubit.dart';

abstract class ApaEmpScoreState extends Equatable {
  const ApaEmpScoreState();

  @override
    List<Object> get props => [];
}

class ApaEmpScoreInitialState extends ApaEmpScoreState { }

class ApaEmpScoreLoadingState extends ApaEmpScoreState { }

class ApaEmpScoreLoadedState extends ApaEmpScoreState {
    final ApaEmpScore data;

    ApaEmpScoreLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class ApaEmpScoreErrorState extends ApaEmpScoreState {
    final error;

    ApaEmpScoreErrorState(this.error);

    @override
    List<Object> get props => [error];
}
