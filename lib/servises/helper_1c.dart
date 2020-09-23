import 'dart:convert';
import 'package:building/models/API/api_model.dart';
import 'package:building/models/debt_models/debt_model.dart';
import 'package:building/models/flat_models/flat_model.dart';
import 'package:building/models/flat_models/house_model.dart';
import 'package:building/models/menu_model/report_menu_model.dart';
import 'package:building/models/report_model/report_detail_model.dart';
import 'package:building/models/tasks_model/task.dart';
import 'package:building/models/user/connection_option.dart';
import 'package:building/models/user/user.dart';
import 'package:building/models/users_model/users_model.dart';
import 'package:http/http.dart' as http;
import 'db_provider.dart';

class Helper1C {
  static Future<APIModel<String>> checkConnection1C(
      ConnectionOption connectionOption) async {
    return await http
        .get("${connectionOption.getBaseUrl()}/echo",
            headers: connectionOption.getHeaders())
        .then((data) {
      if (data.statusCode == 200) {
        final text = utf8.decode(data.bodyBytes);
        return APIModel<String>(data: text, error: false);
      } else {
        return APIModel<String>(
          errorText:
              "Ошибка подключения: код ошибки ${data.statusCode.toString()}",
          error: true,
        );
      }
    }).catchError((e) {
      return APIModel<String>(
        error: true,
        errorText: e.toString(),
      );
    });
  }

  static Future<APIModel<List<String>>> registrationConnection1C(
      ConnectionOption connectionOption, User user) async {
    return await http
        .post("${connectionOption.getBaseUrl()}/registration",
            headers: connectionOption.getHeaders(), body: json.encode(user.toJson()))
        .then((data) {
      if (data.statusCode == 200) {

        final jsonData = json.decode(utf8.decode(data.bodyBytes));

        List<String> mainMenuData = [];

        if(jsonData["error"]){
          return APIModel<List<String>>(data: mainMenuData, error: true,errorText: jsonData["errorText"]);
        }else{

          for(var item in jsonData["data"]){
            mainMenuData.add(item);
          }
          return APIModel<List<String>>(data: mainMenuData, error: false);
        }

      } else {
        return APIModel<List<String>>(
          errorText:
              "Ошибка подключения: код ошибки ${data.statusCode.toString()}",
          error: true,
        );
      }
    }).catchError((e) {
      return APIModel<List<String>>(
        error: true,
        errorText: e.toString(),
      );
    });
  }

  static Future<APIModel<List<String>>> synchronization (ConnectionOption connectionOption, User user) async{
    return await http.post("${connectionOption.getBaseUrl()}/synchronization",
        headers: connectionOption.getHeaders(),
        body: json.encode(user.toJson()))
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(utf8.decode(data.bodyBytes));

        if(jsonData["error"]){
          return APIModel(errorText:jsonData["errorText"],error:jsonData["error"],data: null);
        }else{
          List<String> resultSync = [];
          if(jsonData["data"].containsKey("MainMenuModel")) {
             final text = syncMainMenuModel (jsonData["data"]);
             resultSync.add(text);
          }

          if(jsonData["data"].containsKey("ReportMenuModel")){
            final text = syncReportMenuModel (jsonData["data"]);
            resultSync.add(text);
          }

          if(jsonData["data"].containsKey("UsersModel")){
            final text = syncUsersModel (jsonData["data"]);
            resultSync.add(text);
          }

          if(jsonData["data"].containsKey("HouseModel")){
            final text = syncHouseModel (jsonData["data"]);
            resultSync.add(text);
          }

          if(jsonData["data"].containsKey("FlatModel")){
            final text = syncFlatModel (jsonData["data"]);
            resultSync.add(text);
          }

          if(jsonData["data"].containsKey("Task")){
            final text = syncTask (jsonData["data"]);
            resultSync.add(text);
          }

          if(jsonData["data"].containsKey("DebtModel")){
            final text = syncDebt (jsonData["data"]);
            resultSync.add(text);
          }

          if(jsonData["data"].containsKey("ReportDetailModel")){
            final text = syncReportDetailModel (jsonData["data"]);
            resultSync.add(text);
          }

          return APIModel(errorText:null,error:false,data:resultSync);
        }

       }

