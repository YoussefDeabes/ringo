import 'package:flutter/material.dart';
import 'package:ringo/res/const_colors.dart';
import 'package:ringo/util/lang/app_localization.dart';
import 'package:ringo/util/lang/app_localization_keys.dart';

Widget noData() {
  return const Center(
    child: Text("No data"),
  );
}

/// reference
/// https://stackoverflow.com/a/55796929/2172590
Widget getEmptyWidget() {
  return const SizedBox.shrink();
}

Widget continueWithLineDivider({double? height, double? width}) {
  return Container(
    color: ConstColors.accent,
    width: width ?? double.infinity,
    height: height ?? 1,
    margin: const EdgeInsets.only(left: 25, right: 25),
  );
}

Widget lineDivider({double? height, double? width}) {
  return Container(
      color: ConstColors.textDisabled,
      width: width ?? double.infinity,
      height: height ?? 1);
}
