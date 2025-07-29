part of 'zone_list_cubit.dart';

abstract class ZoneListState extends Equatable {
  const ZoneListState();

  @override
    List<Object> get props => [];
}

class ZoneListInitialState extends ZoneListState { }

class ZoneListLoadingState extends ZoneListState { }

class ZoneListLoadedState extends ZoneListState {
    final List<ZoneData> zone;

    ZoneListLoadedState(this.zone);

    @override
    List<Object> get props => [zone];
}

class ZoneListErrorState extends ZoneListState {
    final error;

    ZoneListErrorState(this.error);

    @override
    List<Object> get props => [error];
}
