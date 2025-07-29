part of 'personal_expense_monthly_cubit.dart';

abstract class PersonalExpenseMonthlyState extends Equatable {
  const PersonalExpenseMonthlyState();

  @override
    List<Object> get props => [];
}

class PersonalExpenseMonthlyInitialState extends PersonalExpenseMonthlyState { }

class PersonalExpenseMonthlyLoadingState extends PersonalExpenseMonthlyState { }

class PersonalExpenseMonthlyLoadedState extends PersonalExpenseMonthlyState {
    final List<PersonalExpesneMonthlyEditData> data;

    PersonalExpenseMonthlyLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class PersonalExpenseMonthlyErrorState extends PersonalExpenseMonthlyState {
    final error;

    PersonalExpenseMonthlyErrorState(this.error);

    @override
    List<Object> get props => [error];
}
