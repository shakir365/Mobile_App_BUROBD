part of 'department_list_cubit.dart';

abstract class DepartmentListState extends Equatable {
  const DepartmentListState();

  @override
    List<Object> get props => [];
}

class DepartmentListInitialState extends DepartmentListState { }

class DepartmentListLoadingState extends DepartmentListState { }

class DepartmentListLoadedState extends DepartmentListState {
    final List<DepartmentData> data;

    DepartmentListLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class DepartmentListErrorState extends DepartmentListState {
    final error;

    DepartmentListErrorState(this.error);

    @override
    List<Object> get props => [error];
}
