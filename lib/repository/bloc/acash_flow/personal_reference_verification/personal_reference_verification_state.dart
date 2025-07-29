part of 'personal_reference_verification_cubit.dart';

abstract class PersonalReferenceVerificationState extends Equatable {
  const PersonalReferenceVerificationState();

  @override
    List<Object> get props => [];
}

class PersonalReferenceVerificationInitialState extends PersonalReferenceVerificationState { }

class PersonalReferenceVerificationLoadingState extends PersonalReferenceVerificationState { }

class PersonalReferenceVerificationLoadedState extends PersonalReferenceVerificationState {
    final List<PersonalReferenceEditData> data;

    PersonalReferenceVerificationLoadedState(this.data);

    @override
    List<Object> get props => [data];
}

class PersonalReferenceVerificationErrorState extends PersonalReferenceVerificationState {
    final error;

    PersonalReferenceVerificationErrorState(this.error);

    @override
    List<Object> get props => [error];
}
