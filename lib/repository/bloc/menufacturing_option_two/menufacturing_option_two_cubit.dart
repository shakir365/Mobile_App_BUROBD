import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/customer_details.dart';
import 'package:equatable/equatable.dart';

import '../../models/customer_details_edit.dart';
import '../../network/buro_repository.dart';

part 'menufacturing_option_two_state.dart';

class ManufacturingOptionTwoCubit extends Cubit<ManufacturingOptionTwoState> {
  BuroRepository repository;

  ManufacturingOptionTwoCubit(this.repository)
      : super(ManufacturingOptionTwoInitialState());
  final List<ManufacturingOptionTwo> manufacturingList = [];

  addManufacturingOptionTwo(ManufacturingOptionTwo productPurchase) {
    manufacturingList.add(productPurchase);
  }

  List<ManufacturingOptionTwo> getManufacturingList() {
    emit(ManufacturingOptionTwoLoadedState(manufacturingList));
    return manufacturingList;
  }

  Future<ManufecturingOptionTwoEdit?> getManufacturingOptionTwo(
      int customerID) async {
    emit(ManufacturingOptionTwoInitialState());

    try {
      emit(ManufacturingOptionTwoLoadingState());
      var response = await repository.getManufacturingOptionTwo(customerID);

      if (response.data.isNotEmpty) {
        emit(ManufecturingOptionTwoFromAPILoadedState(response.data[0]));
      }

      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
