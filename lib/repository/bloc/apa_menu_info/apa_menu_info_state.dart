part of 'apa_menu_info_cubit.dart';

abstract class ApaMenuInfoState extends Equatable {
  const ApaMenuInfoState();

  @override
    List<Object> get props => [];
}

class ApaMenuInfoInitialState extends ApaMenuInfoState { }

class ApaMenuInfoLoadingState extends ApaMenuInfoState { }

class ApaMenuInfoLoadedState extends ApaMenuInfoState {
    final EmpMenuInformation empMenuInformation;

    ApaMenuInfoLoadedState(this.empMenuInformation);

    @override
    List<Object> get props => [empMenuInformation];
}

class ApaMenuInfoErrorState extends ApaMenuInfoState {
    final error;

    ApaMenuInfoErrorState(this.error);

    @override
    List<Object> get props => [error];
}
