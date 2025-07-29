part of 'buyer_verification_cubit.dart';

abstract class BuyerVerificationState extends Equatable {
  const BuyerVerificationState();

  @override
    List<Object> get props => [];
}

class BuyerVerificationInitialState extends BuyerVerificationState { }

class BuyerVerificationLoadingState extends BuyerVerificationState { }

class BuyerVerificationLoadedState extends BuyerVerificationState {
    final List<BuyerInformationEditData> data;

    BuyerVerificationLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class BuyerVerificationErrorState extends BuyerVerificationState {
    final error;

    BuyerVerificationErrorState(this.error);

    @override
    List<Object> get props => [error];
}
