part of 'grade_list_cubit.dart';

abstract class GradeListState extends Equatable {
  const GradeListState();

  @override
    List<Object> get props => [];
}

class GradeListInitialState extends GradeListState { }

class GradeListLoadingState extends GradeListState { }

class GradeListLoadedState extends GradeListState {
    final List<GradeData> grade;

    GradeListLoadedState(this.grade);

    @override
    List<Object> get props => [grade];
}

class GradeListErrorState extends GradeListState {
    final error;

    GradeListErrorState(this.error);

    @override
    List<Object> get props => [error];
}
