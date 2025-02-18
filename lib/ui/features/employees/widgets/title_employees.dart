import 'package:flutter/material.dart';

class TitleEmployees extends StatelessWidget {
  const TitleEmployees({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Funcionários",
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
