import 'package:flutter/material.dart';
import 'package:ringo/res/const_colors.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Categories Screen",
        style: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 18, color: ConstColors.app),
      ),
    );
  }
}
