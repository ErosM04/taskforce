import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) => MaterialButton(
        onPressed: onPressed,
        color: Theme.of(context).colorScheme.tertiary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Text(text),
        ),
      );
}
