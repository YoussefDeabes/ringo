import 'package:ringo/res/const_colors.dart';
import 'package:flutter/material.dart';

void modalSheet(
  BuildContext context,
  Widget child,
) {
  showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      enableDrag: true,
      isDismissible: true,
      backgroundColor: ConstColors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(50),
        topLeft: Radius.circular(50),
      )),
      context: context,
      builder: (context) {
        return child;
      });
}
