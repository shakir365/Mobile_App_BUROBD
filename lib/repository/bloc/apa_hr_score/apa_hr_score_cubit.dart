import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:equatable/equatable.dart';

import '../../network/buro_repository.dart';

part 'apa_hr_score_state.dart';

class ApaHrScoreCubit extends Cubit<ApaHrScoreState> {


  final BuroRepository repository;

  ApaHrScoreCubit(this.repository) : super(ApaHrScoreInitialState());

  Future<ApaHrRecomScore?> getHRRecomScore(GetHrScore getHrScore) async {
    emit(ApaHrScoreInitialState());
    //try {
    emit(ApaHrScoreLoadingState());
    var response = await repository.getHrRecomScore(getHrScore);
    emit(ApaHrScoreLoadedState(response));
    return response;
    //} catch (e) {
    //  emit(ApaEmpLeaveErrorState(e));
    //}
  }


  String _hrScore ='';

  get hrScore => _hrScore;

  set hrScore(value) {
    _hrScore = value;
  }
}
