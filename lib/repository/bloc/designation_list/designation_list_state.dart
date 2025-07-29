part of 'designation_list_cubit.dart';

abstract class DesignationListState extends Equatable {
  const DesignationListState();

  @override
    List<Object> get props => [];
}

class DesignationListInitialState extends DesignationListState { }

class DesignationListLoadingState extends DesignationListState { }

class DesignationListLoadedState extends DesignationListState {
    final List<DesignationData> designation;

    DesignationListLoadedState(this.designation);

    @override
    List<Object> get props => [designation];
}

class DesignationListErrorState extends DesignationListState {
    final error;

    DesignationListErrorState(this.error);

    @override
    List<Object> get props => [error];
}
