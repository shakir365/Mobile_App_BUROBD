part of 'business_cash_outflow_cubit.dart';

abstract class BusinessCashOutflowState extends Equatable {
  const BusinessCashOutflowState();

  @override
    List<Object> get props => [];
}

class BusinessCashOutflowInitialState extends BusinessCashOutflowState { }

class BusinessCashOutflowLoadingState extends BusinessCashOutflowState { }


class BusinessNetProfitInitialState extends BusinessCashOutflowState { }

class BusinessNetProfitLoadingState extends BusinessCashOutflowState { }


class BusinessCashOutflowLoadedState extends BusinessCashOutflowState {
    final List<CashOutFlowData> data;

    BusinessCashOutflowLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class BusinessNetProfitLoadedState extends BusinessCashOutflowState {
  final List<BusinessNetProfitData> data;

  BusinessNetProfitLoadedState(this.data);

  @override
  List<Object> get props => [data];
}

class NetHouseHoldSurplusLoadedState extends BusinessCashOutflowState {
  final List<NetHouseHoldSurplusData> data;

  NetHouseHoldSurplusLoadedState(this.data);

  @override
  List<Object> get props => [data];
}

class BusinessCashOutflowErrorState extends BusinessCashOutflowState {
    final error;

    BusinessCashOutflowErrorState(this.error);

    @override
    List<Object> get props => [error];
}
