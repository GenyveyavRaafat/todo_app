import 'package:flutter/material.dart';
import 'package:todoapp/methods/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks=[
    Task(name: 'go shopping'),
    Task(name: 'do homework'),
    Task(name: 'workout'),
  ];

  void addTask(String newTaskTitle){
    tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void updateTask(Task task){
    task.donechange();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}