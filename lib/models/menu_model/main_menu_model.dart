import 'package:building/util/constants.dart';
import 'package:building/util/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainMenuModel{
  String _name;
  IconData _iconData;
  Color _color;
  TypeOfMainMenu _typeOfMainMenu;

  MainMenuModel(this._name, this._iconData, this._color,this._typeOfMainMenu);

  Color get color => _color;

  TypeOfMainMenu get typeOfMainMenu => _typeOfMainMenu;

  IconData get iconData => _iconData;

  String get name => _name;

  set color(Color value) {
    _color = value;
  }

  set typeOfMainMenu(TypeOfMainMenu value) {
    _typeOfMainMenu = value;
  }
  set iconData(IconData value) {
    _iconData = value;
  }

  set name(String value) {
    _name = value;
  }

  static List<MainMenuModel> addPropertiesToMenu(List<String> menuNames){
       List<MainMenuModel> mainMenuList= [];
       menuNames.forEach((menu) {
         IconData iconData;
         Color color;
         TypeOfMainMenu typeOfMainMenu;

         if(menu=="Отчеты"){
           iconData = Icons.category;
           color = CONSTANTS.mainBtnColor1;
           typeOfMainMenu  = TypeOfMainMenu.report;
         }else if(menu=="Дома"){
           iconData = Icons.home;
           color = CONSTANTS.mainBtnColor2;
           typeOfMainMenu  = TypeOfMainMenu.home;
         }else if(menu=="Долги по графику"){
           iconData = Icons.folder_shared;
           color = CONSTANTS.mainBtnColor3;
           typeOfMainMenu  = TypeOfMainMenu.debtOnSchedule;
         }else if(menu=="Задачи"){
           iconData = Icons.transfer_within_a_station;
           color = CONSTANTS.mainBtnColor4;
           typeOfMainMenu  = TypeOfMainMenu.task;
         }else if(menu=="Параметры подключения"){
           iconData = Icons.http;
           color = CONSTANTS.mainBtnColor5;
           typeOfMainMenu  = TypeOfMainMenu.connection;
         }else if(menu=="Пользователи"){
           iconData = Icons.people_outline;
           color = CONSTANTS.mainBackgroundColor;
           typeOfMainMenu  = TypeOfMainMenu.users;
         }else if(menu=="Синхронизация") {
           iconData = Icons.donut_small;
           color = CONSTANTS.mainBtnColor2;
           typeOfMainMenu = TypeOfMainMenu.sync;
         } else {
           iconData = Icons.remove_circle;
           color = Colors.red;
           typeOfMainMenu = TypeOfMainMenu.other;
         }

         mainMenuList.add(new MainMenuModel(
             menu,
             iconData,
             color,
             typeOfMainMenu));
       });

    return mainMenuList;
  }

  static List<MainMenuModel> getDemoData(){
    return [
      new MainMenuModel("Отчеты", Icons.category, CONSTANTS.mainBtnColor1,TypeOfMainMenu.report),
      new MainMenuModel("Дома", Icons.home, CONSTANTS.mainBtnColor2,TypeOfMainMenu.home),
      new MainMenuModel("Долги по графику", Icons.folder_shared, CONSTANTS.mainBtnColor3,TypeOfMainMenu.debtOnSchedule),
      new MainMenuModel("Задачи", Icons.transfer_within_a_station, CONSTANTS.mainBtnColor4,TypeOfMainMenu.task),
      new MainMenuModel("Пользователи", Icons.people_outline, CONSTANTS.mainBackgroundColor,TypeOfMainMenu.users),
     ];
  }
}