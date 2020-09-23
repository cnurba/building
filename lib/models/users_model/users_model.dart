import 'package:flutter/services.dart';

class UsersModel{
  String guid;
  String name;
  UsersModel({this.guid, this.name});

  factory UsersModel.FromJson(Map<String,dynamic> parsedJson){
    return UsersModel(
      name: parsedJson["name"],
      guid: parsedJson["guid"],
    );
  }

  Map<String,dynamic> toMap(){
    return {
      "name":name,
      "guid":guid,
    };
  }

  static List<UsersModel> demoUsers(){
    return [
      new UsersModel(
        name: "Адилет",
        guid: "1",
      ),
      new UsersModel(
        name: "Нуртилек",
        guid: "2",
      ),
      new UsersModel(
        name: "Актилек",
        guid: "3",
      ),

      new UsersModel(
        name: "Аскаралы",
        guid: "4",
      ),

    ];
  }
}