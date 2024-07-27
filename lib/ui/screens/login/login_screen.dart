import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo/_base/widgets/base_stateful_widget.dart';
import 'package:ringo/res/assets_paths.dart';
import 'package:ringo/res/const_colors.dart';
import 'package:ringo/ui/screens/login/bloc/login_bloc.dart';
import 'package:ringo/ui/widgets/login/account_login_by_type.dart';
import 'package:ringo/ui/widgets/login/accounts_login_title.dart';
import 'package:ringo/ui/widgets/login/custom_text_field.dart';
import 'package:ringo/ui/widgets/login/forgot_password_button.dart';
import 'package:ringo/ui/widgets/login/header_title.dart';
import 'package:ringo/ui/widgets/login/login_button.dart';
import 'package:ringo/ui/widgets/login/register_widget.dart';
import 'package:ringo/ui/widgets/login/textfield_title.dart';
import 'package:ringo/util/lang/app_localization_keys.dart';
import 'package:ringo/util/ui/feedback_controller.dart';

class LoginScreen extends BaseStatefulWidget {
  static const routeName = '/login-screen';

  const LoginScreen({super.key});

  @override
  BaseState<LoginScreen> baseCreateState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> {
  LoginBloc get loginBloc => BlocProvider.of<LoginBloc>(context);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showPass = false;

  @override
  void initState() {
    loginBloc.add(LoginInitialEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: _getBody(),
      ),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Widget methods ///////////////////////
///////////////////////////////////////////////////////////

  Widget _getBody() {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is ForgotPasswordState) {
          showToast("Forgot password pressed");
        }
        if (state is LoginSuccessState) {
          showToast("Login pressed");
        }
        if (state is ContinueWithGoogleState) {
          showToast("Continue with google pressed");
        }
        if (state is ContinueWithFacebookState) {
          showToast("Continue with facebook pressed");
        }
        if (state is ContinueWithAppleState) {
          showToast("Continue with apple pressed");
        }
        if (state is RegisterAccountState) {
          showToast("Register here pressed");
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.08),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.02),
                    child: HeaderTitle(isTitle: true),
                  ),
                  HeaderTitle(isTitle: false),
                  SizedBox(height: height * 0.04),
                  TextFieldTitle(title: translate(LangKeys.username)),
                  CustomTextField(
                    isPassword: false,
                    obscureText: false,
                    width: width,
                    hint: translate(LangKeys.enterEmail),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {},
                    validation: (value) {
                      return;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: height * 0.04),
                  TextFieldTitle(title: translate(LangKeys.password)),
                  CustomTextField(
                    isPassword: true,
                    obscureText: true,
                    width: width,
                    hint: translate(LangKeys.enterPassword),
                    keyboardType: TextInputType.text,
                    onSaved: (value) {},
                    validation: (value) {
                      return;
                    },
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  ForgotPasswordButton(
                    loginBloc: loginBloc,
                    text: translate(LangKeys.forgotPassword),
                  ),
                  SizedBox(height: height * 0.02),
                  LoginButton(
                    text: translate(LangKeys.login),
                    loginBloc: loginBloc,
                    width: width,
                    height: height,
                  ),
                  SizedBox(height: height * 0.03),
                  AccountsLoginTitle(),
                  SizedBox(height: height * 0.03),
                  AccountLoginByType(
                      logo: AssPaths.google,
                      title: translate(LangKeys.continueWithGoogle),
                      onPressed: () {
                        loginBloc.add(ContinueWithGoogleEvent());
                      }),
                  SizedBox(height: height * 0.01),
                  AccountLoginByType(
                      logo: AssPaths.facebook,
                      title: translate(LangKeys.continueWithFacebook),
                      onPressed: () {
                        loginBloc.add(ContinueWithFacebookEvent());
                      }),
                  SizedBox(height: height * 0.01),
                  AccountLoginByType(
                      logo: AssPaths.apple,
                      title: translate(LangKeys.continueWithApple),
                      onPressed: () {
                        loginBloc.add(ContinueWithAppleEvent());
                      }),
                  SizedBox(height: height * 0.04),
                  RegisterWidget(
                      loginBloc: loginBloc,
                      buttonText: translate(LangKeys.registerHere),
                      doNotHaveAccountText:
                          translate(LangKeys.doNotHaveAccount)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
