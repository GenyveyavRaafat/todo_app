import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:todoapp/Screens/AddTaskPage.dart';
import 'package:todoapp/Screens/AllTasksTab.dart';
import 'package:todoapp/Screens/ArchivePage.dart';
import 'package:todoapp/Screens/CompletedTasksTab.dart';
import 'package:todoapp/Screens/IncompleteTasksTab.dart';

import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> 
        with SingleTickerProviderStateMixin{

    late TabController controller;

   @override
    void initState() {
      super.initState();
      controller = TabController(length: 3, vsync: this);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius:  BorderRadius.only(
             bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50)
              )
        ),
        backgroundColor: Colors.blue[400],
        title:  const Text('My Home',style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16 )),
        centerTitle: true,
        //leading: ElevatedButton(onPressed: () {}, child: const Icon(Icons.menu , size: 30,),style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[400])), 
      
      bottom: TabBar(
        indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(50), // Creates border
        color: Colors.indigo), //Change background color from here
        controller: controller,
        tabs: [
          Tab(text: 'All'),
          Tab(text: 'Incomplete'),
          Tab(text: 'Complete'),
        ]
        ),
      
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo[400],
        child: Icon(Icons.add),
        onPressed:(){
         showModalBottomSheet(
          isScrollControlled: true,
          context: context, 
          builder: (context) => AddTaskPage()
          ); 
      },),
      
      body: TabBarView(
       controller: controller,
       children: [
        AllTasksTab(),
        incompleteTasks(),
        CompletedTasksTab(),
       ],
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => CompletedTasksTab()));
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

