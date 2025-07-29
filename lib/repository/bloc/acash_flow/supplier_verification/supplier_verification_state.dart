part of 'supplier_verification_cubit.dart';

abstract class SupplierVerificationState extends Equatable {
  const SupplierVerificationState();

  @override
    List<Object> get props => [];
}

class SupplierVerificationInitialState extends SupplierVerificationState { }

class SupplierVerificationLoadingState extends SupplierVerificationState { }

class SupplierVerificationLoadedState extends SupplierVerificationState {
    final List<SupplierInformationEditData> data;

    SupplierVerificationLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class SupplierVerificationErrorState extends SupplierVerificationState {
    final error;

    SupplierVerificationErrorState(this.error);

    @override
    List<Object> get props => [error];
}
