import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo/res/assets_paths.dart';
import 'package:ringo/res/const_colors.dart';
import 'package:ringo/ui/screens/home/bloc/home_bloc.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final HomeBloc homeBloc;
  final double width;

  const CustomBottomNavigationBar(
      {super.key, required this.homeBloc, required this.width});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
          color: ConstColors.disabled,
          boxShadow: [
            BoxShadow(
                color: ConstColors.disabled,
                offset: Offset(0, 2),
                blurRadius: 50),
          ]),
      child: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        shape: const AutomaticNotchedShape(RoundedRectangleBorder(
            side: BorderSide(color: ConstColors.app),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)))),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 70,
        color: ConstColors.white,
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: SvgPicture.asset(AssPaths.category,
                  colorFilter:
                      const ColorFilter.mode(ConstColors.app, BlendMode.srcIn)),
              onPressed: () {
                widget.homeBloc.add(CategoryEvent());
              },
            ),
            IconButton(
              icon: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is ProjectPageState) {
                    return SvgPicture.asset(AssPaths.selectedProject,
                        colorFilter: const ColorFilter.mode(
                            ConstColors.app, BlendMode.srcIn));
                  } else {
                    return SvgPicture.asset(AssPaths.project,
                        colorFilter: const ColorFilter.mode(
                            ConstColors.app, BlendMode.srcIn));
                  }
                },
              ),
              onPressed: () {
                widget.homeBloc.add(ProjectEvent());
              },
            ),
            SizedBox(width: widget.width * 0.2),
            IconButton(
              icon: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is CalendarPageState) {
                    return SvgPicture.asset(AssPaths.selectedCalendar,
                        colorFilter: const ColorFilter.mode(
                            ConstColors.app, BlendMode.srcIn));
                  } else {
                    return SvgPicture.asset(AssPaths.calendar,
                        colorFilter: const ColorFilter.mode(
                            ConstColors.app, BlendMode.srcIn));
                  }
                },
              ),
              onPressed: () {
                widget.homeBloc.add(CalendarEvent());
              },
            ),
            IconButton(
              icon: Image.asset(AssPaths.profilePng),
              onPressed: () {
                widget.homeBloc.add(ProfileEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
