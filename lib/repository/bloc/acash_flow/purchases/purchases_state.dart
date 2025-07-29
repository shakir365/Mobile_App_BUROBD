part of 'purchases_cubit.dart';

abstract class PurchasesState extends Equatable {
  const PurchasesState();

  @override
    List<Object> get props => [];
}

class PurchasesInitialState extends PurchasesState { }

class PurchasesLoadingState extends PurchasesState { }

class PurchasesLoadedState extends PurchasesState {
    final List<PurchaseEditData> data;

    PurchasesLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class PurchasesErrorState extends PurchasesState {
    final error;

    PurchasesErrorState(this.error);

    @override
    List<Object> get props => [error];
}
