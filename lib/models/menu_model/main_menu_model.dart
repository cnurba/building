import 'package:building/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainMenuModel{
  String _name;
  IconData _iconData;
  Color _color;

  MainMenuModel(this._name, this._iconData, this._color);

  Color get color => _color;

  IconData get iconData => _iconData;

  String get name => _name;

  set color(Color value) {
    _color = value;
  }

  set iconData(IconData value) {
    _iconData = value;
  }

  set name(String value) {
    _name = value;
  }

  static List<MainMenuModel> getDemoData(){
    return [
      new MainMenuModel("Отчеты", Icons.category, CONSTANTS.mainBtnColor1),
      new MainMenuModel("Дома", Icons.home, CONSTANTS.mainBtnColor2),
      new MainMenuModel("Долги по графику", Icons.folder_shared, CONSTANTS.mainBtnColor3),
      new MainMenuModel("Задачи", Icons.transfer_within_a_station, CONSTANTS.mainBtnColor4),
      new MainMenuModel("Параметры подключения", Icons.http, CONSTANTS.mainBtnColor5),
      new MainMenuModel("Settings", Icons.settings, CONSTANTS.mainBackgroundColor),
    ];
  }
}