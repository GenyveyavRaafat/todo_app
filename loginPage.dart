import 'dart:math';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_todolist/DB_Helper.dart';
import 'package:flutter_application_todolist/form_style.dart';
import 'package:flutter_application_todolist/home.dart';
import 'package:flutter_application_todolist/signupPage.dart';
import 'package:flutter_application_todolist/userModel.dart';
import 'package:provider/provider.dart';

class loginPage extends StatefulWidget {
  loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _formkey = GlobalKey<FormState>();

  final emaileditingController = new TextEditingController();

  final passwordeditingController = new TextEditingController();

  DatabaseHelper database = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset("assets/Images/registration.jpg"),
                        height: 220.0,
                        width: double.infinity,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),

                      Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        width: 600,
                        child: TextFormField(
                          controller: emaileditingController,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Please enter email";
                            }
                            if (!EmailValidator.validate(text)) {
                              return "Please enter a valid email";
                            }
                            return null;
                          },
                          cursorColor: Colors.grey,
                          decoration: ThemeHyper().textInputDecoration(
                              "Enter your Email", Icon(Icons.email)),
                        ),
                      ),

                      Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        width: 600,
                        child: TextFormField(
                          controller: passwordeditingController,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Please enter password";
                            }
                            if (text.length > 15 || text.length < 6) {
                              return "Password must be greater than 6 characters and less than 15 characters";
                            }
                            return null;
                          },
                          cursorColor: Colors.grey,
                          obscureText: true,
                          decoration: ThemeHyper().textInputDecoration(
                              "Enter password", Icon(Icons.lock)),
                        ),
                      ),

                      SizedBox(
                        height: 6.0,
                      ),
                      Container(
                        child: Container(
                          width: 515,
                          height: 45,
                          margin: EdgeInsets.all(15),
                          child: ElevatedButton(
                            onPressed: () async {
                            String fullname;
                            String email = emaileditingController.text;
                            String password = passwordeditingController.text;
                            bool success = await DatabaseHelper.isUserPresent(email, password);
                            if(success){
                              // Navigator.pushNamed(context, '/Home');
                              fullname = (await DatabaseHelper.getuser(email, password))!;
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreen(
                                    fullname:fullname, email:email)
                                    )
                                    );
                        }
                        else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                              title: Text('Incorrect email or password'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Ok'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    //this line below us just for showing that you can use different ways of pop
                                    // Navigator.popUntil(context, ModalRoute.withName('/Login'));
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                            child: Text(
                              'Login',
                              style: TextStyle(fontSize: 16),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.fromLTRB(146, 12, 146, 12),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              elevation: 8,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? "),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signupPage()),
                              );
                            },
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          )
                        ],
                      )
                      // Text('Already have an account?'),
                      // TextButton(onPressed: (){}, child:Text('Signin') ,style: TextButton.styleFrom(
                      //   primary: Colors.black,

                      // ),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
