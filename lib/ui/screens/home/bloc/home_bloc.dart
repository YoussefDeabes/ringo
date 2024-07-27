import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(_onHomeInitial);
    on<CategoryEvent>(_onCategoryPagePressed);
    on<ProjectEvent>(_onProjectPagePressed);
    on<CalendarEvent>(_onCalendarPagePressed);
    on<ProfileEvent>(_onProfilePagePressed);
    on<AddEvent>(_onAddPressed);
    on<DrawerEvent>(_onDrawerPressed);
    on<NotificationEvent>(_onNotificationPressed);
  }

  _onHomeInitial(HomeInitialEvent event,emit){
    emit(HomeInitial());
  }

  _onCategoryPagePressed(CategoryEvent event, emit) {
    emit(CategoryPageState());
  }

  _onProjectPagePressed(ProjectEvent event, emit) {
    emit(ProjectPageState());
  }

  _onCalendarPagePressed(CalendarEvent event, emit) {
    emit(CalendarPageState());
  }

  _onProfilePagePressed(ProfileEvent event, emit) {
    emit(ProfilePageState());
  }

  _onAddPressed(AddEvent event, emit) {
    emit(AddState());
  }

  _onDrawerPressed(DrawerEvent event, emit) {
    emit(DrawerState());
  }

  _onNotificationPressed(NotificationEvent event, emit) {
    emit(NotificationState());
  }
}
