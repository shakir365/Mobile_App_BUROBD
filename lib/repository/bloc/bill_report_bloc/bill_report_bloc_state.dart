part of 'bill_report_bloc_cubit.dart';

abstract class BillReportBlocState extends Equatable {
  const BillReportBlocState();

  @override
    List<Object> get props => [];
}

class BillReportBlocInitialState extends BillReportBlocState { }

class BillReportBlocLoadingState extends BillReportBlocState { }

class BillReportBlocLoadedState extends BillReportBlocState {
    final List<FieldVisitReportData> data;

    BillReportBlocLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class BillReportBlocErrorState extends BillReportBlocState {
    final error;

    BillReportBlocErrorState(this.error);

    @override
    List<Object> get props => [error];
}
