



import 'package:equatable/equatable.dart';

import '../../models/leaveapprovalrequest.dart';




abstract class LeaveApprovalRequestState extends Equatable {
  const LeaveApprovalRequestState();

  @override
    List<Object> get props => [];
}

class LeaveApprovalRequestInitialState extends LeaveApprovalRequestState { }

class LeaveApprovalRequestLoadingState extends LeaveApprovalRequestState { }

class LeaveApprovalRequestLoadedState extends LeaveApprovalRequestState {
    final ApprovalRequestForLeave approvalRequest;

    LeaveApprovalRequestLoadedState(this.approvalRequest);

    @override
    List<Object> get props => [approvalRequest];
}

class ApprovalRequestErrorState extends LeaveApprovalRequestState {
    final error;

    ApprovalRequestErrorState(this.error);

    @override
    List<Object> get props => [error];
}
