import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/methods/task_data.dart';
import 'package:todoapp/widgets/Tasks_list.dart';

class DonePage extends StatefulWidget {
  @override
  State<DonePage> createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Done Page')),
        body: Consumer<TaskData>(
         builder: (context, todos, child) => TasksList(tasks: todos.completedTasks),
        ),     
          
        );

        /* Consumer<TaskData>(
          builder: (context, todos, child) => TasksList(tasks: todos.completedTasks),
        ), */

        
  }
}
