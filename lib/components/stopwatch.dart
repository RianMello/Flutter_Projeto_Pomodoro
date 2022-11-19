import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:pomodoro/components/stopwatch_button.dart';
import 'package:pomodoro/store/pomodoro.store.dart';

class Stopwatch extends StatelessWidget {
  const Stopwatch({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Observer(
      builder: (_) => Container(
        color: store.isWorking() ? Colors.red.shade400 : Colors.green.shade400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              store.isWorking() ? 'Hora de Trabalhar' : 'Hora de Descansar',
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 80,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!store.started)
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: StopwatchButton(
                          text: 'Inicar',
                          icon: Icons.play_arrow,
                          action: store.start),
                    ),
                  if (store.started)
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: StopwatchButton(
                        text: 'Parar',
                        icon: Icons.stop,
                        action: store.stop,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: StopwatchButton(
                      text: 'Reiniciar',
                      icon: Icons.refresh,
                      action: store.refresh,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
