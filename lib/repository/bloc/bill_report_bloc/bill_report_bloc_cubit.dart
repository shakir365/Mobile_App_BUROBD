import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/bill_request.dart';
import 'package:equatable/equatable.dart';

import '../../models/field_visit_report.dart';
import '../../network/buro_repository.dart';

part 'bill_report_bloc_state.dart';

class BillReportBlocCubit extends Cubit<BillReportBlocState> {


  BuroRepository buroRepository;

   String _employeeCode = '';
   String _activityStatus = '';
   String _startDateFrom = '';
   String _startDateTo = '';
   String _endDateFrom = '';
   String _endDateTo = '';
   int _statusPosition = 0;

  int get statusPosition => _statusPosition;

  set statusPosition(int value) {
    _statusPosition = value;
  }

  String get employeeCode => _employeeCode;

  set employeeCode(String value) {
    _employeeCode = value;
  }



  BillReportBlocCubit(this.buroRepository) : super(BillReportBlocInitialState());


  Future<FieldVisitReport?> getPlanSummary(ReportFilter reportFilter) async {
    emit(BillReportBlocInitialState());

     //try {
      emit(BillReportBlocInitialState());
      var response = await buroRepository.getPlanSummary(reportFilter);
      print(response);
      print('Response ${response.data!.length}');
      emit(BillReportBlocLoadedState(response.data!));
      return response;
    //} catch (e) {
     // emit(BillReqListErrorState(e));
    //}
    return null;
  }

  String get activityStatus => _activityStatus;

  set activityStatus(String value) {
    _activityStatus = value;
  }

  String get startDateFrom => _startDateFrom;

  set startDateFrom(String value) {
    _startDateFrom = value;
  }

  String get startDateTo => _startDateTo;

  set startDateTo(String value) {
    _startDateTo = value;
  }

  String get endDateFrom => _endDateFrom;

  set endDateFrom(String value) {
    _endDateFrom = value;
  }

  String get endDateTo => _endDateTo;

  set endDateTo(String value) {
    _endDateTo = value;
  }


  void clear(){
     _employeeCode = '';
    _activityStatus = '';
    _startDateFrom = '';
    _startDateTo = '';
    _endDateFrom = '';
    _endDateTo = '';
    _statusPosition = 0;
  }
}
