import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/Leaveinfo.dart';
import 'package:buro_employee/repository/models/leave.dart';
import 'package:equatable/equatable.dart';

import '../../network/buro_repository.dart';

part 'leave_bloc_state.dart';

class LeaveBlocCubit extends Cubit<LeaveBlocState> {
  final BuroRepository repository;
  List<DivisionLeaveData> _divisionDropDownList = [];
  List<DistrictLeaveData> _districtDropDownList = [];
  List<RemainingLeaveInfoData> _remainingLeaveList = [];
  List<LeaveCountryData> _countryLeaveList = [];
  List<PlaceWithNameCode> _countryList = [];
  LeaveBlocCubit(this.repository) : super(LeaveBlocInitialState());



  Future<RemainingLeaveInfo?> getRemainingLeaveInfo() async {
    emit(LeaveBlocInitialState());


   /* try {*/
      var response = await repository.getRemainingLeaveInfo();
      response.data?.asMap().forEach((key, value) {
            _remainingLeaveList.add(value);
          });

      return response;
  /*  } catch (e) {

    }*/

  }

  Future<DivisionLeave?> getDivisionList() async {


    try {
      var response = await repository.getDivisionListLeave();

      response.data?.asMap().forEach((key, value) {
            _divisionDropDownList.add(value);
          });

      return response;
    } catch (e) {

    }





  }

  Future<LeaveCountry?> getCountryList() async {

   /* try {*/
      var response = await repository.getCountryList();
      PlaceWithNameCode placeWithNameCode;
      response.data?.asMap().forEach((key, value) {
            _countryLeaveList.add(value);

          });

      return response;
   /* } catch (e) {
      LeaveBlocErrorState(e);
    }*/

  }



  Future<DistrictLeave?> getDistrictListByDivision(var divisionCode) async {

    try {
      var response = await repository.getDistricttListByDivision(divisionCode);

      response.data?.asMap().forEach((key, value) {

            _districtDropDownList.add(value);
          });
      emit(LeaveBlocLoadedState(response));
      return response;

    } catch (e) {
      LeaveBlocErrorState(e);
    }



  }

  List<DivisionLeaveData> get divisionDropDownList => _divisionDropDownList;

  set divisionDropDownList(List<DivisionLeaveData> value) {
    _divisionDropDownList = value;
  }

  List<DistrictLeaveData> get districtDropDownList => _districtDropDownList;

  set districtDropDownList(List<DistrictLeaveData> value) {
    _districtDropDownList = value;
  }

  List<RemainingLeaveInfoData> get remainingLeaveList => _remainingLeaveList;

  set remainingLeaveList(List<RemainingLeaveInfoData> value) {
    _remainingLeaveList = value;
  }


  List<LeaveCountryData> get countryLeaveList => _countryLeaveList;

  set countryLeaveList(List<LeaveCountryData> value) {
    _countryLeaveList = value;
  }
}

class PlaceWithNameCode {
  late int id;
  late String name;
  late String code;

  PlaceWithNameCode(
      {required String name, required int id, required String code}) {
    this.id = id;
    this.name = name;
    this.code = code;
  }
}
