import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum RangeType {
  work,
  rest,
}

abstract class _PomodoroStore with Store {
  @observable
  bool started = false;

  @observable
  int minutes = 0;

  @observable
  int seconds = 0;

  @observable
  int workingTime = 1;

  @observable
  int restTime = 1;

  @observable
  RangeType rangeType = RangeType.work;

  Timer? stopwatch;

  @action
  void start() {
    started = true;
    stopwatch = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (minutes == 0 && seconds == 0) {
          _changeRangeType();
        } else if (seconds == 0) {
          seconds = 59;
          minutes--;
        } else {
          seconds--;
        }
      },
    );
  }

  @action
  void stop() {
    started = false;
    stopwatch?.cancel();
  }

  @action
  void refresh() {
    stop();
    minutes = isWorking() ? workingTime : restTime;
    seconds = 0;
  }

  @action
  void increaseWorkingTime() {
    if (workingTime < 60) {
      workingTime++;
      if (isWorking()) {
        refresh();
      }
    }
  }

  @action
  void increaseRestTime() {
    if (restTime < 60) {
      restTime++;
      if (isResting()) {
        refresh();
      }
    }
  }

  @action
  void decreaseWorkingTime() {
    if (workingTime > 1) {
      workingTime--;
      if (isWorking()) {
        refresh();
      }
    }
  }

  @action
  void decreaseRestTime() {
    if (restTime > 1) {
      restTime--;
      if (isResting()) {
        refresh();
      }
    }
  }

  void _changeRangeType() {
    if (isWorking()) {
      rangeType = RangeType.rest;
      minutes = restTime;
    } else {
      rangeType = RangeType.work;
      minutes = workingTime;
    }
  }

  bool isWorking() {
    return rangeType == RangeType.work;
  }

  bool isResting() {
    return rangeType == RangeType.rest;
  }
}
