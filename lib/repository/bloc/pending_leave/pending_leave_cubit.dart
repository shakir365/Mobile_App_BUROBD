import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pending_leave_state.dart';

class PendingLeaveCubit extends Cubit<PendingLeaveState> {
  PendingLeaveCubit() : super(PendingLeaveInitialState());
}
