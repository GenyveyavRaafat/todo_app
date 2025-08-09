import 'package:flutter/cupertino.dart';
import 'package:flutter_application_todolist/userModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';


class DatabaseHelper{

  // Initialize Database Object
  static Database? _db;


  // Make Init function that will be used to identify the database object
  static Future<void> initDB() async{
    var databasesPath = await getDatabasesPath();
    String path = ("${databasesPath}notepadDB.db");

    _db = await openDatabase(path, version: 1, onOpen: (db) {
      print("Database Opened !!");
    }, onCreate: (Database db, int version) async {
      print("Database Created!!");
      await db.execute("CREATE TABLE USERDATA (userid INTEGER PRIMARY KEY, fullname TEXT, email TEXT,password text)");
    });
  }

  //Insert new user
  static void   saveData(userModel user) async {
       print("name ${user.fullname}" + "email ${user.email}"+"passwod ${user.password}");
        int res = await _db!.rawInsert(
        "INSERT INTO USERDATA (userid,fullname,email,password) VALUES (?,?,?,?)",
      [null, user.fullname , user.email,user.password]
      );
      print(res);
  }
   static Future<bool> isUserPresent(String email, String password) async {
    print('email ${email},'+" "+'password ${password}');
    List<dynamic> result = await  _db!.query("USERDATA", where: "email = ? and password = ?", whereArgs: [email, password]);

    if(result.isNotEmpty){
      return true;
    }
    else {
      return false;
    }
  }
  //Getting user
    static Future<String?>getuser(String email,String password) async {
    userModel user = userModel();
    var res =await  _db!.query("USERDATA", where: "email = ? and password = ?", whereArgs: [email,password]);
    if(res.isNotEmpty){
      // user.id = res.first["userid"] as int;
      user.fullname = res.first["fullname"] as String;
      // user.email = res.first["email"] as String;
      // user.password = res.first["password"] as String;
      return user.fullname;
    }
    return null;
  }
   static Future<void>getALLuser() async {
    var res =await  _db!.query("USERDATA");
    if(res.isNotEmpty){
     for(var row in res){
       print("name ${row['fullname']}" + "email ${row['email']}"+"passwod ${row ['password']}");
     }
    }
    return null;
  }


 //Update user
        static void updateuserinformation(userModel user)  async {
        var res =await  _db!.update("USERDATA",{'email':user.email,'password':user.password}, where: "userid = ?", whereArgs: [user.id]);
  }

  //Delete user
    static void deleteuser(int id) async {
        var res =await  _db!.delete("USERDATA",where: "userid = ?", whereArgs: [id]);
  }
  closeDB() async =>await _db!.close();

}