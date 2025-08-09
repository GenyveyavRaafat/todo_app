import 'package:flutter/material.dart';
import 'package:todoapp/Screens/AddTaskPage%5B1%5D.dart';
import 'package:todoapp/Screens/add.dart';
import 'package:todoapp/methods/task.dart';
import 'package:todoapp/widgets/Tasks_list.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Task> tasks=[
    Task(name: 'go shopping'),
    Task(name: 'do homework'),
    Task(name: 'workout'),
  ];

  @override
  Widget build(BuildContext context) {
    int counter = 9 , donecounter= 5 , archivecounter= 1 ; 
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed:(){
        showModalBottomSheet(
          isScrollControlled: true,
          context: context, 
          builder: (context) => AddTaskPage()
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
              Text('$counter tasks',style: TextStyle(fontSize: 18),),
              SizedBox(height: 20),
               Expanded(
                 child: Container(
                  child: TasksList(tasks),
                 ),
               )  

            ],
            
          ),
      )
     
    );
  }
}

