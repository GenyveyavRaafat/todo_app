import 'package:flutter/material.dart';
import 'package:todoapp/methods/task.dart';

class TasksList extends StatefulWidget {
  
  final List<Task> tasks;

  TasksList(this.tasks);
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: ((context, index) {
        return TaskTile(
          isChecked: widget.tasks[index].isDone, 
          tasktitle: widget.tasks[index].name,
          checkboxchange:(newVal){
         setState(() {
          widget.tasks[index].donechange();
        }); 
        
      } 
        );
      })
    );
  }
}

/* return ListView(
      children: [
        TaskTile(
          tasktitle: tasks[0].name,
          isChecked: tasks[0].isDone,
        ),
         TaskTile(
           tasktitle: tasks[1].name,
          isChecked: tasks[1].isDone,
         ),
         TaskTile(
           tasktitle: tasks[2].name,
          isChecked: tasks[2].isDone,
         ),
      ],
    ); */




class TaskTile extends StatelessWidget {

  final bool isChecked;
  final String tasktitle;
  final void Function(bool?) checkboxchange;

  TaskTile({required this.isChecked,required this.tasktitle, required this.checkboxchange});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(tasktitle, style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : null)),
      trailing: Checkbox(
      value: isChecked, 
      onChanged: checkboxchange
      )
    );
  }
}

 



