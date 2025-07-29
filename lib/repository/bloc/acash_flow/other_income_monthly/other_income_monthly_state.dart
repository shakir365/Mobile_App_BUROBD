part of 'other_income_monthly_cubit.dart';

abstract class OtherIncomeMonthlyState extends Equatable {
  const OtherIncomeMonthlyState();

  @override
    List<Object> get props => [];
}

class OtherIncomeMonthlyInitialState extends OtherIncomeMonthlyState { }

class OtherIncomeMonthlyLoadingState extends OtherIncomeMonthlyState { }

class OtherIncomeMonthlyLoadedState extends OtherIncomeMonthlyState {
    final List <OtherIncomeMonthlyEditData>data;

    OtherIncomeMonthlyLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class OtherIncomeMonthlyErrorState extends OtherIncomeMonthlyState {
    final error;

    OtherIncomeMonthlyErrorState(this.error);

    @override
    List<Object> get props => [error];
}
