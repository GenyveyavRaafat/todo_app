import 'package:flutter/material.dart';
import 'dart:collection';

import 'package:todoapp/DB/task_model.dart';

class TaskData extends ChangeNotifier {
  final List<Task> tasks = [
    Task(name: 'Finish the app',Notes: 'you can do it', ),
    Task(name: 'Write a blog post',Notes: 'you can do it',),
    Task(name: 'Share with community',Notes: 'you can do it',),

  ];
  List<Task> get allTasks => tasks;
  List<Task> get incompleteTasks => tasks.where((todo) => !todo.isDone).toList();
  List<Task> get completedTasks => tasks.where((todo) => todo.isDone).toList();
  List<Task> get deletedTasks => tasks.where((todo) => todo.isDeleted).toList();



  void addTask(Task task){
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    final taskIndex= tasks.indexOf(task);
    tasks[taskIndex].donechange();
    notifyListeners();
  }

  void archiveTask(Task task) {
    final taskIndex = tasks.indexOf(task);
    tasks[taskIndex].archivedTask();
    if (task.isDone) {
      task.isDone= false;
    }
    notifyListeners();
  }

   void deleteForeverTask(Task task) {
    final taskIndex= tasks.indexOf(task);
    tasks.removeAt(taskIndex);
    notifyListeners();
  }
}