import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/OutputSheet.dart';
import 'package:equatable/equatable.dart';

import '../../../network/buro_repository.dart';

part 'all_cash_inflow_state.dart';

class AllCashInflowCubit extends Cubit<AllCashInflowState> {

  final BuroRepository repository;

  AllCashInflowCubit(this.repository) : super(AllCashInflowInitialState());

  Future<AllCashInFlowModel?> getAllCashInFlow(int customerID) async {

    emit(AllCashInflowInitialState());
     try {
    emit(AllCashInflowLoadingState());
    var response = await repository.getAllCashInFlow(customerID);

   // response.data!.insert(0, DivisionData(id:0,divisionCode: '00',divisionName: 'Select'));
    //print('Division Count >>>>>>> ${response.data?.length!!}');
    //emit(DesignationListLoadedState(response));
    //_selectDivision = response.data!.first;
   // response.data!.removeLast();
    emit(AllCashInflowLoadedState(response.data!));
    return response;
     } catch (e) {
       emit(AllCashInflowErrorState(e));
     }
  }



}
