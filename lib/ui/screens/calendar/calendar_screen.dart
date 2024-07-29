import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ringo/_base/widgets/base_stateful_widget.dart';
import 'package:ringo/res/const_colors.dart';
import 'package:ringo/ui/widgets/calendar/schedule_tab.dart';
import 'package:ringo/ui/widgets/calendar/task_tab.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends BaseStatefulWidget {
  const CalendarScreen({super.key});

  @override
  BaseState<CalendarScreen> baseCreateState() => _CalendarScreenState();
}

class _CalendarScreenState extends BaseState<CalendarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.week;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController(
      initialScrollOffset: calculateInitialOffset(),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Container(
      color: ConstColors.scaffoldBackground,
      child: Column(
        children: [
          _calendarWidget(),
          TabBar(
            controller: _tabController,
            padding: EdgeInsets.symmetric(horizontal: width * 0.08),
            labelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: ConstColors.app),
            unselectedLabelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: ConstColors.secondaryText),
            tabs: const [
              Tab(
                text: 'Schedule',
              ),
              Tab(text: 'Task'),
            ],
          ),
          Expanded(
            child: Card(
              margin: EdgeInsets.zero,
              color: ConstColors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.02, horizontal: width * 0.06),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ScheduleTab(focusedDay: _focusedDay,height: height,width: width,),
                    TaskTab(
                      focusedDay: _focusedDay,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Widget methods ///////////////////////
///////////////////////////////////////////////////////////
  Widget _calendarWidget() {
    return Column(
      children: [
        _buildHeader(context),
        _buildHorizontalCalendar(),
        SizedBox(height: height * 0.02),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.02),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () async {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16))),
                    builder: (BuildContext context) {
                      return StatefulBuilder(builder: (context, setState) {
                        return Container(
                          padding: const EdgeInsets.all(16),
                          height: height * 0.70,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: width / 10),
                                  const Text(
                                    'Choose Date',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                              const Divider(thickness: 1),
                              SizedBox(height: height * 0.02),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Transform.scale(
                                    scale: 0.8,
                                    child: IconButton(
                                      icon: const Icon(
                                          Icons.arrow_back_ios_rounded),
                                      onPressed: () {
                                        setState(() {
                                          _focusedDay = DateTime(
                                              _focusedDay.year,
                                              _focusedDay.month - 1,
                                              _focusedDay.day);
                                        });
                                      },
                                    ),
                                  ),
                                  Text(
                                    DateFormat('MMMM yyyy').format(_focusedDay),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: ConstColors.text),
                                  ),
                                  Transform.scale(
                                    scale: 0.8,
                                    child: IconButton(
                                      icon: const Icon(
                                          Icons.arrow_forward_ios_rounded),
                                      onPressed: () {
                                        setState(() {
                                          _focusedDay = DateTime(
                                              _focusedDay.year,
                                              _focusedDay.month + 1,
                                              _focusedDay.day);
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: height * 0.02),
                              TableCalendar(
                                firstDay: DateTime.utc(2000, 1, 1),
                                lastDay: DateTime.utc(2100, 12, 31),
                                focusedDay: _focusedDay,
                                selectedDayPredicate: (day) {
                                  return isSameDay(_selectedDay, day);
                                },
                                onDaySelected: (selectedDay, focusedDay) {
                                  setState(() {
                                    _selectedDay = selectedDay;
                                    _focusedDay = focusedDay;
                                  }); // Close the bottom sheet
                                },
                                calendarFormat: CalendarFormat.month,
                                onFormatChanged: (format) {
                                  setState(() {
                                    calendarFormat = format;
                                  });
                                },
                                onPageChanged: (focusedDay) {
                                  setState(() {
                                    _focusedDay = focusedDay;
                                  });
                                },
                                startingDayOfWeek: StartingDayOfWeek.monday,

                                daysOfWeekStyle: DaysOfWeekStyle(
                                    weekdayStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: ConstColors.app),
                                    weekendStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: ConstColors.app),
                                    dowTextFormatter: (date, locale) =>
                                        DateFormat.EEEEE().format(date)),
                                calendarStyle: const CalendarStyle(
                                  defaultTextStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: ConstColors.app),
                                  selectedTextStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: ConstColors.white),
                                  weekendTextStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: ConstColors.app),
                                  disabledTextStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: ConstColors.calendarDisabled),
                                  outsideTextStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: ConstColors.calendarDisabled),
                                  selectedDecoration: BoxDecoration(
                                    color: ConstColors.app,
                                    shape: BoxShape.circle,
                                  ),
                                  todayTextStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: ConstColors.app),
                                  todayDecoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                headerVisible: false, // Hide default header
                              ),
                              const Divider(thickness: 1),
                              SizedBox(height: height * 0.02),
                              SizedBox(
                                width: width,
                                height: 56,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ButtonStyle(
                                      shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)))),
                                  child: const Text(
                                    'Continue',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: ConstColors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                    },
                  ).then((value) => setState(() {}));
                },
                child: Row(
                  children: [
                    Text(
                      DateFormat('MMMM yyyy').format(_focusedDay),
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: ConstColors.text),
                    ),
                    Transform.scale(
                      scale: 0.8,
                      child: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: Card(
                      elevation: 0,
                      color: ConstColors.scaffoldBackground,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: ConstColors.grey)),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_rounded),
                        onPressed: () {
                          setState(() {
                            _focusedDay = DateTime(_focusedDay.year,
                                _focusedDay.month - 1, _focusedDay.day);
                          });
                        },
                      ),
                    ),
                  ),
                  Transform.scale(
                    scale: 0.8,
                    child: Card(
                      elevation: 0,
                      color: ConstColors.scaffoldBackground,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: ConstColors.grey)),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_rounded),
                        onPressed: () {
                          setState(() {
                            _focusedDay = DateTime(_focusedDay.year,
                                _focusedDay.month + 1, _focusedDay.day);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalCalendar() {
    int daysInMonth = getDaysInMonth(_focusedDay);
    return SizedBox(
      height: 68,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        itemCount: daysInMonth,
        // Use dynamic item count based on month length
        itemBuilder: (context, index) {
          DateTime day =
              _focusedDay.add(Duration(days: index - _focusedDay.day + 1));
          bool isSelected = day.day == _selectedDay?.day;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDay = day;
                _focusedDay = day;
              });
            },
            child: Container(
              width: 44,
              height: 68,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: isSelected ? ConstColors.app : ConstColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(vertical: height * 0.01),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('E').format(day),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: isSelected ? ConstColors.white : ConstColors.app,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    DateFormat('d').format(day),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: isSelected ? ConstColors.white : ConstColors.app,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  ///////////////////////////////////////////////////////////
//////////////////// Helper methods ///////////////////////
///////////////////////////////////////////////////////////

  double calculateInitialOffset() {
    return (_focusedDay.day - 1) *
        52.0;
  }

  void scrollToDay(int index) {
    final offset = index * 52.0;
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  int getDaysInMonth(DateTime date) {
    var firstDayThisMonth = DateTime(date.year, date.month, 1);
    var firstDayNextMonth = DateTime(date.year, date.month + 1, 1);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }
}
