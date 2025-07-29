import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../repository/network/buro_repository.dart';
import '../../models/leaveapprovalaction.dart';
import '../../models/leaveapprovalrequestdetails.dart';

part 'approval_details_state.dart';

class LeaveApprovalDetailsCubit extends Cubit<ApprovalDetailsStateforleave> {
  BuroRepository repository;

  //RequestCubit(this.repository) : super(RequestInitialState());

  LeaveApprovalDetailsCubit(this.repository)
      : super(ApprovalDetailsInitialState());

  Future<ApprovalRequestDetailsforleave?> getApprovalDetailsforleave(
      int applicationId) async {
    emit(ApprovalDetailsInitialState());

   /* try {*/
      emit(ApprovalDetailsLoadingState());
      var response = await repository.getApprovalDetailsForLeave(applicationId);
      print(response.toString());
      emit(ApprovalDetailsLoadedState(response));
      return response;
   /* } catch (e) {
      emit(ApprovalDetailsErrorState(e));
    }*/
  }

  Future<ApprovalActionforleave?> approvalAction(
      int appDetailsId, int applicationId, String actionType) async {
    try {
      //emit(CancelRequestLoadingState());
      var response = await repository.approvalActionforleave(
          appDetailsId, applicationId, actionType);
      //emit(RequestCancelLoadedState(response));
      return response;
    } catch (e) {
      //emit(RequestDetailsErrorState(e));
    }
  }
}
