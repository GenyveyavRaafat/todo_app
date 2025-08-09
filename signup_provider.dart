import 'package:flutter/material.dart';

class form_provider with ChangeNotifier{
  String fullName="";
  String email="";
  String password="";
  void signUp( String fullName,String email,String password){
    fullName=fullName;
    email=email;
    password=password;
    // print(fullName+"  "+email+"  "+password);
    notifyListeners();
  }


}
