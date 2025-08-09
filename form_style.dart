

import 'package:flutter/material.dart';

class ThemeHyper{
  InputDecoration textInputDecoration([hintText="",Icon,bool]){
  return InputDecoration(
  hintText: hintText,
  prefixIcon: Icon,
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.fromLTRB(35, 20, 35, 20),
  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: Colors.lightBlue)),
  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: Colors.white24)),
  errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: Colors.red)),
  focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100),borderSide: BorderSide(color: Colors.red)),
  fillColor: Colors.grey[100],
  filled: true,
  
 );
  }
  
}