      return APIModel<List<String>>(
        errorText:
        "Ошибка подключения: код ошибки ${data.statusCode.toString()}",
        error: true,);

      }).catchError((e){
        return APIModel<List<String>>(
          errorText:
          "Ошибка подключения:${e.toString()}",
          error: true,);
    });
  }

  static String syncMainMenuModel(Map<String,dynamic> jsonData) {
        List<String> menuModel = [];
        for (var item in jsonData["MainMenuModel"]){
          menuModel.add(item);
        }

        DBProvider.db.deleteAllMainMenuData();
        DBProvider.db.insertDataToMainMenu(menuModel);

        return "...идет загрузка: -Меню главной страницы ";
  }

  static String syncReportMenuModel(Map<String,dynamic> jsonData) {
    List<ReportMenuModel> reportMenuList =[];

    for (var item in jsonData["ReportMenuModel"]){
      ReportMenuModel reportMenuModel = ReportMenuModel.FromJson(item);
      reportMenuList.add(reportMenuModel);

    }
    DBProvider.db.deleteAllReportMenuData();
    DBProvider.db.insertDataToReportMainMenu(reportMenuList);
    return "...идет загрузка:- Меню детальной страницы ";
  }

  static String syncUsersModel(Map<String,dynamic> jsonData) {
    List<UsersModel> usersList =[];

    for (var item in jsonData["UsersModel"]){
      UsersModel usersModel = UsersModel.FromJson(item);
      usersList.add(usersModel);

    }
    DBProvider.db.deleteAllUsersData();
    DBProvider.db.insertDataToUsersModel(usersList);
    return "...идет загрузка: - Пользователи";
  }

  static String syncHouseModel(Map<String,dynamic> jsonData) {
    List<HouseModel> houseList =[];
    for (var item in jsonData["HouseModel"]){
      HouseModel houseModel = HouseModel.FromJson(item);
      houseList.add(houseModel);
    }

    DBProvider.db.deleteAllHouseModelData();
    DBProvider.db.insertDataToHouseModel(houseList);
    return "...идет загрузка: - Список домов";
  }

  static String syncFlatModel(Map<String,dynamic> jsonData) {
    List<FlatModel> flatList =[];
    for (var item in jsonData["FlatModel"]){
      FlatModel flatModel = FlatModel.FromJson(item);
      flatList.add(flatModel);
    }
    DBProvider.db.deleteAllFlatModelData();
    DBProvider.db.insertDataToFlatModel(flatList);
    return "...идет загрузка: - Список квартир";
  }

  static String syncTask(Map<String,dynamic> jsonData) {
    List<Task> taskList =[];
    for (var item in jsonData["Task"]){
      Task task = Task.FromJson(item);
      taskList.add(task);
    }
    DBProvider.db.deleteAllTaskData();
    DBProvider.db.insertDataToTask(taskList);
    return "...идет загрузка: - задачи";
  }

  static String syncDebt(Map<String,dynamic> jsonData) {
    List<DebtModel> debtList =[];
    for (var item in jsonData["DebtModel"]){
      DebtModel debtModel = DebtModel.fromJson(item);
      debtList.add(debtModel);
    }
    DBProvider.db.deleteAllDebtsData();
    DBProvider.db.insertDataToDebt(debtList);
    return "...идет загрузка: - долги по графику";
  }


  static String syncReportDetailModel(Map<String,dynamic> jsonData) {
    List<ReportDetailModel> reportDetailModels =[];
    for (var item in jsonData["ReportDetailModel"]){
      ReportDetailModel detailModel = ReportDetailModel.fromJson(item);
      reportDetailModels.add(detailModel);
    }
    DBProvider.db.deleteAllReportDetailModelData();
    DBProvider.db.insertDataToReportDetailModel(reportDetailModels);
    return "...идет загрузка: - долги по графику";
  }

}
