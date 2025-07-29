import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/ApprovedPlan.dart';
import 'package:buro_employee/repository/network/buro_repository.dart';
import 'package:buro_employee/views/field_visit/apply/apply_page.dart';
import 'package:equatable/equatable.dart';
import '../../models/bill_model.dart';


part 'apply_state.dart';

class DropDownCubit extends Cubit<NameIDModel?> {
  DropDownCubit(NameIDModel? initialState) : super(initialState);

  void setDropdownValue(NameIDModel nameIDModel) {
    emit(nameIDModel);
  }
}

class ApplyCubit extends Cubit<ApplyState> {
  BuroRepository repository;

  ApplyCubit(this.repository) : super(ApplyInitialState());

  List<PlaceWithPrice> _morningDropDownList = [];
  List<PlaceWithPrice> _lunchNDinnerDropDownList = [];
  List<PlaceWithPrice> _residenceDropDownList = [];
  List<DailyNSpecialData> _dailyNSpecialBill = [];

  Future<ApprovedPlan?> getApprovedList() async {
    emit(ApplyInitialState());

    try {
      emit(ApplyLoadingState());
      var response = await repository.getApprovedPlanList();
      emit(ApplyLoadedState(response));
      return response;
    } catch (e) {
      emit(ApplyErrorState(e));
    }
  }

  Future<BreakFastBill?> getBreakFastBill() async {
    var response = await repository.getBreakFastBill();
    late PlaceWithPrice placeWithPrice;
    response.data?.asMap().forEach((key, value) {
      _morningDropDownList.add(PlaceWithPrice(
          name: value.placeName!,
          id: value.billingPlaceId!,
          price: value.billingAmount!));
    });

    return response;
  }

  Future<LunchNDinnerBill?> getLunchNDinnerBill() async {
    var response = await repository.getLunchNDinnerBill();
    late PlaceWithPrice placeWithPrice;
    response.data?.asMap().forEach((key, value) {
      _lunchNDinnerDropDownList.add(PlaceWithPrice(
          name: value.placeName!,
          id: value.billPlaceID!,
          price: value.billingAmount!));
    });

    return response;
  }

  Future<ResidenceBill?> getResidenceBill() async {
    var response = await repository.getResidenceBill();
    late PlaceWithPrice placeWithPrice;
    response.data?.asMap().forEach((key, value) {
      _residenceDropDownList.add(PlaceWithPrice(
          name: value.placeName!,
          id: value.placeTypeID!,
          price: value.billingAmount!));
    });

    return response;
  }

  Future<DailyNSpecialBill?> getDailyNSpecial() async {
    DailyNSpecialBill response = await repository.getDailyNSpecialBill();

    try {
      dailyNSpecialBill = response.data!;
      return response;
    } catch (e) {
      print(e);
      return null;
    }


  }

  List<PlaceWithPrice> get residenceDropDownList => _residenceDropDownList;

  set residenceDropDownList(List<PlaceWithPrice> value) {
    _residenceDropDownList = value;
  }

  List<PlaceWithPrice> get lunchNDinnerDropDownList =>
      _lunchNDinnerDropDownList;

  set lunchDropDownList(List<PlaceWithPrice> value) {
    _lunchNDinnerDropDownList = value;
  }

  List<PlaceWithPrice> get morningDropDownList => _morningDropDownList;

  set morningDropDownList(List<PlaceWithPrice> value) {
    _morningDropDownList = value;
  }

  List<DailyNSpecialData> get dailyNSpecialBill => _dailyNSpecialBill;

  set dailyNSpecialBill(List<DailyNSpecialData> value) {
    _dailyNSpecialBill = value;
  }


}

enum DropDownEvent { increment, decrement }

class PlaceWithPrice {
  late String name;
  late int id;
  late int price;

  PlaceWithPrice({required String name, required int id, required int price}) {
    this.name = name;
    this.id = id;
    this.price = price;
  }
}
