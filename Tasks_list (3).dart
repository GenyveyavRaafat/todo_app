import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/Screens/EditPage.dart';
import 'package:todoapp/methods/task_data.dart';
import 'package:todoapp/methods/task_model.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;

  TasksList({required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
        child: ListView(
      children: getChildrenTasks(),
    ));
  }

  List<Widget> getChildrenTasks() {
    return tasks.map((todo) => TaskTile(task: todo)).toList();
  }
}

class TaskTile extends StatelessWidget {
  final Task task;

  TaskTile({required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Checkbox(
          value: task.isDone,
          onChanged: (bool? checked) {
            Provider.of<TaskData>(context, listen: false).updateTask(task);
          },
        ),
        title: Text(task.name,
            style: TextStyle(
                decoration: task.isDone ? TextDecoration.lineThrough : null)),
        subtitle: Text('${task.Notes} Deadline: ${task.endTime}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).archiveTask(task);
              },
            ),
            IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.grey,
                ),
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => EditPage());
                }),
          ],
        ));
  }
}
