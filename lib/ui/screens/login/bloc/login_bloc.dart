import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginInitialEvent>(_onLoginInitialEvent);
    on<ForgotPasswordEvent>(_onForgotPasswordPressed);
    on<LoginPressedEvent>(_onLoginPressed);
    on<ContinueWithGoogleEvent>(_onContinueWithGoogle);
    on<ContinueWithFacebookEvent>(_onContinueWithFacebook);
    on<ContinueWithAppleEvent>(_onContinueWithApple);
    on<RegisterAccountEvent>(_onRegisterAccount);
  }

  _onLoginInitialEvent(LoginInitialEvent event, emit) {
    emit(LoginInitial());
  }

  _onForgotPasswordPressed(ForgotPasswordEvent event, emit) {
    emit(LoginLoadingState());
    emit(ForgotPasswordState());
  }

  _onLoginPressed(LoginPressedEvent event, emit) {
    emit(LoginLoadingState());
    emit(LoginSuccessState());
  }

  _onContinueWithGoogle(ContinueWithGoogleEvent event, emit) {
    emit(LoginLoadingState());
    emit(ContinueWithGoogleState());
  }

  _onContinueWithFacebook(ContinueWithFacebookEvent event, emit) {
    emit(LoginLoadingState());
    emit(ContinueWithFacebookState());
  }

  _onContinueWithApple(ContinueWithAppleEvent event, emit) {
    emit(LoginLoadingState());
    emit(ContinueWithAppleState());
  }

  _onRegisterAccount(RegisterAccountEvent event, emit) {
    emit(LoginLoadingState());
    emit(RegisterAccountState());
  }
}
