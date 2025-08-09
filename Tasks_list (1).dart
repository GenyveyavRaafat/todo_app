import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/methods/task_data.dart';



class TasksList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: ((context, taskData, child){
        return  ListView.builder(
        itemCount:taskData.tasks.length,
        itemBuilder: ((context, index) {
          return TaskTile(
            isChecked: taskData.tasks[index].isDone, 
            tasktitle: taskData.tasks[index].name,
            checkboxchange:(newVal){
          taskData.updateTask(taskData.tasks[index]);
        } ,
        listTileDelete: (){
          taskData.deleteTask(taskData.tasks[index]);
        }
          );
        })
      );
      }),
      
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
  final void Function() listTileDelete;

  TaskTile({required this.isChecked,required this.tasktitle, required this.checkboxchange,required this.listTileDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(tasktitle, style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : null)),
      trailing: Checkbox(
      value: isChecked, 
      onChanged: checkboxchange
      ),
      onLongPress: listTileDelete,
    );
  }
}

 



