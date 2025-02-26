import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'config/dependencies.dart';
import 'routing/router.dart';
import 'ui/core/themes/theme.dart';

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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
      routerConfig: router(),
    );
  }
}