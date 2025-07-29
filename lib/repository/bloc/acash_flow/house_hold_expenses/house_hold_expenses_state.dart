part of 'house_hold_expenses_cubit.dart';

abstract class HouseHoldExpensesState extends Equatable {
  const HouseHoldExpensesState();

  @override
    List<Object> get props => [];
}

class HouseHoldExpensesInitialState extends HouseHoldExpensesState { }

class HouseHoldExpensesLoadingState extends HouseHoldExpensesState { }

class HouseHoldExpensesLoadedState extends HouseHoldExpensesState {
    final List<HouseHoldExpensesData> data;

    HouseHoldExpensesLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class HouseHoldExpensesErrorState extends HouseHoldExpensesState {
    final error;

    HouseHoldExpensesErrorState(this.error);

    @override
    List<Object> get props => [error];
}
