
import 'package:building/util/enums.dart';

class Settings {
  ThemeMode themeMode;
  bool demo;
  bool showReports;
  bool showHouses;
  bool showTasks;
  bool showDebtOnSchedule;

  Settings({this.themeMode,this.demo, this.showReports, this.showHouses,
    this.showTasks,this.showDebtOnSchedule});


 static List<String> getDrawerMenuList(){
    return ["Отчеты","Дома","Долги по графику",
      "Задачи","Настройки","Параметры подключения",];
  }

}