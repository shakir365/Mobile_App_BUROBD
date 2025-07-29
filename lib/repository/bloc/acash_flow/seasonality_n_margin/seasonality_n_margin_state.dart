part of 'seasonality_n_margin_cubit.dart';

abstract class SeasonalityNMarginState extends Equatable {
  const SeasonalityNMarginState();

  @override
    List<Object> get props => [];
}

class SeasonalityNMarginInitialState extends SeasonalityNMarginState { }

class SeasonalityNMarginLoadingState extends SeasonalityNMarginState { }

class SeasonalityNMarginLoadedState extends SeasonalityNMarginState {
    final List<SeasonalityData> data;

    SeasonalityNMarginLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class SeasonalityNMarginErrorState extends SeasonalityNMarginState {
    final error;

    SeasonalityNMarginErrorState(this.error);

    @override
    List<Object> get props => [error];
}
