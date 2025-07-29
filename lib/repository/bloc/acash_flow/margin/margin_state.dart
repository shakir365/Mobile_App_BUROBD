part of 'margin_cubit.dart';

abstract class MarginState extends Equatable {
  const MarginState();

  @override
    List<Object> get props => [];
}

class MarginInitialState extends MarginState { }

class MarginLoadingState extends MarginState { }

class MarginLoadedState extends MarginState {
    final List<MarginData> data;

    MarginLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class MarginErrorState extends MarginState {
    final error;

    MarginErrorState(this.error);

    @override
    List<Object> get props => [error];
}
