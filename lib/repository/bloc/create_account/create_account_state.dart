part of 'create_account_cubit.dart';

abstract class CreateAccountState extends Equatable {
  const CreateAccountState();

  @override
  List<Object> get props => [];
}

class CreateAccountInitialState extends CreateAccountState {}

class CreateAccountLoadingState extends CreateAccountState {}

class CreateAccountLoadedState extends CreateAccountState {
  final EmpGeneralInfoListModel data;

  CreateAccountLoadedState(this.data);

  @override
  List<Object> get props => [data];
}



class CreateAccountErrorState extends CreateAccountState {
  final error;

  CreateAccountErrorState(this.error);

  @override
  List<Object> get props => [error];
}
