import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:equatable/equatable.dart';

import '../../network/buro_repository.dart';

part 'liability_list_state.dart';

class LiabilityListCubit extends Cubit<LiabilityListState> {

  final BuroRepository repository;
  LiabilityListCubit(this.repository) : super(LiabilityListInitialState());



  Future<Liability> getLiabilityList() async {


    emit(LiabilityListInitialState());
    // try {
    emit(LiabilityListLoadingState());
    var response = await repository.getLiabilityList();
    response.data!.insert(0, LiabilityData(id:0,liabilityCode: '00',liabilityName: 'Select'));

    _selectLiability = response.data.first;

    emit(LiabilityListLoadedState(response.data));
    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }
  }



  late LiabilityData _selectLiability  ;

  LiabilityData get selectGrade => _selectLiability;

  set selectLiability(LiabilityData value) {
    _selectLiability = value;
  }



}
