part of 'apa_emp_info_cubit.dart';

abstract class ApaEmpInfoState extends Equatable {
  const ApaEmpInfoState();

  @override
    List<Object> get props => [];
}

class ApaEmpInfoInitialState extends ApaEmpInfoState { }

class ApaEmpInfoLoadingState extends ApaEmpInfoState { }

class ApaEmpInfoLoadedState extends ApaEmpInfoState {
    final ApaEmpBasicinfo apaEmpBasicInfo;

    ApaEmpInfoLoadedState(this.apaEmpBasicInfo);

    @override
    List<Object> get props => [apaEmpBasicInfo];
}

class ApaEmpInfoErrorState extends ApaEmpInfoState {
    final error;

    ApaEmpInfoErrorState(this.error);

    @override
    List<Object> get props => [error];
}
