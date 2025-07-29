part of 'stock_cubit.dart';

abstract class StockState extends Equatable {
  const StockState();

  @override
    List<Object> get props => [];
}

class StockInitialState extends StockState { }

class StockLoadingState extends StockState { }

class StockLoadedState extends StockState {
    final List<StockEditData> data;

    StockLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class StockErrorState extends StockState {
    final error;

    StockErrorState(this.error);

    @override
    List<Object> get props => [error];
}
