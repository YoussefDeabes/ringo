import 'package:flutter/material.dart';
import 'package:ringo/res/const_colors.dart';

class TaskItem extends StatefulWidget {
  final String title;
  final String dueDate;
  bool completed;

  TaskItem({
    super.key,
    required this.title,
    required this.dueDate,
    required this.completed,
  });

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ConstColors.white,
      elevation: 5,
      shadowColor: ConstColors.greyLight,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ConstColors.white,
        ),
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Text(
                  "Due Date : ${widget.dueDate}",
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: ConstColors.taskDue),
                ),
              ],
            ),
            Checkbox(
              value: widget.completed,
              activeColor: ConstColors.green,
              side: const BorderSide(color: ConstColors.green),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              onChanged: (value) {
                setState(() {
                  widget.completed = !widget.completed;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
