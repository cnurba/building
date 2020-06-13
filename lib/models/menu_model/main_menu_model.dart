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

  static List<MainMenuModel> getDemoData(){
    return [
      new MainMenuModel("Отчеты", Icons.category, CONSTANTS.mainBtnColor1,TypeOfMainMenu.report),
      new MainMenuModel("Дома", Icons.home, CONSTANTS.mainBtnColor2,TypeOfMainMenu.home),
      new MainMenuModel("Долги по графику", Icons.folder_shared, CONSTANTS.mainBtnColor3,TypeOfMainMenu.debtOnSchedule),
      new MainMenuModel("Задачи", Icons.transfer_within_a_station, CONSTANTS.mainBtnColor4,TypeOfMainMenu.task),
      new MainMenuModel("Параметры подключения", Icons.http, CONSTANTS.mainBtnColor5,TypeOfMainMenu.connection),
      new MainMenuModel("Settings", Icons.settings, CONSTANTS.mainBackgroundColor,TypeOfMainMenu.settings),
    ];
  }
}