part of 'add_bill_info_cubit.dart';

abstract class AddBillInfoState extends Equatable {
  const AddBillInfoState();

  @override
    List<Object> get props => [];
}

class AddBillInfoInitialState extends AddBillInfoState { }

class AddBillInfoLoadingState extends AddBillInfoState { }

class AddBillInfoLoadedState extends AddBillInfoState {
    final data;

    AddBillInfoLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class AddBillInfoDropDownLoadedState extends AddBillInfoState {
    final  List<PlaceWithPrice> data;

    AddBillInfoDropDownLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class AddBillInfoErrorState extends AddBillInfoState {
    final error;

    AddBillInfoErrorState(this.error);

    @override
    List<Object> get props => [error];
}
