part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class ChangeEyeVisibalityState extends AuthenticationState {}

class LoadingLoginState extends AuthenticationState {}

class SuccessLoginState extends AuthenticationState {}

class FailedLoginState extends AuthenticationState {

  final String error;
  FailedLoginState(this.error);
}


class LoadingSignupState extends AuthenticationState {}

class SuccessSignupState extends AuthenticationState {}

class FailedSignupState extends AuthenticationState {

  final String error;
  FailedSignupState(this.error);
}

class LoadingCreateState extends AuthenticationState {}

class SuccessCreateState extends AuthenticationState {}

class FailedCreateState extends AuthenticationState {

  final String error;
  FailedCreateState(this.error);
}




