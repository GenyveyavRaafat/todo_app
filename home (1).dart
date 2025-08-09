import 'package:flutter/material.dart';
import 'package:todoapp/Screens/AddTaskPage.dart';
import 'package:todoapp/Screens/add.dart';
import 'package:todoapp/methods/task_data.dart';
import 'package:todoapp/widgets/Tasks_list.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    int counter = 9 , donecounter= 5 , archivecounter= 1 ; 
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed:(){
        showModalBottomSheet(
          isScrollControlled: true,
          context: context, 
          builder: (context) => AddTaskPage((newTaskTitle){
            print(newTaskTitle);
          })
          );
      }, 
      backgroundColor: Colors.indigo[400],
      child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title:  const Text('My Home',style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30 )),
        leading: ElevatedButton(onPressed: () {}, child: const Icon(Icons.menu , size: 30,),style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[400])), 
      ),
      body: Container(
        padding: const EdgeInsets.only(left:20,top:10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('${Provider.of<TaskData>(context).tasks.length} tasks',style: TextStyle(fontSize: 18),),
              SizedBox(height: 20),
               Expanded(
                 child: Container(
                  child: TasksList(),
                 ),
               )  

            ],
            
          ),
      )
     
    );
  }
}

