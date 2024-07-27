import 'package:flutter/material.dart';
import 'package:ringo/_base/widgets/base_stateless_widget.dart';
import 'package:ringo/res/const_colors.dart';
import 'package:ringo/util/lang/app_localization_keys.dart';

//ignore: must_be_immutable
class HeaderTitle extends BaseStatelessWidget {
  final bool isTitle;

  HeaderTitle({super.key, required this.isTitle});

  @override
  Widget baseBuild(BuildContext context) {
    return Text(
      isTitle
          ? translate(LangKeys.login)
          : translate(LangKeys.signInToYourAccount),
      style: TextStyle(
          fontSize: isTitle ? 24 : 14,
          fontWeight: isTitle ? FontWeight.w700 : FontWeight.w500,
          color: isTitle ? ConstColors.text : ConstColors.secondaryText),
    );
  }
}
