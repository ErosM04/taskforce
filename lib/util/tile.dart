import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskTile extends StatefulWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? onArchive;

  TaskTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.onArchive,
  });

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  // changes on with setState to match the Archive slider (when pulled out)
  double topRightBorder = 18;
  double bottomRightBorder = 18;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: GestureDetector(
          // changes top and bottom right border radius to match slider
          onHorizontalDragCancel: () => onSlide(),
          onHorizontalDragEnd: (details) => onSlide(),
          child: Slidable(
            endActionPane: ActionPane(motion: const StretchMotion(), children: [
              SlidableAction(
                onPressed: widget.onArchive,
                icon: Icons.archive,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(0),
                  bottomLeft: Radius.circular(0),
                  topRight: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
              )
            ]),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(18),
                    bottomLeft: const Radius.circular(18),
                    topRight: Radius.circular(topRightBorder),
                    bottomRight: Radius.circular(bottomRightBorder),
                  )),
              child: Center(
                child: Row(
                  children: [
                    Checkbox(
                      value: widget.taskCompleted,
                      onChanged: widget.onChanged,
                      activeColor: Theme.of(context).colorScheme.tertiary,
                      side: BorderSide(
                          width: 2,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    Text(
                      widget.taskName,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 15,
                          decoration: widget.taskCompleted
                              ? TextDecoration.lineThrough
                              : null,
                          decorationColor:
                              Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  void onSlide() {
    if (topRightBorder == 0) {
      setState(() {
        topRightBorder = 18;
        bottomRightBorder = 18;
      });
    } else {
      setState(() {
        topRightBorder = 0;
        bottomRightBorder = 0;
      });
    }
  }
}
