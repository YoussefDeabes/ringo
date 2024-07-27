part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginInitialEvent extends LoginEvent {}

class LoginPressedEvent extends LoginEvent {}

class ForgotPasswordEvent extends LoginEvent {}

class ContinueWithGoogleEvent extends LoginEvent {}

class ContinueWithFacebookEvent extends LoginEvent {}

class ContinueWithAppleEvent extends LoginEvent {}

class RegisterAccountEvent extends LoginEvent {}
