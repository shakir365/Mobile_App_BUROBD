part of 'product_purchase_prize_cubit.dart';

abstract class ProductPurchasePrizeState extends Equatable {
  const ProductPurchasePrizeState();

  @override
    List<Object> get props => [];
}

class ProductPurchasePrizeInitialState extends ProductPurchasePrizeState { }

class ProductPurchasePrizeLoadingState extends ProductPurchasePrizeState { }

class ProductPurchasePrizeLoadedState extends ProductPurchasePrizeState {
    final List<ProductPurchase> data;

    ProductPurchasePrizeLoadedState(this.data);

    @override
    List<Object> get props => [data];
}


class ProductPurchasePrizeLoadedFromAPIState extends ProductPurchasePrizeState {
  final List<ProductPurchasePriceData> data;

  ProductPurchasePrizeLoadedFromAPIState(this.data);

  @override
  List<Object> get props => [data];
}

class ProductPurchasePrizeErrorState extends ProductPurchasePrizeState {
    final error;

    ProductPurchasePrizeErrorState(this.error);

    @override
    List<Object> get props => [error];
}
