import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/Screens/home.dart';
import 'package:todoapp/methods/task_data.dart';
import 'package:todoapp/methods/task_model.dart';


class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
    @override
    final taskTitleController = TextEditingController();
    final taskNotesController =TextEditingController();
    
  void intState(){
      super.initState();
    }
    final _formKey = GlobalKey<FormState>();
    void dispose() {
      taskTitleController.dispose();
      taskNotesController.dispose();
      super.dispose();
    }
    void onEdit(){
      final String titleval = taskTitleController.text;
      final String notesVal = taskNotesController.text;
      final String datetimeVal = taskTitleController.text;
      final Task todo = Task(name: titleval, Notes: notesVal,);
      Provider.of<TaskData>(context, listen: false).addTask(todo as Task);
      Navigator.pop(context);
    }
    @override
  Widget build(BuildContext context) {
      final titleController = TextEditingController();
      final descController = TextEditingController();

      return Scaffold(
      appBar: AppBar(
        title: Text("Edit Task",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
            centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
              key: _formKey,
            child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Note Title",
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter some text";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 5,
                  controller: descController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Write notes here",
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter some text";
                    }
                    return value;
                  },
                ),
              )
            ],
                  )
              ),
              SizedBox(height: 40),
              SizedBox(
                width: 200,
                height: 45,
                child: ElevatedButton(
                  child: Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onPressed:onEdit,

                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Material(
                      color: Colors.indigo[400],
                      borderRadius: BorderRadius.circular(10),

                      child: InkWell(
                        onTap: (){
                          if(_formKey.currentState!.validate()){
                            Navigator.push(context, MaterialPageRoute(builder:(context)=>Homescreen()));
                            titleController.clear();
                            descController.clear();
                            print("Data Edited");
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 55,
                          width: 120,
                          decoration: BoxDecoration(
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.lightBlueAccent,
                            //     blurRadius: 5,
                            //     spreadRadius: 1,
                            //   )
                            // ]
                          ),
                          child: Text("Edit",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.white60,
                          ),),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.red[400],
                      borderRadius: BorderRadius.circular(10),

                      child: InkWell(
                        onTap: (){
                          setState(() {
                            titleController.clear();
                            descController.clear();
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 55,
                          width: 120,
                          decoration: BoxDecoration(
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.lightBlueAccent,
                            //     blurRadius: 5,
                            //     spreadRadius: 1,
                            //   )
                            // ]
                          ),
                          child: Text("Clear",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.white60,
                            ),),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
     ),
);
}
}