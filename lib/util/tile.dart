import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  TaskTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.all(Radius.circular(18.0))),
          child: Center(
            child: Row(
              children: [
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Theme.of(context).colorScheme.tertiary,
                  side: BorderSide(
                      width: 2, color: Theme.of(context).colorScheme.secondary),
                ),
                Text(
                  taskName,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 15,
                      decoration:
                          taskCompleted ? TextDecoration.lineThrough : null,
                      decorationColor: Theme.of(context).colorScheme.secondary),
                ),
              ],
            ),
          ),
        ),
      );
}
