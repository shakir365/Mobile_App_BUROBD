part of 'customer_list_cubit.dart';

abstract class CustomerListState extends Equatable {
  const CustomerListState();

  @override
    List<Object> get props => [];
}

class CustomerListInitialState extends CustomerListState { }

class CustomerListLoadingState extends CustomerListState { }

class CustomerListLoadedState extends CustomerListState {
    final List<CustomerListData> data;

    CustomerListLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class CustomerDetailLoadedState extends CustomerListState {
  final List<ExistingCustomerInfoData> data;

  CustomerDetailLoadedState(this.data);

  @override
  List<Object> get props => [data];
}


class CustomerDetailErrorState extends CustomerListState {
  final error;

  CustomerDetailErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class CustomerListErrorState extends CustomerListState {
    final error;

    CustomerListErrorState(this.error);

    @override
    List<Object> get props => [error];
}
