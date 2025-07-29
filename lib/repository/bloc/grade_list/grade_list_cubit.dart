import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/annual_appraisal.dart';
import '../../network/buro_repository.dart';

part 'grade_list_state.dart';

class GradeListCubit extends Cubit<GradeListState> {

  final BuroRepository repository;
  GradeListCubit(this.repository) : super(GradeListInitialState());

  Future<Grade> getGradeList() async {


    emit(GradeListInitialState());
    // try {
    emit(GradeListLoadingState());
    var response = await repository.getGradeList();


    response.data!.insert(0, GradeData(id:0,gradeCode: '00',gradeName: 'Select'));

    _selectGrade = response.data.first;
    emit(GradeListLoadedState(response.data));
    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }
  }



  late GradeData _selectGrade  ;

  GradeData get selectGrade => _selectGrade;

  set selectGrade(GradeData value) {
    _selectGrade = value;
  }





}
