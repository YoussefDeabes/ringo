import 'package:flutter/material.dart';
import 'package:ringo/res/const_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "profile Screen",
        style: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 18, color: ConstColors.app),
      ),
    );
  }
}

