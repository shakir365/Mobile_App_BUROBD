import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/annual_appraisal.dart';
import 'package:equatable/equatable.dart';

import '../../network/buro_repository.dart';

part 'recommendation_list_state.dart';

class RecommendationListCubit extends Cubit<RecommendationListState> {
  final BuroRepository repository;

  RecommendationListCubit(this.repository) : super(RecommendationListInitialState());

  Future<RecommendationList> getRecommendationList() async {

    emit(RecommendationListInitialState());
    // try {
    emit(RecommendationListLoadingState());
    var response = await repository.getRecommendationList();

    response.data!.insert(0, RecomListData(recomId:0,recommendation: 'Select'));
    //print('Division Count >>>>>>> ${response.data?.length!!}');
    //emit(DesignationListLoadedState(response));
    _selectRecom = response.data!.first;
    emit(RecommendationListLoadedState(response.data!));
    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }
  }


  late RecomListData _selectRecom  ;

  RecomListData get selectRecom => _selectRecom;

  set selectRecom(RecomListData value) {
    _selectRecom = value;
  }
}
