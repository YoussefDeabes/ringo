import 'package:ringo/bloc/lang/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:ringo/ui/screens/home/bloc/home_bloc.dart';
import 'package:ringo/ui/screens/login/bloc/login_bloc.dart';

class ProviderManager {
  static List<SingleChildWidget> providers = [
    BlocProvider<LanguageCubit>(
        create: (BuildContext context) => LanguageCubit()),
    BlocProvider<LoginBloc>(create: (BuildContext context) => LoginBloc()),
    BlocProvider<HomeBloc>(create: (BuildContext context) => HomeBloc()),
  ];
}
