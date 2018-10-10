import 'dart:io';

import 'package:meta/meta.dart';

void main() {
  var now = DateTime.now();
  print(Task(label: 'blank', expireDate: now));
  var task = Task(
    label: 'Do this',
    touchDate: now,
    watchDate: now.add(const Duration(days: 7)),
    expireDate: now.add(const Duration(days: 30)),
  );
  print(task);
  sleep(const Duration(seconds: 3));
  task.touch(complete: true);
  print(task);
}

class TaskList {
  List<Task> tasks;
}

class Task {
  Task({
    @required this.label,
    this.touchDate,
    this.watchDate,
    @required this.expireDate,
    this.complete,
  }) {
    watchDate ??= DateTime.now();
    this.complete ??= false;
  }

  String label;
  DateTime touchDate;
  DateTime watchDate;
  DateTime expireDate;
  bool complete;

  double get pressure => 0.0;

  void touch({bool complete}) {
    touchDate = DateTime.now();
    this.complete = complete ?? this.complete;
  }

  @override
  String toString() {
    return 'Task{label: $label, touchDate: $touchDate, watchDate: $watchDate, expireDate: $expireDate, complete: $complete}';
  }
}
