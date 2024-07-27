import 'package:flutter/material.dart';
import 'package:ringo/ui/screens/login/bloc/login_bloc.dart';

class LoginButton extends StatefulWidget {
  final String text;
  final double width;
  final double height;
  final LoginBloc loginBloc;

  const LoginButton(
      {super.key,
      required this.text,
      required this.loginBloc,
      required this.width,
      required this.height});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width,
        height: widget.height * 0.06,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: ElevatedButton(
              onPressed: () {
                widget.loginBloc.add(LoginPressedEvent());
              },
              child: Text(
                widget.text,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              )),
        ));
  }
}
