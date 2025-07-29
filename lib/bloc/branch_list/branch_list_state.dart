part of 'branch_list_cubit.dart';

abstract class BranchListState extends Equatable {
  const BranchListState();

  @override
    List<Object> get props => [];
}

class BranchListInitialState extends BranchListState { }

class BranchListLoadingState extends BranchListState { }

class BranchListLoadedState extends BranchListState {
    final data;

    BranchListLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class BranchListErrorState extends BranchListState {
    final error;

    BranchListErrorState(this.error);

    @override
    List<Object> get props => [error];
}
