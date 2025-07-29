part of 'approval_details_cubit.dart';

abstract class ApprovalDetailsStateforleave extends Equatable {
  const ApprovalDetailsStateforleave();

  @override
    List<Object> get props => [];
}

class ApprovalDetailsInitialState extends ApprovalDetailsStateforleave { }

class ApprovalDetailsLoadingState extends ApprovalDetailsStateforleave { }

class ApprovalDetailsLoadedState extends ApprovalDetailsStateforleave {
    final ApprovalRequestDetailsforleave approvalRequestDetails;

    ApprovalDetailsLoadedState(this.approvalRequestDetails);

    @override
    List<Object> get props => [approvalRequestDetails];
}

class ApprovalDetailsErrorState extends ApprovalDetailsStateforleave {
    final error;

    ApprovalDetailsErrorState(this.error);

    @override
    List<Object> get props => [error];
}
