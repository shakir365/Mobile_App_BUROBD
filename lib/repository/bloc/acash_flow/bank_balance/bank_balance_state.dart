part of 'bank_balance_cubit.dart';

abstract class BankBalanceState extends Equatable {
  const BankBalanceState();

  @override
    List<Object> get props => [];
}

class BankBalanceInitialState extends BankBalanceState { }

class BankBalanceLoadingState extends BankBalanceState { }

class BankBalanceLoadedState extends BankBalanceState {
    final List<BankBalanceEditData> data;

    BankBalanceLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class BankBalanceErrorState extends BankBalanceState {
    final error;

    BankBalanceErrorState(this.error);

    @override
    List<Object> get props => [error];
}
