import 'package:flutter/material.dart';
import 'package:ringo/_base/widgets/base_stateless_widget.dart';
import 'package:ringo/res/const_colors.dart';
import 'package:ringo/util/lang/app_localization_keys.dart';

//ignore: must_be_immutable
class AccountsLoginTitle extends BaseStatelessWidget {
  AccountsLoginTitle({super.key});

  @override
  Widget baseBuild(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.center,
      child: Text(
        translate(LangKeys.loginWithAccount),
        style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: ConstColors.secondaryText),
      ),
    );
  }
}
