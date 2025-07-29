import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:equatable/equatable.dart';

import '../../network/buro_repository.dart';

part 'division_list_state.dart';

class DivisionListCubit extends Cubit<DivisionListState> {

  final BuroRepository repository;


  DivisionListCubit(this.repository) : super(DivisionListInitialState());



  Future<Division> getDivisionList() async {

    emit(DivisionListInitialState());
    // try {
    emit(DivisionListLoadingState());
    var response = await repository.getDivisionList();

    response.data!.insert(0, DivisionData(id:0,divisionCode: '00',divisionName: 'Select'));
    //print('Division Count >>>>>>> ${response.data?.length!!}');
    //emit(DesignationListLoadedState(response));
    _selectDivision = response.data!.first;
    emit(DivisionListLoadedState(response.data!));
    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }
  }


  late DivisionData _selectDivision  ;

  DivisionData get selectDivision => _selectDivision;

  set selectDivision(DivisionData value) {
    _selectDivision = value;
  }


}
