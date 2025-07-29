part of 'sales_cash_book_cubit.dart';

abstract class SalesCashBookState extends Equatable {
  const SalesCashBookState();

  @override
    List<Object> get props => [];
}

class SalesCashBookInitialState extends SalesCashBookState { }

class SalesCashBookLoadingState extends SalesCashBookState { }

class SalesCashBookLoadedState extends SalesCashBookState {
    final List<SalesCashBookEditData> data;

    SalesCashBookLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class SalesCashBookErrorState extends SalesCashBookState {
    final error;

    SalesCashBookErrorState(this.error);

    @override
    List<Object> get props => [error];
}
