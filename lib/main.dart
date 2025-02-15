import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'config/dependencies.dart';

void main() {
  Logger.root.level = Level.ALL;
  
  runApp(
    MultiProvider(
      providers: providers,
      child: const App(),
    ),
  );
}


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BeTalent - Teste Prático',
      debugShowCheckedModeBanner: false,
      home: Container(),
    );
  }
}