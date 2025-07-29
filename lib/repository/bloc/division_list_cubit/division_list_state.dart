part of 'division_list_cubit.dart';

abstract class DivisionListState extends Equatable {
  const DivisionListState();

  @override
    List<Object> get props => [];
}

class DivisionListInitialState extends DivisionListState { }

class DivisionListLoadingState extends DivisionListState { }

class DivisionListLoadedState extends DivisionListState {
    final  List<DivisionData> data;

    DivisionListLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class DivisionListErrorState extends DivisionListState {
    final error;

    DivisionListErrorState(this.error);

    @override
    List<Object> get props => [error];
}
