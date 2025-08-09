import 'package:flutter/material.dart';
import 'package:flutter_app/signupPage.dart';
import 'package:flutter_app/task.dart';

class Homescreen extends StatelessWidget {
  //const Homescreen({super.key});
   final fullname;
    final email;
      Homescreen([this.fullname,this.email]);
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
              builder: (context) => signupPage()
              // AddTaskPage()
          );
        },
          backgroundColor: Colors.indigo[400],
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          title:  const Text('My Home',style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30 )),
          //leading: ElevatedButton(onPressed: () {}, child: const Icon(Icons.menu , size: 30,),style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[400])),
        ),
        body: Container(
          padding: const EdgeInsets.only(left:20,top:10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('$counter tasks',style: TextStyle(fontSize: 18),),
              SizedBox(height: 20),
              // Expanded(
              //   child: Container(
              //     child: TasksList(tasks),
              //   ),
              // )

            ],

          ),
        )

    ,drawer: Drawer(
      child: ListView(
        
        padding: EdgeInsets.all(0),
        children: [
          Container(
            color: Colors.blue,
            padding: EdgeInsets.only(top:20,left:2,bottom: 20),
            child: Column(children: [
              CircleAvatar(radius: 52,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage('assets/Images/forberg-avatar.jpg'),
              ),
              SizedBox(height: 12),
              Text(fullname ,style:TextStyle(fontSize: 19,color: Colors.white)),
              SizedBox(height: 5), 
              Text(email,style:TextStyle(fontSize: 17,color: Colors.white)),
            ]),
          ),

          // Text(fullname ,style:TextStyle(fontSize: 14)),
          // Text(email,style:TextStyle(fontSize: 14)),
          // const DrawerHeader(padding: EdgeInsets.all(0),decoration: BoxDecoration(color:Colors.blue),
          //   child: UserAccountsDrawerHeader(
          //     accountName:Text("Name:"),
          //     accountEmail: Text('email', style: TextStyle(fontSize: 14)),
          //     currentAccountPictureSize: Size.square(65),
          //     currentAccountPicture: CircleAvatar(backgroundColor: Colors.white54,
          //       child: Text("G", style: TextStyle(fontSize: 35, color: Colors.indigo),), //Text
          //     ), //circleAvatar
          //   ),
          // ),
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

  void onItemPressed(BuildContext context,{required int index}){
    //Navigator.pop(context);
    switch(index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => signupPage()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => signupPage()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => signupPage()));
        break;
      default:
        Navigator.pop(context);
        break;
    }
  }
}


