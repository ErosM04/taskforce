import 'package:flutter/material.dart';
import 'package:taskforce/util/tile.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List> todoList = [
    ["Do this", true],
    ["Do that", false],
    ["Fare cose", false],
    ["Ballare la fresca", true],
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
          onPressed: () {},
          child: const Icon(
            Icons.add,
            size: 35,
          ),
        ),
        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) => TodoTile(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          ),
        ),
      );

  void checkBoxChanged(bool? value, int index) =>
      setState(() => todoList[index][1] = !todoList[index][1]);
}
