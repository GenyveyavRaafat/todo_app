import 'package:flutter/material.dart';
import 'package:todoapp/Screens/home.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/methods/task_data.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: Homescreen(),
      ),
    );
  }
}