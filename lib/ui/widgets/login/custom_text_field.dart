import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo/_base/widgets/base_stateful_widget.dart';
import 'package:ringo/res/assets_paths.dart';
import 'package:ringo/res/const_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validation;
  final bool obscureText;
  final double width;
  final bool isPassword;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? hint;

  const CustomTextField(
      {super.key,
      this.keyboardType,
      this.textInputAction,
      this.onSaved,
      this.validation,
      required this.width,
      required this.obscureText,
      this.suffixIcon,
      this.controller,
      this.hint,
      required this.isPassword});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPass = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.width * 0.01),
      child: TextFormField(
        obscureText: widget.obscureText ? showPass : false,
        style: const TextStyle(
            color: ConstColors.text, fontWeight: FontWeight.w600, fontSize: 16),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ConstColors.secondaryText),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPass = !showPass;
                    });
                  },
                  icon: SvgPicture.asset(
                    showPass ? AssPaths.eyeSlash : AssPaths.eye,
                    colorFilter: const ColorFilter.mode(
                        ConstColors.secondaryText, BlendMode.srcIn),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
