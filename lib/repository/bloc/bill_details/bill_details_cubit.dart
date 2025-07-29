import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/bill_request_details.dart';
import 'package:buro_employee/repository/models/bill_submit_model.dart';
import 'package:buro_employee/repository/network/buro_repository.dart';
import 'package:equatable/equatable.dart';

import '../../models/bill_model.dart';
import '../add_bill_info_cubit/add_bill_info_cubit.dart';

part 'bill_details_state.dart';

class BillDetailsCubit extends Cubit<BillDetailsState> {
  final BuroRepository repository;

  BillDetailsCubit(this.repository) : super(BillDetailsInitialState());

  List<PlaceWithPrice> _morningDropDownList = [];
  List<PlaceWithPrice> _lunchNDinnerDropDownList = [];
  List<PlaceWithPrice> _residenceDropDownList = [];
  List<DailyNSpecialData> _dailyNSpecialBill = [];



  Future<BillRequestDetails?> getBillDetails(int applicationId) async {
    emit(BillDetailsInitialState());

    print('applicationId getBillDetails $applicationId');
    try {
      emit(BillDetailsLoadingState());
      var response = await repository.getBillRequestDetails(applicationId);
      emit(BillDetailsLoadedState(response));
      return response;
    } catch (e) {
      emit(BillDetailsErrorState(e));
    }
  }

  Future<BillSubmitModel?> billSubmit(List submitList) async {
    emit(BillDetailsInitialState());

    try {
      emit(BillDetailsLoadingState());
      var response = await repository.billSubmit(submitList);
      emit(BillSubmitLoadedState(response));
      return response;
    } catch (e) {
      emit(BillDetailsErrorState(e));
    }
  }

  void initState() {
    emit(BillDetailsInitialState());
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

    dailyNSpecialBill = response.data!;

    return response;
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
