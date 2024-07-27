part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class CategoryEvent extends HomeEvent {}

class ProjectEvent extends HomeEvent {}

class AddEvent extends HomeEvent {}

class CalendarEvent extends HomeEvent {}

class ProfileEvent extends HomeEvent {}

class DrawerEvent extends HomeEvent {}

class NotificationEvent extends HomeEvent {}
