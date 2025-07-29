part of 'customer_details_cubit.dart';

abstract class CustomerDetailsState extends Equatable {
  const CustomerDetailsState();

  @override
    List<Object> get props => [];
}

class CustomerDetailsInitialState extends CustomerDetailsState { }

class CustomerDetailsLoadingState extends CustomerDetailsState { }

class CustomerDetailsLoadedState extends CustomerDetailsState {
    final List<ExistingCustomerInfoData> data;

    CustomerDetailsLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class CustomerDetailsErrorState extends CustomerDetailsState {
    final error;

    CustomerDetailsErrorState(this.error);

    @override
    List<Object> get props => [error];
}


