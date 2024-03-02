import 'package:flutter/material.dart';
import 'package:taskforce/util/dialog.dart';
import 'package:taskforce/util/tile.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List<List> taskList = [
    // ["Do this", true],
    // ["Do that", false],
    // ["Fare cose", false],
    // ["Ballare la fresca", true],
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          centerTitle: true,
          title: Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21),
          ),
          onPressed: () => createNewTask(),
          child: const Icon(
            Icons.add,
            size: 35,
          ),
        ),
        body: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index) => TaskTile(
            taskName: taskList[index][0],
            taskCompleted: taskList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            onArchive: (context) => archiveTask(context, index),
          ),
        ),
      );

  void checkBoxChanged(bool? value, int index) =>
      setState(() => taskList[index][1] = !taskList[index][1]);

  void createNewTask() => showDialog(
        context: context,
        builder: (context) => CreationDialog(
          controller: _controller,
          onSave: () => saveNewTask(),
          onCancel: () => Navigator.of(context).pop(),
        ),
      );

  void saveNewTask() {
    setState(() => taskList.add([_controller.text.trim(), false]));
    Navigator.of(context).pop();
    _controller.clear();
  }

  // to complete
  void archiveTask(BuildContext context, int index) =>
      setState(() => taskList.removeAt(index));
}
