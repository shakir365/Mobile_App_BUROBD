part of 'recommendation_list_cubit.dart';

abstract class RecommendationListState extends Equatable {
  const RecommendationListState();

  @override
    List<Object> get props => [];
}

class RecommendationListInitialState extends RecommendationListState { }

class RecommendationListLoadingState extends RecommendationListState { }

class RecommendationListLoadedState extends RecommendationListState {
    final data;

    RecommendationListLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class RecommendationListErrorState extends RecommendationListState {
    final error;

    RecommendationListErrorState(this.error);

    @override
    List<Object> get props => [error];
}
