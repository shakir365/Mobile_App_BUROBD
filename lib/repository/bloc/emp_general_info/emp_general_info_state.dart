part of 'emp_general_info_cubit.dart';

class EmpGeneralInfoState extends Equatable {

  const EmpGeneralInfoState();

  @override
  List<Object> get props => [];

}

class EmpGeneralInfoInitialState extends EmpGeneralInfoState { }

class EmpGeneralInfoLoadingState extends EmpGeneralInfoState { }

class EmpGeneralInfoLoadedState extends EmpGeneralInfoState {
  final EmpGeneralInfoListModel data;

  EmpGeneralInfoLoadedState(this.data);

  @override
  List<Object> get props => [data];
}

class EmpGeneralInfoErrorState extends EmpGeneralInfoState {
  final error;

  EmpGeneralInfoErrorState(this.error);

  @override
  List<Object> get props => [error];
}
