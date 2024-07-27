part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {}

final class ForgotPasswordState extends LoginState {}

final class ContinueWithGoogleState extends LoginState {}

final class ContinueWithFacebookState extends LoginState {}

final class ContinueWithAppleState extends LoginState {}

final class RegisterAccountState extends LoginState {}
