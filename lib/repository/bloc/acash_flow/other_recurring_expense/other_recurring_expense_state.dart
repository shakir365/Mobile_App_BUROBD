part of 'other_recurring_expense_cubit.dart';

abstract class OtherRecurringExpenseState extends Equatable {
  const OtherRecurringExpenseState();

  @override
    List<Object> get props => [];
}

class OtherRecurringExpenseInitialState extends OtherRecurringExpenseState { }

class OtherRecurringExpenseLoadingState extends OtherRecurringExpenseState { }

class OtherRecurringExpenseLoadedState extends OtherRecurringExpenseState {
    final  List<RecurringExpenseData>data;

    OtherRecurringExpenseLoadedState(this.data);

    @override
    List<Object> get props => [data];
}


class TotalMonthlySurplusLoadedState extends OtherRecurringExpenseState {
  final  List<NetHouseHoldSurplusData> data;

  TotalMonthlySurplusLoadedState(this.data);

  @override
  List<Object> get props => [data];
}

class OtherRecurringExpenseErrorState extends OtherRecurringExpenseState {
    final error;

    OtherRecurringExpenseErrorState(this.error);

    @override
    List<Object> get props => [error];
}
