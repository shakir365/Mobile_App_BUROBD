part of 'liability_list_cubit.dart';

abstract class LiabilityListState extends Equatable {
  const LiabilityListState();

  @override
    List<Object> get props => [];
}

class LiabilityListInitialState extends LiabilityListState { }

class LiabilityListLoadingState extends LiabilityListState { }

class LiabilityListLoadedState extends LiabilityListState {
    final List<LiabilityData> liability;

    LiabilityListLoadedState(this.liability);

    @override
    List<Object> get props => [liability];
}

class LiabilityListErrorState extends LiabilityListState {
    final error;

    LiabilityListErrorState(this.error);

    @override
    List<Object> get props => [error];
}
