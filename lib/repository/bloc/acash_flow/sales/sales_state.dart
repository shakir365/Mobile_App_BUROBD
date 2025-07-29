part of 'sales_cubit.dart';

abstract class SalesState extends Equatable {
  const SalesState();

  @override
    List<Object> get props => [];
}

class SalesInitialState extends SalesState { }

class SalesLoadingState extends SalesState { }

class SalesLoadedState extends SalesState {
    final List <SalesEditData>data;

    SalesLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class SalesErrorState extends SalesState {
    final error;

    SalesErrorState(this.error);

    @override
    List<Object> get props => [error];
}
