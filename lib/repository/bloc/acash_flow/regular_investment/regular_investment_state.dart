part of 'regular_investment_cubit.dart';

abstract class RegularInvestmentState extends Equatable {
  const RegularInvestmentState();

  @override
    List<Object> get props => [];
}

class RegularInvestmentInitialState extends RegularInvestmentState { }

class RegularInvestmentLoadingState extends RegularInvestmentState { }

class RegularInvestmentLoadedState extends RegularInvestmentState {
    final List<RegularInvestmentData> data;

    RegularInvestmentLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class RegularInvestmentErrorState extends RegularInvestmentState {
    final error;

    RegularInvestmentErrorState(this.error);

    @override
    List<Object> get props => [error];
}
