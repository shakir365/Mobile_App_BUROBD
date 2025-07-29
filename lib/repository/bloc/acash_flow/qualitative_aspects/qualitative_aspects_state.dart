part of 'qualitative_aspects_cubit.dart';

abstract class QualitativeAspectsState extends Equatable {
  const QualitativeAspectsState();

  @override
    List<Object> get props => [];
}

class QualitativeAspectsInitialState extends QualitativeAspectsState { }

class QualitativeAspectsLoadingState extends QualitativeAspectsState { }

class QualitativeAspectsLoadedState extends QualitativeAspectsState {
    final List<QualitativeAspectsData> data;

    QualitativeAspectsLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class QualitativeAspectsErrorState extends QualitativeAspectsState {
    final error;

    QualitativeAspectsErrorState(this.error);

    @override
    List<Object> get props => [error];
}
