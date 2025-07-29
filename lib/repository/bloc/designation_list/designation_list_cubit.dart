import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:equatable/equatable.dart';

import '../../network/buro_repository.dart';

part 'designation_list_state.dart';

class DesignationListCubit extends Cubit<DesignationListState> {


  final BuroRepository repository;
  DesignationListCubit(this.repository) : super(DesignationListInitialState());


  List<DesignationData> _designationList = [];


  List<DesignationData> get designationList => _designationList;



  Future<Designation> getDesignationList() async {


      emit(DesignationListInitialState());
      // try {
      emit(DesignationListLoadingState());
      var response = await repository.getDesignation();

      _designationList = response.data;

      response.data.insert(0, DesignationData(id:0,dasignationCode: '00',dasignationName: 'Select'));

      _selectDesignation = response.data.first;
      emit(DesignationListLoadedState(response.data));
      return response;
      // } catch (e) {
      //   emit(AnnualAppraisalErrorState(e));
      // }
    }



 late DesignationData _selectDesignation  ;

  DesignationData get selectDesignation => _selectDesignation;

  set selectDesignation(DesignationData value) {
    _selectDesignation = value;
  }

  void clearDesignationList(){
    _designationList = [];

  }

}
