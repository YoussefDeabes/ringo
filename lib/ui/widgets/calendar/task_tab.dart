import 'package:flutter/material.dart';
import 'package:ringo/_base/widgets/base_stateful_widget.dart';
import 'package:ringo/res/const_colors.dart';
import 'package:ringo/ui/widgets/calendar/task_item.dart';

class TaskTab extends BaseStatefulWidget {
  final DateTime focusedDay;

  const TaskTab({super.key, required this.focusedDay});

  @override
  BaseState<TaskTab> baseCreateState() => _TaskTabState();
}

class _TaskTabState extends BaseState<TaskTab> {
  // Mock data for demonstration.
  final Map<DateTime, List<TaskItem>> _tasks = {
    DateTime.utc(2024, 7, 29): [
      TaskItem(
        title: 'Meeting Concept',
        dueDate: 'Mon, 12 Jan 2023',
        completed: true,
      ),
      TaskItem(
        title: 'Information Architecture',
        dueDate: 'Mon, 12 Jan 2023',
        completed: true,
      ),
      TaskItem(
        title: 'Monitoring Project',
        dueDate: 'Mon, 12 Jan 2023',
        completed: false,
      ),
      TaskItem(
        title: 'Daily Standup',
        dueDate: 'Mon, 12 Jan 2023',
        completed: true,
      ),
    ],
    DateTime.utc(2024, 7, 30): [
      TaskItem(
        title: 'Daily Standup',
        dueDate: 'Mon, 12 Jan 2023',
        completed: true,
      ),
    ],
  };

  @override
  Widget baseBuild(BuildContext context) {
    return _tasksTab();
  }

  Widget _tasksTab() {
    List<TaskItem> tasks = _getScheduleForDay(widget.focusedDay);
    if (tasks.isEmpty) {
      return const Center(
        child: Text(
          'No tasks for the selected day.',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: ConstColors.app),
        ),
      );
    }
    return Container(
      color: ConstColors.white,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8)
            ),
            child: tasks[index],
          );
        },
      ),
    );
  }

  List<TaskItem> _getScheduleForDay(DateTime date) {
    DateTime day = DateTime.utc(date.year, date.month, date.day);
    return _tasks[day] ?? [];
  }
}
