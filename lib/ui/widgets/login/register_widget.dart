import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ringo/res/const_colors.dart';
import 'package:ringo/ui/screens/login/bloc/login_bloc.dart';

class RegisterWidget extends StatefulWidget {
  final LoginBloc loginBloc;
  final String buttonText;
  final String doNotHaveAccountText;

  const RegisterWidget({
    super.key,
    required this.loginBloc,
    required this.buttonText,
    required this.doNotHaveAccountText
  });

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(TextSpan(children: [
        TextSpan(
            text: widget.doNotHaveAccountText,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: ConstColors.secondaryText,
            )),
        TextSpan(
            text: widget.buttonText,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: ConstColors.text,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => widget.loginBloc.add(RegisterAccountEvent())),
      ])),
    );
  }
}
