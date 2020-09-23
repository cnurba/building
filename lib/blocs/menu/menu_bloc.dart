import 'package:building/blocs/menu/menu_event.dart';
import 'package:building/blocs/menu/menu_state.dart';
import 'package:building/models/debt_models/debt_model.dart';
import 'package:building/models/flat_models/house_model.dart';
import 'package:building/models/menu_model/main_menu_model.dart';
import 'package:building/models/tasks_model/task.dart';
import 'package:building/models/users_model/users_model.dart';
import 'package:building/servises/db_provider.dart';
import 'package:building/servises/helper_1c.dart';
import 'package:building/servises/preferense_helper.dart';
import 'package:building/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuBloc extends Bloc<MenuEvent,MenuState>{
  @override
  MenuState get initialState => LoadingMenuState();
  @override
  Stream<MenuState> mapEventToState(MenuEvent event) async*{
    if(event is MenuClickedEvent){
     if(event.demo){
       if(event.typeOfMainMenu==TypeOfMainMenu.home){
         final listOfHouses = HouseModel.getDemoHouses();
         yield HomeState(houseList:listOfHouses);
       }else if(event.typeOfMainMenu==TypeOfMainMenu.report){
         yield ReportState();
       }else if (event.typeOfMainMenu==TypeOfMainMenu.users){
         final usersList = UsersModel.demoUsers();
         yield UsersState(userList:usersList);
       }else if (event.typeOfMainMenu==TypeOfMainMenu.task){
         final taskList = Task.getDemoTaskList();
         yield TaskState(taskList: taskList);
       }else if (event.typeOfMainMenu==TypeOfMainMenu.debtOnSchedule){
         final debtList = await DebtModel.getDemoDebt();
         yield DebtState(debtList:debtList );
       }else if(event.typeOfMainMenu==TypeOfMainMenu.connection) {
         yield ConnectState();
       }else {
         yield ConnectState();
       }
     }else{
       if(event.typeOfMainMenu==TypeOfMainMenu.home){
         final listOfHouses = await DBProvider.db.getHouseModels();
         yield HomeState(houseList:listOfHouses);
       }else if(event.typeOfMainMenu==TypeOfMainMenu.report){
          yield ReportState();
       }else if (event.typeOfMainMenu==TypeOfMainMenu.users){
         final usersList = await DBProvider.db.getUsers();
         yield UsersState(userList:usersList);
       }else if (event.typeOfMainMenu==TypeOfMainMenu.task){
         final taskList = await DBProvider.db.getTasks();
         yield TaskState(taskList: taskList);
       }else if (event.typeOfMainMenu==TypeOfMainMenu.debtOnSchedule){
         final debtList = await DBProvider.db.getDebts();
         yield DebtState(debtList:debtList);
       }else if(event.typeOfMainMenu==TypeOfMainMenu.connection) {
         yield ConnectState(user: event.user,connectionOption: event.connectionOption);
       }else if(event.typeOfMainMenu==TypeOfMainMenu.sync) {
        final menuData= await Helper1C.synchronization(event.connectionOption,event.user);
        yield SyncState(syncResult:menuData.data);
       }
       else{

        yield LoadingMenuState();

      }
     }
    }
  }
}
