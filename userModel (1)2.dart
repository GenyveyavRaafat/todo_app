import 'package:flutter/src/widgets/editable_text.dart';

class userModel{
  int? id;
  String? fullname;
  String? email;
  String? password;

  userModel({
    this.id,
     this.fullname,
     this.email,
     this.password, 
});

//   Map<String,dynamic> toMap(){
//     var map=<String,dynamic>{
//       'fullname':fullname,
//       'email':email,
//       'password':password,
//     };
//     return map;
//   }
//   @override
// String toString(){
// return 'user(fullname:$fullname,email:$email,password:$password)';

// }


}