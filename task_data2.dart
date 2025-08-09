import 'package:flutter/material.dart';
import 'package:todoapp/methods/task_model.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  final List<Task> tasks = [
    Task(name: 'Finish the app',Notes: 'you can do it',),
    Task(name: 'Write a blog post',Notes: 'you can do it'),
    Task(name: 'Share with community',Notes: 'you can do it'),
  ];
  UnmodifiableListView<Task> get allTasks => UnmodifiableListView(tasks);
  UnmodifiableListView<Task> get incompleteTasks => UnmodifiableListView(tasks.where((todo) => !todo.isDone));
  UnmodifiableListView<Task> get completedTasks => UnmodifiableListView(tasks.where((todo) => todo.isDone));
  UnmodifiableListView<Task> get deletedTasks => UnmodifiableListView(tasks.where((todo) => todo.isDeleted));



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
    final taskIndex= tasks.indexOf(task);
    tasks[taskIndex].archivedTask;
    notifyListeners();
  }
}