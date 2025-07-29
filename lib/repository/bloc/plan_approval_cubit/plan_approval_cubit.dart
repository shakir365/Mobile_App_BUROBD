import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/approval_action.dart';
import 'package:buro_employee/repository/models/plan_approval_request.dart';
import 'package:buro_employee/repository/network/buro_repository.dart';
import 'package:equatable/equatable.dart';

part 'plan_approval_state.dart';

class PlanApprovalCubit extends Cubit<PlanApprovalState> {


  BuroRepository repository;



  PlanApprovalCubit(this.repository) : super(PlanApprovalInitialState());

  Future<PlanApprovalRequest?> getPlanApprovalList() async {
    emit(PlanApprovalInitialState());
    try {
      emit(PlanApprovalLoadingState());
      var response = await repository.getPlanApproval();
      emit(PlanApprovalLoadedState(response));
      return response;

    } catch (e) {
      emit(PlanApprovalErrorState(e));
    }

    return null;
  }





  Future<ApprovalAction?> planApprovalActionAll(int planId,String actionType) async {
    try {

      var response = await repository.planApprovalActionAll(planId,actionType);

      return response;


    } catch (e) {

    }
  }




}
