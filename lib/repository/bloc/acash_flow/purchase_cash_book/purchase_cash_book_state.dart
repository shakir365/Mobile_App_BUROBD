part of 'purchase_cash_book_cubit.dart';

abstract class PurchaseCashBookState extends Equatable {
  const PurchaseCashBookState();

  @override
    List<Object> get props => [];
}

class PurchaseCashBookInitialState extends PurchaseCashBookState { }

class PurchaseCashBookLoadingState extends PurchaseCashBookState { }

class PurchaseCashBookLoadedState extends PurchaseCashBookState {
    final List<PurchaseCashbookData> data;

    PurchaseCashBookLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class PurchaseCashBookErrorState extends PurchaseCashBookState {
    final error;

    PurchaseCashBookErrorState(this.error);

    @override
    List<Object> get props => [error];
}
