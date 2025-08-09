import 'package:flutter/material.dart';
import 'package:todoapp/Screens/AddTaskPage.dart';
import 'package:todoapp/widgets/input_field.dart';


class Notes_Input_Field extends input_field {
  Notes_Input_Field({Key? key, name, txt, inputFieldCtrl}) : super(key: key, name: "Notes", txt: txt, inputFieldController: inputFieldCtrl );

  double height = 150, btm_padding = 10;


}
