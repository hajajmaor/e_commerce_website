import 'package:e_comm_front/pages/home.dart';
import 'package:flutter/material.dart';

class UndefinedView extends StatelessWidget {
  final String name;

  const UndefinedView({Key? key, required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'page $name not exist.',
                style: Theme.of(context).textTheme.headline3,
              ),
              TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(
                        context,
                        HomePage.name,
                      ),
                  child: const Text('return to home page'))
            ],
          ),
        ),
      ),
    );
  }
}
