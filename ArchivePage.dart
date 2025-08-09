import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/DB/task_model.dart';
import 'package:todoapp/methods/task_data.dart';
import 'package:todoapp/widgets/Tasks_list.dart';

class ArchivePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
 return Scaffold(
      appBar: AppBar(title: const Text('Archive Page')),
      body: Consumer<TaskData>(
         builder: (context, todos, child) => ArchivedTaskList(tasks: todos.deletedTasks),
        ), 
    );
  }

}


class ArchivedTaskList extends StatelessWidget {
  
  final List<Task> tasks;

  ArchivedTaskList({required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
        child: ListView(
          children: getChildrenTasks(),
        )
    );
  }

  List<Widget> getChildrenTasks() {
    return tasks.map((todo) => ArchivedTaskTile(task: todo)).toList();
  }
}




class ArchivedTaskTile extends StatelessWidget {
  final Task task;

  ArchivedTaskTile({required this.task});


  @override
  Widget build(BuildContext context) {
    return ListTile(
          leading: IconButton(
            icon: Icon(Icons.undo), 
            onPressed: () { 
               Provider.of<TaskData>(context, listen: false)
                      .archiveTask(task);   
             } ,

            ),
          title: Text(task.name,
              style: TextStyle(
                  decoration: task.isDone ? TextDecoration.lineThrough : null)),
          subtitle: Text(
              '${task.Notes} \nDate: ${task.date}\nTime: ${task.startTime} - ${task.endTime}'),
          trailing: IconButton(
            icon: Icon(Icons.delete_forever),
             onPressed: () {  
              Provider.of<TaskData>(context, listen: false).deleteForeverTask(task);
             },

          )
          
          
          
          );
  }
}
