import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:equatable/equatable.dart';

import '../../network/buro_repository.dart';


part 'zone_list_state.dart';

class ZoneListCubit extends Cubit<ZoneListState> {

  final BuroRepository repository;
  ZoneListCubit(this.repository) : super(ZoneListInitialState());

  Future<Zone> getZoneList() async {


    emit(ZoneListInitialState());
    // try {
    emit(ZoneListLoadingState());
    var response = await repository.getZone();


    response.data!.insert(0, ZoneData(id:0,zoneCode: '00',zoneName: 'Select'));

    _selectZone = response.data.first;
    emit(ZoneListLoadedState(response.data));
    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }
  }



  late ZoneData _selectZone  ;

  ZoneData get selectDesignation => _selectZone;

  set selectDesignation(ZoneData value) {
    _selectZone = value;
  }



}
