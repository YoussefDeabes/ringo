import 'package:flutter/material.dart';
import 'package:ringo/ui/screens/login/bloc/login_bloc.dart';

class ForgotPasswordButton extends StatefulWidget {
  final LoginBloc loginBloc;
  final String text;

  const ForgotPasswordButton(
      {super.key, required this.loginBloc, required this.text});

  @override
  State<ForgotPasswordButton> createState() => _ForgotPasswordButtonState();
}

class _ForgotPasswordButtonState extends State<ForgotPasswordButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
        onPressed: () {
          widget.loginBloc.add(ForgotPasswordEvent());
        },
        child: Text(
          widget.text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
