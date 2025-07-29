part of 'fiscal_year_list_cubit.dart';

abstract class FiscalYearListState extends Equatable {
  const FiscalYearListState();

  @override
    List<Object> get props => [];
}

class FiscalYearListInitialState extends FiscalYearListState { }

class FiscalYearListLoadingState extends FiscalYearListState { }

class FiscalYearListLoadedState extends FiscalYearListState {
    final List<FiscalYearData>  data;

    FiscalYearListLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class FiscalYearListErrorState extends FiscalYearListState {
    final error;

    FiscalYearListErrorState(this.error);

    @override
    List<Object> get props => [error];
}
