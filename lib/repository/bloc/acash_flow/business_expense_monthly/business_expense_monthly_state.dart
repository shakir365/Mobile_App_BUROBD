part of 'business_expense_monthly_cubit.dart';

abstract class BusinessExpenseMonthlyState extends Equatable {
  const BusinessExpenseMonthlyState();

  @override
    List<Object> get props => [];
}

class BusinessExpenseMonthlyInitialState extends BusinessExpenseMonthlyState { }

class BusinessExpenseMonthlyLoadingState extends BusinessExpenseMonthlyState { }

class BusinessExpenseMonthlyLoadedState extends BusinessExpenseMonthlyState {
    final List <BusinessExpenseMonthlyData>data;

    BusinessExpenseMonthlyLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class BusinessExpenseMonthlyErrorState extends BusinessExpenseMonthlyState {
    final error;

    BusinessExpenseMonthlyErrorState(this.error);

    @override
    List<Object> get props => [error];
}
