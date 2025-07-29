part of 'frequency_cubit.dart';

abstract class FrequencyState extends Equatable {
  const FrequencyState();

  @override
    List<Object> get props => [];
}

class FrequencyInitialState extends FrequencyState { }

class FrequencyLoadingState extends FrequencyState { }

class FrequencyLoadedState extends FrequencyState {
    final List<FrequencyData> data;

    FrequencyLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class FrequencyErrorState extends FrequencyState {
    final error;

    FrequencyErrorState(this.error);

    @override
    List<Object> get props => [error];
}
