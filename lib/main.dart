import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page/pomodoro.dart';
import 'store/pomodoro.store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MultiProvider(
      providers: [
        Provider<PomodoroStore>(
          create: (_) => PomodoroStore(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: Colors.blue,
          ),
        ),
        home: const PomodoroPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
