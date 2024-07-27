import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo/res/const_colors.dart';

class AccountLoginByType extends StatefulWidget {
  final String logo;
  final String title;
  final Function() onPressed;

  const AccountLoginByType(
      {super.key,
      required this.logo,
      required this.title,
      required this.onPressed});

  @override
  State<AccountLoginByType> createState() => _AccountLoginByTypeState();
}

class _AccountLoginByTypeState extends State<AccountLoginByType> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: ConstColors.shadowColor),
              borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            leading: SvgPicture.asset(widget.logo),
            title: Center(
                child: Text(
              widget.title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: ConstColors.text),
            )),
            trailing: const SizedBox(),
          )),
    );
  }
}
