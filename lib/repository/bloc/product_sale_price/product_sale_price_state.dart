part of 'product_sale_price_cubit.dart';

abstract class ProductSalePriceState extends Equatable {
  const ProductSalePriceState();

  @override
    List<Object> get props => [];
}

class ProductSalePriceInitialState extends ProductSalePriceState { }

class ProductSalePriceLoadingState extends ProductSalePriceState { }

class ProductSalePriceLoadedState extends ProductSalePriceState {
    final List<ProductSale> data;

    ProductSalePriceLoadedState(this.data);

    @override
    List<Object> get props => [data];
}


class ProductSalePriceLoadedFromAPIState extends ProductSalePriceState {
  final List<ProductSalePriceData> data;

  ProductSalePriceLoadedFromAPIState(this.data);

  @override
  List<Object> get props => [data];
}

class ProductSalePriceErrorState extends ProductSalePriceState {
    final error;

    ProductSalePriceErrorState(this.error);

    @override
    List<Object> get props => [error];
}
