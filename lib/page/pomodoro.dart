import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import 'package:pomodoro/components/stopwatch.dart';
import 'package:pomodoro/components/time_entry.dart';
import 'package:pomodoro/store/pomodoro.store.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Stopwatch(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
            ),
            child: Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TimeEntry(
                    title: 'Trabalho',
                    value: store.workingTime,
                    inc: store.started && store.isWorking()
                        ? null
                        : store.increaseWorkingTime,
                    dec: store.started && store.isWorking()
                        ? null
                        : store.decreaseWorkingTime,
                  ),
                  TimeEntry(
                    title: 'Descanso',
                    value: store.restTime,
                    inc: store.started && store.isResting()
                        ? null
                        : store.increaseRestTime,
                    dec: store.started && store.isResting()
                        ? null
                        : store.decreaseRestTime,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
