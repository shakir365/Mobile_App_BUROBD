import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/OutputSheet.dart';
import 'package:equatable/equatable.dart';

import '../../../network/buro_repository.dart';

part 'frequency_state.dart';

class FrequencyCubit extends Cubit<FrequencyState> {


  final BuroRepository repository;


  FrequencyCubit(this.repository) : super(FrequencyInitialState());

  Future<FrequencyModel?> getFrequency(int customerID) async {

    emit(FrequencyInitialState());
     try {
    emit(FrequencyLoadingState());
    var response = await repository.getFrequency(customerID);
    emit(FrequencyLoadedState(response.data!));
    return response;
     } catch (e) {
       emit(FrequencyErrorState(e));
     }

     return null;
  }






}
