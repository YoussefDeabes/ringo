part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class CategoryPageState extends HomeState {}

class ProjectPageState extends HomeState {}

class CalendarPageState extends HomeState {}

class AddState extends HomeState {}

class ProfilePageState extends HomeState {}

class NotificationState extends HomeState {}

class DrawerState extends HomeState {}
