import 'package:flutter/material.dart';
import 'package:ringo/_base/widgets/base_stateless_widget.dart';
import 'package:ringo/res/const_colors.dart';

//ignore: must_be_immutable
class TextFieldTitle extends BaseStatelessWidget {
  final String title;
  TextFieldTitle({super.key,required this.title});

  @override
  Widget baseBuild(BuildContext context) {
    return Text(title,
        style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: ConstColors.text));
  }
}
