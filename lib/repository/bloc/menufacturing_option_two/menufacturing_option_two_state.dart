part of 'menufacturing_option_two_cubit.dart';

abstract class ManufacturingOptionTwoState extends Equatable {
  const ManufacturingOptionTwoState();

  @override
    List<Object> get props => [];
}

class ManufacturingOptionTwoInitialState extends ManufacturingOptionTwoState { }

class ManufacturingOptionTwoLoadingState extends ManufacturingOptionTwoState { }

class ManufacturingOptionTwoLoadedState extends ManufacturingOptionTwoState {
    final  List<ManufacturingOptionTwo> data;

    ManufacturingOptionTwoLoadedState(this.data);

    @override
    List<Object> get props => [data];
}


class ManufecturingOptionTwoFromAPILoadedState extends ManufacturingOptionTwoState {
  final ManufecturingOptiontwoData data;

  ManufecturingOptionTwoFromAPILoadedState(this.data);

  @override
  List<Object> get props => [data];
}

class ManufacturingOptionTwoErrorState extends ManufacturingOptionTwoState {
    final error;

    ManufacturingOptionTwoErrorState(this.error);

    @override
    List<Object> get props => [error];
}
