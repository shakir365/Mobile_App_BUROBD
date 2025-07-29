part of 'area_list_cubit.dart';

abstract class AreaListState extends Equatable {
  const AreaListState();

  @override
    List<Object> get props => [];
}

class AreaListInitialState extends AreaListState { }

class AreaListLoadingState extends AreaListState { }

class AreaListLoadedState extends AreaListState {
    final List<AreaListData> data;

    AreaListLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class AreaListErrorState extends AreaListState {
    final error;

    AreaListErrorState(this.error);

    @override
    List<Object> get props => [error];
}
