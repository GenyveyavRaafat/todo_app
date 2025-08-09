import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/DB/task_model.dart';
import 'package:todoapp/Screens/EditPage.dart';
import 'package:todoapp/methods/task_data.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;

  TasksList({required this.tasks});

  int mySort(Task task1, Task task2) {
    Map<String, int> priorityVal = {"High": 3, "Medium": 2, "Low": 1};
    final int? priority1 = priorityVal[task1.priority];
    final int? priority2 = priorityVal[task2.priority];
    if (priority1! < priority2!)
      return 1;
    else if (priority1! > priority2)
      return -1;
    else
      return 0;
  }

  @override
  Widget build(BuildContext context) {
    tasks.sort(mySort);
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

  Color c = Colors.red;

  void choosePriorityColor() {
    if (task.priority == "High")
      c = Colors.red;
    else if (task.priority == "Medium")
      c = Colors.orange;
    else
      c = Colors.amber;
  }

  @override
  Widget build(BuildContext context) {
    choosePriorityColor();
    return Visibility(
      visible: !task.isDeleted,
      child: ListTile(
          leading: CircleAvatar(
            backgroundColor: c,
            radius: 10,
          ),
          title: Text(task.name,
              style: TextStyle(
                  decoration: task.isDone ? TextDecoration.lineThrough : null)),
          subtitle: Text(
              '${task.Notes} \nDate: ${task.date}\nTime: ${task.startTime} - ${task.endTime}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                value: task.isDone,
                onChanged: (bool? checked) {
                  Provider.of<TaskData>(context, listen: false)
                      .updateTask(task);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false)
                      .archiveTask(task);
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
          )),
    );
  }
}
