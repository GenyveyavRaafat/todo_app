import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/Screens/home.dart';
import 'package:todoapp/methods/Notes_Input_Field.dart';
import 'package:todoapp/widgets/input_field.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/methods/task_data.dart';


class AddTaskPage extends StatefulWidget {
 final Function addTaskCallback;
  AddTaskPage(this.addTaskCallback);

  @override
  State<AddTaskPage> createState() => AddTaskPageState();
}

class AddTaskPageState extends State<AddTaskPage> {

  DateTime selectedDate = DateTime.now();
  String dropdownvalue = 'High';
  //String startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  TimeOfDay startTime = TimeOfDay(hour: 8, minute: 30);
  TimeOfDay endTime = TimeOfDay(hour: 9, minute: 30);
  void showStartTimePicked() {
    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
      setState(() {
        startTime = value!;
      });
    });
  }
  void showEndTimePicked() {
    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
      setState(() {
        endTime = value!;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var items = ["High","Medium", "Low"];
    String? newTaskTitle;
    return Scaffold(

      body: Center(
        child: SingleChildScrollView(
          child: Column(
        children: [
          const Text(
            'Add new Task',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          input_field(name: "Title", txt: "Enter title",),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTaskTitle=newText; 
            },
          ),
          Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 18),
              child: Column(
                children: [
                  const Text(
                    "Priority",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top:8),
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: DropdownButton(
                        value: dropdownvalue,
                        style: TextStyle(
                          color: Colors.blue[700],
                        ),
                        underline: const SizedBox(),
                        borderRadius: BorderRadius.circular(20),
                        iconEnabledColor: Colors.blue[700],
                        dropdownColor: Colors.grey.shade300,
                        items: items.map((String items) {
                          return DropdownMenuItem(value: items, child: Text(items));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        }
                    ),
                  ),

                ],
              )
          ),

          Notes_Input_Field(name: "Notes", txt: "Enter description",),
          //Date_Input_Field(name: "Date", txt: DateFormat.yMd().format(DateTime.now())),
          Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Date",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight:FontWeight.bold ,
                  ),
                ),
                Container(
                  // Contain the box and text field
                  margin: EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                            controller: TextEditingController(),
                            //reading the user input
                            readOnly: true,
                            textAlignVertical: TextAlignVertical.top,
                            decoration: InputDecoration(
                              //floatingLabelBehavior: FloatingLabelBehavior.never,
                              // label will never float
                              //labelText: DateFormat.yMd().format(DateTime.now()),
                              hintText: DateFormat.yMd().format(selectedDate),
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.blue[700],
                              ),
                              labelStyle: TextStyle(
                                color: Colors.blue[700],
                              ),
                              contentPadding: EdgeInsets.only(left: 20,top:12),
                              suffixIcon:  IconButton(
                                icon: Icon(Icons.calendar_today_outlined),
                                color: Colors.blue[700],
                                onPressed: (){
                                  getDateFromUser();
                                },
                              ),
                            ),
                            //onTap: getDateFromUser(context),
                            maxLines: null,
                          ))
                    ],
                  ),
                )],
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 16, bottom: 20),
              alignment: AlignmentDirectional.topStart,
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Start Time", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child:Row(
                            children: [
                              Text(
                                startTime.format(context).toString(),
                                style: TextStyle(
                                    color: Colors.blue[700]
                                ),
                              ),
                              MaterialButton(
                                onPressed: (){ showStartTimePicked();},
                                shape: CircleBorder(),
                                child: Icon(Icons.access_alarm_rounded, color: Colors.blue[700],),
                              )
                            ],
                          ),
                        ),
                      ]

                  ),
                  SizedBox(width: 20,),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("End Time", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child:Row(
                            children: [
                              Text(
                                endTime.format(context).toString(),
                                style: TextStyle(
                                    color: Colors.blue[700]
                                ),
                              ),
                              MaterialButton(
                                onPressed: (){ showEndTimePicked();},
                                shape: CircleBorder(),
                                child: Icon(Icons.access_alarm_rounded, color: Colors.blue[700],),
                              )
                            ],
                          ),
                        ),
                      ]

                  ),
                ],
              )
          ),
          SizedBox(
            width: 200,
            height: 45,
          child: ElevatedButton(
            child: Text('Save'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[700],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onPressed: (){
              Provider.of<TaskData>(context,listen: false).addTask(newTaskTitle!);
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return Homescreen();
              }));
            },),
            ),
          SizedBox(height: 8.0,),
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
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                    return Homescreen();
                  }));
                },
            ),
          )
        ],
        )
    )
      ),
    );
  }
  getDateFromUser() async{
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2100),
    );
    if(mounted) {
      if(pickedDate != null){
        setState(
                () {
              selectedDate = pickedDate;
              print(selectedDate);
            }

        );
      } }

  }
}


