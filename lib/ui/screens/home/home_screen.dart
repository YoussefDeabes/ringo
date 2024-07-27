import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ringo/_base/widgets/base_stateful_widget.dart';
import 'package:ringo/res/const_colors.dart';
import 'package:ringo/ui/screens/home/bloc/home_bloc.dart';
import 'package:ringo/ui/widgets/home/add_floating_action_button.dart';
import 'package:ringo/ui/widgets/home/bottom_navigation_bar.dart';
import 'package:ringo/ui/widgets/home/custom_app_bar.dart';
import 'package:ringo/util/ui/feedback_controller.dart';

class HomeScreen extends BaseStatefulWidget {
  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  BaseState<HomeScreen> baseCreateState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen>
    with SingleTickerProviderStateMixin {
  HomeBloc get homeBloc => BlocProvider.of<HomeBloc>(context);

  @override
  void initState() {
    homeBloc.add(ProjectEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is DrawerState) {
          showToast("Drawer pressed");
        }
        if (state is NotificationState) {
          showToast("Notification pressed");
        }
        if (state is CategoryPageState) {
          showToast("Category page pressed");
        }
        if (state is AddState) {
          showToast("Add button pressed");
        }
        if (state is ProfilePageState) {
          showToast("Profile page pressed");
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(height: height),
          floatingActionButton: AddFloatingActionButton(
            height: height,
            width: width,
            homeBloc: homeBloc,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar:
              CustomBottomNavigationBar(homeBloc: homeBloc, width: width),
          extendBody: true,
          backgroundColor: ConstColors.scaffoldBackground,
        );
      },
    );
  }
}
