import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Color.fromARGB(255, 1, 64, 17),
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 106, 136, 155),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 350,
                height: 80,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    // border: Border.all(
                    //   width: 10,
                    //   color: Theme.of(context).colorScheme.secondary,
                    // ),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(20.0))),
                child: Center(
                  child: Text(
                    'Cacca',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
