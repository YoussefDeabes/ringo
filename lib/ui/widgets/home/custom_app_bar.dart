import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo/res/assets_paths.dart';
import 'package:ringo/res/const_colors.dart';
import 'package:ringo/ui/screens/home/bloc/home_bloc.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 40);
  final double height;

  const CustomAppBar({super.key, required this.height});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.3,
      backgroundColor: ConstColors.white,
      centerTitle: false,
      toolbarHeight: widget.height * 0.1,
      leading: Transform.scale(
        scale: 1.3,
        child: IconButton(
          onPressed: () {
            // homeBloc.add(DrawerEvent());
          },
          icon: const Icon(
            Icons.menu,
            color: ConstColors.app,
          ),
        ),
      ),
      title: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is ProjectPageState) {
            return const Text(
              "Project summary",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: ConstColors.app),
            );
          } else if (state is CalendarPageState) {
            return const Text(
              "Calendar",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: ConstColors.app),
            );
          } else {
            return const Text(
              "",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: ConstColors.app),
            );
          }
        },
      ),
      actions: [
        Transform.scale(
          scale: 1.3,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Stack(
              children: [
                Positioned(
                  left: 25,
                  top: 33,
                  child: SvgPicture.asset(AssPaths.ellipseRed),
                ),
                Center(
                  child: IconButton(
                    onPressed: () {
                      // homeBloc.add(NotificationEvent());
                    },
                    icon: SvgPicture.asset(AssPaths.notification),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
