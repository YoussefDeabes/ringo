import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ringo/res/const_colors.dart';
import 'package:ringo/ui/widgets/calendar/timeline_event.dart';

class ScheduleTab extends StatefulWidget {
  final DateTime focusedDay;
  final double height;
  final double width;

  const ScheduleTab(
      {super.key,
      required this.focusedDay,
      required this.height,
      required this.width});

  @override
  State<ScheduleTab> createState() => _ScheduleTabState();
}

class _ScheduleTabState extends State<ScheduleTab> {
  // Mock data for demonstration.
  final Map<DateTime, List<TimelineEvent>> _events = {
    DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day):
        [
      TimelineEvent(
        startTime: DateTime(2024, 7, 29, 9, 0),
        endTime: DateTime(2024, 7, 29, 10, 0),
        title:
            'Sprint Review Period ${DateTime.now().day} in ${DateFormat.MMMM().format(DateTime.now())} ${DateTime.now().year}',
        color1: ConstColors.lightPurple,
        color2: ConstColors.purple,
      ),
      TimelineEvent(
        startTime: DateTime(2024, 7, 29, 10, 0),
        endTime: DateTime(2024, 7, 29, 11, 0),
        title: 'Meeting with Client',
        color1: ConstColors.lightOrange,
        color2: ConstColors.orange,
      ),
      TimelineEvent(
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 11, 0),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 12, 0),
        title: 'Daily Standup',
        color1: ConstColors.lightGreen,
        color2: ConstColors.green,
      ),
    ],
    DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 1): [
      TimelineEvent(
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 1, 9, 0),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 1, 10, 0),
        title:
            'Sprint Review Period ${DateTime.now().day + 1} in ${DateFormat.MMMM().format(DateTime.now())} ${DateTime.now().year}',
        color1: ConstColors.lightPurple,
        color2: ConstColors.purple,
      ),
      TimelineEvent(
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 1, 10, 0),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 1, 11, 0),
        title: 'Daily Standup',
        color1: ConstColors.lightGreen,
        color2: ConstColors.green,
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // _scheduleTab(),
        Expanded(
          child: Stack(
            children: [
              _buildTimeline(),
              _buildCurrentTimeIndicator(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEventCard(TimelineEvent event) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 8,
          height: 80,
          decoration: BoxDecoration(
            color: event.color2,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 80,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: event.color1,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_filled,
                      size: 16,
                      color: ConstColors.secondaryText,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${DateFormat.jm().format(event.startTime)} - ${DateFormat.jm().format(event.endTime)}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: ConstColors.taskDue),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeline() {
    List<TimelineEvent> events = _getScheduleForDay(widget.focusedDay);
    List<TimelineEvent> dayEvents = events.where((event) {
      return event.startTime.year == widget.focusedDay.year &&
          event.startTime.month == widget.focusedDay.month &&
          event.startTime.day == widget.focusedDay.day;
    }).toList();
    if (events.isEmpty) {
      return const Center(
        child: Text(
          'No scheduled events for the selected day.',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: ConstColors.app),
        ),
      );
    }
    return ListView.builder(
      itemCount: dayEvents.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        TimelineEvent event = dayEvents[index];
        return Container(
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat.Hm().format(event.startTime),
                    style: const TextStyle(
                        color: ConstColors.text,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  if (dayEvents.length == index + 1)
                    Text(
                      DateFormat.Hm().format(event.endTime),
                      style: const TextStyle(
                          color: ConstColors.text,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                ],
              ),
              Expanded(
                child: Transform.scale(
                  scale: 0.8,
                  child: Container(
                    alignment: Alignment.topCenter,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: ConstColors.secondaryText, width: 0.5),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: 8.0, left: widget.width * 0.02),
                            child: _buildEventCard(
                              events[index],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCurrentTimeIndicator() {
    if (!_isToday(widget.focusedDay)) {
      return const SizedBox.shrink();
    }

    final now = TimeOfDay.now();
    final double topOffset = (now.hour * 60.0 + now.minute) / 2;

    return Positioned(
      top: topOffset,
      child: SizedBox(
        // width: widget.width * 0.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: widget.width * 0.04),
              alignment: Alignment.center,
              child: Text(
                DateFormat.Hm().format(DateTime.now()),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: ConstColors.text,
                ),
              ),
            ),
            SizedBox(
              width: widget.width * 0.01,
            ),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: ConstColors.text,
                  width: 2.0,
                ),
              ),
            ),
            Container(
              height: 1,
              width: widget.width * 0.62,
              color: ConstColors.text,
            ),
          ],
        ),
      ),
    );
  }

  bool _isToday(DateTime day) {
    final now = DateTime.now();
    return day.year == now.year && day.month == now.month && day.day == now.day;
  }

  List<TimelineEvent> _getScheduleForDay(DateTime date) {
    DateTime day = DateTime.utc(date.year, date.month, date.day);
    return _events[day] ?? [];
  }
}
