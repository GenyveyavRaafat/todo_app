import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial2/task_data.dart';
import 'package:trial2/task_model.dart';

class TasksList extends StatelessWidget {
   List<Task> tasks;

  TasksList({required this.tasks});



  @override
  Widget build(BuildContext context) {
    Map<String, int> priorityVal = {
      "High": 3,
      "Medium": 2,
      "Low": 1
    };
    int mySort(Task task1, Task task2){
      final int? priority1 = priorityVal[task1.priority];
      final int? priority2 = priorityVal[task2.priority];
      if(priority1! < priority2!) return 1;
      else if(priority1! > priority2) return -1;
      else return 0;

    }
    tasks.sort(mySort);
    return ListView(
      children: getChildrenTasks(),
    );
  }

  List<Widget> getChildrenTasks(){
    return tasks.map((todo) => TaskTile(task: todo)).toList();
  }
}

class TaskTile extends StatelessWidget {
  final Task task;
  TaskTile({required this.task});

  Color c = Colors.red;

  void choosePriorityColor() {
    if(task.priority == "High") c =  Colors.red;
    else if(task.priority == "Medium") c = Colors.orange;
    else c = Colors.amber;

  }

  @override
  Widget build(BuildContext context) {
    choosePriorityColor();
    return Column(
      children: [
        SizedBox(height: 10,),
      ListTile(
        leading: CircleAvatar(backgroundColor: c, radius: 10,) ,
        title: Text(task.name, style: TextStyle(fontWeight: task.isDone ? FontWeight.normal : FontWeight.bold,
        decoration: task.isDone ? TextDecoration.lineThrough : null)),
        subtitle: Text('\n${task.Notes} \nDate: ${task.date}\nTime: ${task.startTime} - ${task.endTime}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: task.isDone,
              onChanged: (bool? checked) {
                Provider.of<TaskData>(context, listen: false).updateTask(task);
              },
            ),
          IconButton(
            icon: Icon(
            Icons.delete,
            color: Colors.red,
            ),
            onPressed: () {
            Provider.of<TaskData>(context, listen: false).archiveTask(task);
            },
        ),
          IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
        ],
        )
    ),
        SizedBox(height: 10,)
      ],
    );
  }
}





