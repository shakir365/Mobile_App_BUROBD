import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:equatable/equatable.dart';

import '../../network/buro_repository.dart';

part 'area_list_state.dart';

class AreaListCubit extends Cubit<AreaListState> {
 // AreaListCubit() : super(AreaListInitialState());

  final BuroRepository repository;
  AreaListCubit(this.repository) : super(AreaListInitialState());



  Future<AreaList> getAreaList() async {

    emit(AreaListInitialState());
    // try {
    emit(AreaListLoadingState());
    var response = await repository.getAreaList();

    response.data!.insert(0, AreaListData(id:0,areaCode: '00',areaName: 'Select'));
    print('Division Count >>>>>>> ${response.data?.length!!}');
    //emit(DesignationListLoadedState(response));
    _selectArea = response.data!.first;
    emit(AreaListLoadedState(response.data!));
    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }
  }


  late AreaListData _selectArea  ;

  AreaListData get selectArea => _selectArea;

  set selectArea(AreaListData value) {
    _selectArea = value;
  }
}
