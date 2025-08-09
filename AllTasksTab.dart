import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/methods/task_data.dart';
import 'package:todoapp/widgets/Tasks_list.dart';


class AllTasksTab extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(left:20,top:10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                
                child: CircularPercentIndicator(
                  radius: 80,
                  lineWidth: 12.0,
                  backgroundColor: Colors.grey.shade400,
                  percent: (Provider.of<TaskData>(context).tasks.where((todo) => todo.isDone).length/Provider.of<TaskData>(context).tasks.length),
                  center: Text('${Provider.of<TaskData>(context).tasks.where((todo) => todo.isDone).length} of ${Provider.of<TaskData>(context).tasks.length} tasks',style: TextStyle(fontSize: 18),) ,
                  circularStrokeCap: CircularStrokeCap.round,
                  animation: true,
                  progressColor: Colors.blue.shade400,
                  )
                
              ) ,
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  child: Consumer<TaskData>( 
                  builder: (context, todos , child) => TasksList(tasks: todos.allTasks) ,
                  ),
                ),
              )

            ],

          ),
        )
    );
  }
}

// Text('${Provider.of<TaskData>(context).tasks.length} tasks',style: TextStyle(fontSize: 18),),
/* child: Consumer<TaskData>( 
        builder: (context, todos , child) => TasksList(tasks: todos.allTasks) ,
        ), */