import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pomodoro/store/pomodoro.store.dart';

class TimeEntry extends StatelessWidget {
  final int value;
  final String title;
  final void Function()? inc;
  final void Function()? dec;

  const TimeEntry({
    required this.title,
    required this.value,
    this.inc,
    this.dec,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: dec,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15),
                backgroundColor: store.isWorking()
                    ? Colors.red.shade400
                    : Colors.green.shade400,
              ),
              child: const Icon(
                Icons.arrow_downward,
                color: Colors.white,
              ),
            ),
            Text(
              '${value} min',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            ElevatedButton(
              onPressed: inc,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15),
                backgroundColor: store.isWorking()
                    ? Colors.red.shade400
                    : Colors.green.shade400,
              ),
              child: const Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
