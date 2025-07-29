part of 'all_cash_inflow_cubit.dart';

abstract class AllCashInflowState extends Equatable {
  const AllCashInflowState();

  @override
    List<Object> get props => [];
}

class AllCashInflowInitialState extends AllCashInflowState { }

class AllCashInflowLoadingState extends AllCashInflowState { }

class AllCashInflowLoadedState extends AllCashInflowState {
    final List<AllCashInFlowData> data;

    AllCashInflowLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class AllCashInflowErrorState extends AllCashInflowState {
    final error;

    AllCashInflowErrorState(this.error);

    @override
    List<Object> get props => [error];
}
