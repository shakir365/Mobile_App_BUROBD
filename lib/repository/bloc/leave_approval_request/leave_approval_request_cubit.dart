import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';


import '../../../../repository/network/buro_repository.dart';
import '../../models/leaveapprovalaction.dart';
import '../../models/leaveapprovalrequest.dart';
import 'leave_approval_request_state.dart';




class LeaveApprovalRequestCubit extends Cubit<LeaveApprovalRequestState> {
  BuroRepository repository;

  //RequestCubit(this.repository) : super(RequestInitialState());

  LeaveApprovalRequestCubit(this.repository) : super(LeaveApprovalRequestInitialState());

  Future<ApprovalRequestForLeave?> getApprovalListforleave() async {
    emit(LeaveApprovalRequestInitialState());

   // try {
      emit(LeaveApprovalRequestLoadingState());
      var response = await repository.getPendingLeaveListForApprover();
      //emit(LeaveApprovalRequestLoadedState(response));
      //return response;
   /* } catch (e) {
      emit(ApprovalRequestErrorState(e));
    }*/
  }

  Future<ApprovalRequestForLeave?> cancelApprovalforleave() async {
    emit(LeaveApprovalRequestInitialState());

   /* try {*/
      emit(LeaveApprovalRequestLoadingState());
      var response = await repository.getApprovalRequestForLeave();
      emit(LeaveApprovalRequestLoadedState(response));
      return response;
   /* } catch (e) {
      emit(ApprovalRequestErrorState(e));
    }*/
  }

  Future<ApprovalActionforleave?> approvalActionAllforleave(
      int applicationId, String actionType) async {
   /* try {*/
      //emit(CancelRequestLoadingState());
      var response =
          await repository.leaveApprovalActionAll(applicationId, actionType);
      //emit(CancelAllLoadedState(response));
      return response;
    /*} catch (e) {
      //emit(RequestErrorState(e));
    }*/
  }
}
