import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/customer_details_edit.dart';
import '../../../network/buro_repository.dart';

part 'qualitative_aspects_state.dart';

class QualitativeAspectsCubit extends Cubit<QualitativeAspectsState> {

  BuroRepository repository;
  QualitativeAspectsCubit(this.repository) : super(QualitativeAspectsInitialState());


  Future<QualitativeAspectsEdit?> getQualitativeAspects(int customerID) async {


    emit(QualitativeAspectsInitialState());
     try {
    emit(QualitativeAspectsLoadingState());
    var response = await repository.getQualitativeAspects(customerID);


    emit(QualitativeAspectsLoadedState(response.data!));


    return response;
     } catch (e) {
       emit(QualitativeAspectsErrorState(e));
       return null;
     }
  }








}
