abstract class UserCredentialsLoadingState {}

class InitialUserCredentialsLoadingState extends UserCredentialsLoadingState {}

class SuccessUserCredentialsLoadingState extends UserCredentialsLoadingState {
  SuccessUserCredentialsLoadingState();
}

class LoadingUserCredentialsLoadingState extends UserCredentialsLoadingState {}

class ErrorUserCredentialsLoadingState extends UserCredentialsLoadingState {
  final String message;
  ErrorUserCredentialsLoadingState(this.message);
}
