import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/bill_model.dart';
import '../../network/buro_repository.dart';

part 'add_bill_info_state.dart';

class AddBillInfoCubit extends Cubit<AddBillInfoState> {
  final BuroRepository repository;
   List<PlaceWithPrice> _placeDropDownList = [];

  List<PlaceWithPrice> get placeDropDownList => _placeDropDownList;

  set placeDropDownList(List<PlaceWithPrice> value) {
    _placeDropDownList = value;
  }

  AddBillInfoCubit(this.repository) : super(AddBillInfoInitialState());

  Future<BreakFastBill?> getBreakFastBill(int applicationId) async {
    emit(AddBillInfoInitialState());

   /* try {*/
      emit(AddBillInfoLoadingState());
      var response = await repository.getBreakFastBill();
    late PlaceWithPrice placeWithPrice;
      response.data?.asMap().forEach((key, value) {

        placeWithPrice= new PlaceWithPrice(name: value.billInSlot!,id:value.billingPlaceId!,price:value.billingAmount!);
        _placeDropDownList.add(placeWithPrice);

      });


      _placeDropDownList!.add(placeWithPrice);


      emit(AddBillInfoDropDownLoadedState(_placeDropDownList));

      emit(AddBillInfoLoadedState(response));
      return response;
    /*} catch (e) {
      emit(AddBillInfoErrorState(e));
    }*/
  }





}


class PlaceWithPrice {
  late String name;
  late int id;
  late int price;

  PlaceWithPrice({required String name,required int id,required int price}) {
    this.name = name;
    this.id = id;
    this.price = price;
  }
}
