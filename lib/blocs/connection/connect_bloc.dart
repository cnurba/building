import 'dart:convert';
import 'package:building/models/menu_model/main_menu_model.dart';
import 'package:building/models/user/connection_option.dart';
import 'package:building/models/user/user.dart';
import 'package:building/servises/db_provider.dart';
import 'package:building/servises/helper_1c.dart';
import 'package:building/servises/preferense_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'connect_event.dart';
import 'connect_state.dart';

class ConnectBloc extends Bloc<ConnectEvent, ConnectState> {
  @override
  ConnectState get initialState => ConnectUninitialized();
  @override
  Stream<ConnectState> mapEventToState(ConnectEvent event) async* {
    if (event is CheckConnectEvent) {
      final checkFilling = checkConnectionFill(event.connectionOption);

      if (checkFilling["error"]) {
        yield ConnectCheckedState(
            textScaffold: checkFilling["errorText"], error: true);
      } else {

        final checkResults =
            await Helper1C.checkConnection1C(event.connectionOption);
        if (!checkResults.error) {
          PreferenceHelper.save(
              "ConnectionOption", json.encode(event.connectionOption.toJson()));
        }

        yield ConnectCheckedState(
            textScaffold: (checkResults.error)
                ? checkResults.errorText
                : checkResults.data,
            error: checkResults.error);
      }
    }
    else if (event is DemoConnectEvent) {

      final listOfMainMenuModel = MainMenuModel.getDemoData();

      yield ConnectAuthenticated(
        demo: true,
        listOfMainMenuModel: listOfMainMenuModel,
      );
    }
    else if (event is LoggedInEvent) {

      final _checkUserFill = checkUserFill(event.user);

      if(_checkUserFill["error"]){
        yield UserCheckedState(error: true, textScaffold:_checkUserFill["errorText"] );
      }

      else{

        final checkDataFromServer = await Helper1C.registrationConnection1C(event.connectionOption,event.user);
        List<MainMenuModel>menuList =[];
        if (checkDataFromServer.error){
          yield UserCheckedState(error: true, textScaffold:checkDataFromServer.errorText);
        }
        else{
            await PreferenceHelper.save(
                "User", json.encode(event.user.toJson()));
            menuList = MainMenuModel.addPropertiesToMenu(checkDataFromServer.data);

            await DBProvider.db.deleteAllMainMenuData();
            await DBProvider.db.insertDataToMainMenu(checkDataFromServer.data);
            yield ConnectAuthenticated(demo: false,listOfMainMenuModel:menuList,user: event.user,connectionOption: event.connectionOption);

            // полное синхронизация
            await Helper1C.synchronization(event.connectionOption,event.user);

        }

      }
    }
    else if (event is AppStartedEvent) {
      ConnectionOption connectionOption;
      User user;
      var jsonConnection;
      var jsonUser;
      List<String> menuString =[];

      final containsKey = await PreferenceHelper.containsKey("ConnectionOption");
      if (containsKey) {
        jsonConnection =
            await PreferenceHelper.read("ConnectionOption");

      }
      if(jsonConnection!=null){
        connectionOption = ConnectionOption.fromJson(jsonConnection);
      }else{connectionOption = ConnectionOption();}

      final containsUserKey = await PreferenceHelper.containsKey("User");

      if (containsUserKey) {
        jsonUser =
        await PreferenceHelper.read("User");

      }

      if(jsonUser!=null){
        user = User.fromJson(jsonUser);
      }else{user = User();}

      List<MainMenuModel>listOfMainMenuModel ;

      menuString = await DBProvider.db.getListMainMenu();

      if(menuString!=null){
        listOfMainMenuModel= MainMenuModel.addPropertiesToMenu(menuString);
      }else{
        listOfMainMenuModel = MainMenuModel.getDemoData();
      }

      if(containsKey){
        yield ConnectAuthenticated(demo: false,listOfMainMenuModel: listOfMainMenuModel,connectionOption: connectionOption,user: user);
      }else{
        yield ConnectUnauthenticated();
      }
    }
    else {
      DBProvider.db.deleteDataFromBase();
      await PreferenceHelper.remove("User");
      await PreferenceHelper.remove("Connection");
      yield ConnectUnauthenticated();
    }
  }

  Map<String, dynamic> checkUserFill(User user) {
    if (user.name == "") {
      return {
        "error": true,
        "errorText": "Не заполнено поле Логин",
      };
    } else if (user.password ==""){
      return {
        "error": true,
        "errorText": "Не заполнено поле Логин",
      };
    }

    return {
      "error": false,
      "errorText": "",
    };
  }

  Map<String, dynamic> checkConnectionFill(ConnectionOption connectionOption) {
    if (connectionOption.ip == "") {
      return {
        "error": true,
        "errorText": "Не заполнено поле IP",
      };
    } else if (connectionOption.port == "") {
      return {
        "error": true,
        "errorText": "Не заполнено поле IP",
      };
    } else if (connectionOption.password == "") {
      return {
        "error": true,
        "errorText": "Не заполнено поле Пароль",
      };
    } else if (connectionOption.http == "") {
      return {
        "error": true,
        "errorText": "Не заполнено поле HTTP",
      };
    } else {
      return {
        "error": false,
        "errorText": "Не заполнено поле HTTP",
      };
    }
  }
}
