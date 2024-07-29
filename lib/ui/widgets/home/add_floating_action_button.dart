import 'package:flutter/material.dart';
import 'package:ringo/ui/screens/home/bloc/home_bloc.dart';

class AddFloatingActionButton extends StatefulWidget {
  final HomeBloc homeBloc;
  final double height;
  final double width;

  const AddFloatingActionButton(
      {super.key,
      required this.homeBloc,
      required this.height,
      required this.width});

  @override
  State<AddFloatingActionButton> createState() =>
      _AddFloatingActionButtonState();
}

class _AddFloatingActionButtonState extends State<AddFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: widget.height / 40,
          left: widget.width / 2.3,
          child: Transform.scale(
            scale: 1.2,
            child: FloatingActionButton(
              onPressed: () {
                // widget.homeBloc.add(AddEvent());
              },
              child: const Icon(
                Icons.add,
                size: 40,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
