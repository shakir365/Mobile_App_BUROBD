import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/OutputSheet.dart';
import 'package:equatable/equatable.dart';

import '../../../network/buro_repository.dart';

part 'seasonality_n_margin_state.dart';

class SeasonalityNMarginCubit extends Cubit<SeasonalityNMarginState> {
  final BuroRepository repository;

  SeasonalityNMarginCubit(this.repository) : super(SeasonalityNMarginInitialState());

   List<MarginData> marginList = [];


  Future<SeasonalityModel?> getSeasonalityInfo(int customerID) async {

    emit(SeasonalityNMarginInitialState());
    try {
    emit(SeasonalityNMarginLoadingState());
    var response = await repository.getSeasonalityInfo(customerID);


    emit(SeasonalityNMarginLoadedState(response.data!));
    return response;
     } catch (e) {
       emit(SeasonalityNMarginErrorState(e));
     }

     return null;

  }


  Future<MarginModel> getMargin(int customerID) async {

   // emit(MarginInitialState());
    // try {
    //emit(MarginLoadingState());
    var response = await repository.getMargin(customerID);
    //marginList = response.data!;

    try {
      response.data!.forEach((element) {
            print('Margin List Called');
            marginList.add(element);

          });
    } catch (e) {
      print(e);
    }

    // response.data!.insert(0, DivisionData(id:0,divisionCode: '00',divisionName: 'Select'));
    //print('Division Count >>>>>>> ${response.data?.length!!}');
    //emit(DesignationListLoadedState(response));
    //_selectDivision = response.data!.first;
    //emit(MarginLoadedState(response.data!));
    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }
  }




}
