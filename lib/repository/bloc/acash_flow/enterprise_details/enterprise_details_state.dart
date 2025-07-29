part of 'enterprise_details_cubit.dart';

abstract class EnterpriseDetailsState extends Equatable {
  const EnterpriseDetailsState();

  @override
    List<Object> get props => [];
}

class EnterpriseDetailsInitialState extends EnterpriseDetailsState { }

class EnterpriseDetailsLoadingState extends EnterpriseDetailsState { }

class EnterpriseDetailsLoadedState extends EnterpriseDetailsState {
    final List<EnterpriseDetailsEditData> data;

    EnterpriseDetailsLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class EnterpriseDetailsErrorState extends EnterpriseDetailsState {
    final error;

    EnterpriseDetailsErrorState(this.error);

    @override
    List<Object> get props => [error];
}
