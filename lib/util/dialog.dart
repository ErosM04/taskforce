import 'package:flutter/material.dart';
import 'package:taskforce/util/custom_button.dart';

class CreationDialog extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  CreationDialog({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.primary,
        content: SizedBox(
          height: 200,
          child: Column(
            children: [
              TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      hintText: "Insert your new task...",
                      hintStyle: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.8)),
                      labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18)))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(text: 'Cancel', onPressed: () => onCancel()),
                  CustomButton(text: 'Save', onPressed: () => onSave()),
                ],
              ),
            ],
          ),
        ),
      );
}
