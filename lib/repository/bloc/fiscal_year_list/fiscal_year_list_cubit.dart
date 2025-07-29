import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:equatable/equatable.dart';

import '../../network/buro_repository.dart';

part 'fiscal_year_list_state.dart';

class FiscalYearListCubit extends Cubit<FiscalYearListState> {

  final BuroRepository repository;
  FiscalYearListCubit(this.repository) : super(FiscalYearListInitialState());


  Future<FiscalYear> getFiscalYear() async {


    emit(FiscalYearListInitialState());
    // try {
    emit(FiscalYearListLoadingState());
    var response = await repository.getFiscalYearList();


    _selectFiscalYear = response.data.first;
    emit(FiscalYearListLoadedState(response.data));
    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }
  }



  late FiscalYearData _selectFiscalYear  ;

  FiscalYearData get selectFiscalYear => _selectFiscalYear;

  set selectFiscalYear(FiscalYearData value) {
    _selectFiscalYear = value;
  }


}
