import 'package:ringo/bloc/lang/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

class ProviderManager {
  static List<SingleChildWidget> providers = [
    BlocProvider<LanguageCubit>(
        create: (BuildContext context) => LanguageCubit()),
  ];
}
