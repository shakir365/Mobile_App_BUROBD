import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/branch.dart';
import 'package:equatable/equatable.dart';

import '../../repository/network/buro_repository.dart';

part 'branch_list_state.dart';

class BranchListCubit extends Cubit<BranchListState> {
  final BuroRepository repository;

  BranchListCubit(this.repository) : super(BranchListInitialState());

  List<BranchData> _branchList = [];



  Future<Branch> getBranchList() async {
    emit(BranchListInitialState());
    // try {
    emit(BranchListLoadingState());
    var response = await repository.getBranchListApa();

    _branchList = response.data;

    response.data!.insert(0, BranchData(branchID:0,branchCode: '00',branchName: 'Select'));
    //emit(DesignationListLoadedState(response));
    _selectBranch = response.data.first;
    emit(BranchListLoadedState(response));
    return response;
    // } catch (e) {
    //   emit(AnnualAppraisalErrorState(e));
    // }
  }



  late BranchData _selectBranch  ;

  BranchData get selectBranch => _selectBranch;

  set selectBranch(BranchData value) {
    _selectBranch = value;
  }


  List<BranchData> get branchList => _branchList;



  void clearBranchList(){
    _branchList = [];

  }


  void clearData(){
   //_selectBranch = null;

  }




}
