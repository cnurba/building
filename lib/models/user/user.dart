import 'dart:convert';

class User {
  String name;
  String password;
  User({this.password,this.name});



  factory User.fromJson(Map<String,dynamic> parsedJson){
     return User(
     name: parsedJson["login"],
     password: parsedJson["password"],
     );
   }
  Map<String,dynamic>toJson()=>{
     "login":name,
     "password":password,
  };
}