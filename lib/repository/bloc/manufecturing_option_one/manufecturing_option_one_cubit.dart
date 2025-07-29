import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/customer_details.dart';
import 'package:equatable/equatable.dart';

import '../../models/customer_details_edit.dart';
import '../../network/buro_repository.dart';

part 'manufecturing_option_one_state.dart';

class ManufecturingOptionOneCubit extends Cubit<ManufecturingOptionOneState> {

  BuroRepository repository;
  ManufecturingOptionOneCubit(this.repository) : super(ManufecturingOptionOneInitialState());
  final List<ManufacturingOptionOne> manufacturingList = [] ;

  addManufacturingOption(ManufacturingOptionOne productPurchase){

    manufacturingList.add(productPurchase);


  }


  List<ManufacturingOptionOne> getManufacturingList(){

    emit(ManufecturingOptionOneLoadedState(manufacturingList)) ;
    return manufacturingList;

  }





   Future<ManufecturingOptionOneEdit?> getManufacturingOptionOne(int customerID) async {


    emit(ManufecturingOptionOneInitialState());
   /* try {*/
    emit(ManufecturingOptionOneLoadingState());
    var response = await repository.getManufacturingOptionOne(customerID);
    emit(ManufecturingOptionOneFromAPILoadedState(response.data?? []));
    return response;
    /*} catch (e) {
       emit(ManufecturingOptionOneErrorState(e));
       return null;
     }*/
  }



}
