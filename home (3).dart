import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:todoapp/Screens/AddTaskPage.dart';
import 'package:todoapp/Screens/AllTasksTab.dart';
import 'package:todoapp/Screens/ArchivePage.dart';
import 'package:todoapp/Screens/CompletedTasksTab.dart';
import 'package:todoapp/Screens/DonePage.dart';
import 'package:todoapp/Screens/IncompleteTasksTab.dart';

import 'package:provider/provider.dart';
import 'package:todoapp/methods/task_data.dart';

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> 
        with SingleTickerProviderStateMixin{

    late ScrollController scrollController;
    late TabController controller;

   @override
    void initState() {
      super.initState();
      controller = TabController(length: 3, vsync: this);
       scrollController = new ScrollController();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        title:  const Text('My Home',style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16 )),
        centerTitle: true,
        elevation: 0.0,
        //leading: ElevatedButton(onPressed: () {}, child: const Icon(Icons.menu , size: 30,),style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[400])), 
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink[400],
        child: Icon(Icons.add),
        onPressed:(){
         showModalBottomSheet(
          isScrollControlled: true,
          context: context, 
          builder: (context) => AddTaskPage()
          ); 
      },),
      
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[ 
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Icon(Icons.account_circle, size: 45.0, color: Colors.white,),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0,16.0,0.0,12.0),
                      child: Text("Hello, Geny.", style: TextStyle(fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.w400),),
                    ),
                    Text("Looks like feel good.", style: TextStyle(color: Colors.white),),
                    Text("You have ${Provider.of<TaskData>(context).tasks.where((todo) => !todo.isDone).length} tasks to do today.", style: TextStyle(color: Colors.white,),),
                    
                  ],
                 ),
              ),
             ),
              Container(
                padding: const EdgeInsets.fromLTRB(0.0, 70, 10, 0.0),
                child: CircularPercentIndicator(
                  radius: 70,
                  lineWidth: 12.0,
                  backgroundColor: Colors.white,
                  percent: (Provider.of<TaskData>(context).tasks.where((todo) => todo.isDone).length/Provider.of<TaskData>(context).tasks.length),
                  center: Text('${Provider.of<TaskData>(context).tasks.where((todo) => todo.isDone).length} of ${Provider.of<TaskData>(context).tasks.length} tasks',style: TextStyle(fontSize: 18),) ,
                  circularStrokeCap: CircularStrokeCap.round,
                  animation: true,
                  progressColor: Colors.pink[600],
                  )
              )
           
            ]
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0,5.0,0.0,10),
                  child: Text("TODAY : ${DateFormat.yMMMMd().format(DateTime.now())}".toUpperCase(), style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
          ]
          ),
          Container(
                child: TabBar(
                  indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Creates border
                  color: Colors.pink[400]), //Change background color from here
                  controller: controller,
                  tabs: [
                    Tab(text: 'All'),
                    Tab(text: 'Incomplete'),
                    Tab(text: 'Complete'),
                  ]
                ),
          ),

          Expanded(
            child: TabBarView(
            controller: controller,
            children: [
              AllTasksTab(),
              incompleteTasks(),
              CompletedTasksTab(),
            ],
          ),
        )

        ]
        )
      ),
    

      drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          const DrawerHeader(padding: EdgeInsets.all(0),decoration: BoxDecoration(color:Colors.blue),
            child: UserAccountsDrawerHeader(
              accountName: Text("Geny Raafat", style: TextStyle(fontSize: 18),),
              accountEmail: Text("GR@gmail.com", style: TextStyle(fontSize: 14)),
              currentAccountPictureSize: Size.square(65),
              currentAccountPicture: CircleAvatar(backgroundColor: Colors.white54,
                child: Text("G", style: TextStyle(fontSize: 35, color: Colors.indigo),), //Text
              ), //circleAvatar
            ),
          ),
          ListTile(
            leading: const Icon(Icons.playlist_add_check_rounded,color: Colors.black),
            title: const Text('Done Page',style: TextStyle(fontSize: 16)),
            onTap: () {
              onItemPressed(context,index:0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.archive_rounded,color: Colors.black),
            title: const Text('Archive page',style: TextStyle(fontSize: 16)),
            onTap: () {
              onItemPressed(context,index:1);
            },
          ),
          const Divider(thickness: 1 ,color: Colors.indigo,indent: 50,endIndent: 80,),
          ListTile(
            leading: const Icon(Icons.logout,color: Colors.black),
            title: const Text('Log out',style: TextStyle(fontSize: 16)),
            onTap: () {
              onItemPressed(context,index:2);
            },
          ),
        ],
      ),
    )
    );
  }
}
  void onItemPressed(BuildContext context,{required int index}){
    //Navigator.pop(context);
    switch(index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => DonePage()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArchivePage()));
        break;
      case 2:
        //Navigator.push(context, MaterialPageRoute(builder: (context) => welcome()));
        break;
      default:
        Navigator.pop(context);
        break;
    };

  }

