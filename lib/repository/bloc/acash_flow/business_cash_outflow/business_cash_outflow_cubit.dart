import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/OutputSheet.dart';
import 'package:equatable/equatable.dart';

import '../../../network/buro_repository.dart';

part 'business_cash_outflow_state.dart';

class BusinessCashOutflowCubit extends Cubit<BusinessCashOutflowState> {

  final BuroRepository repository;

  BusinessCashOutflowCubit(this.repository) : super(BusinessCashOutflowInitialState());

  List<BusinessNetProfitData> netProfitList = [];
  List<NetHouseHoldSurplusData> netHouseHoldSurplusList = [];

  Future<CashOutFlowModel?> getBusinessCashOutFlow(int customerID) async {

    emit(BusinessCashOutflowInitialState());

    try {
    emit(BusinessCashOutflowLoadingState());
    var response = await repository.getBusinessCashOutFlow(customerID);

    emit(BusinessCashOutflowLoadedState(response.data!));

    return response;
     } catch (e) {
       emit(BusinessCashOutflowErrorState(e));
     }
     return null;
  }


  Future<BusinessNetProfitModel> getBusinessNetProfit(int customerID) async {


    var response = await repository.getBusinessNetProfit(customerID);

    try {
      response.data!.forEach((element) {
             netProfitList.add(element);

           });
    } catch (e) {
      print(e);
    }

     return response;

  }

  Future<NetHouseholdSurplusModel> getNetHouseHoldSurplus(int customerID) async {


    var response = await repository.getNetHouseHoldSurplus(customerID);

    try {
      response.data!.forEach((element) {

            netHouseHoldSurplusList.add(element);

          });
    } catch (e) {
      print(e);
    }

    return response;

  }

}
