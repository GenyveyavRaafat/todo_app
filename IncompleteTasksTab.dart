import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/methods/task_data.dart';
import 'package:todoapp/widgets/Tasks_list.dart';

class incompleteTasks extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<TaskData>(
        builder: (context, todos , child) => TasksList(tasks: todos.incompleteTasks) ,
        ),
    );
  }
}