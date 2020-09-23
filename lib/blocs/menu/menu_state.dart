import 'package:building/models/debt_models/debt_model.dart';
import 'package:building/models/flat_models/house_model.dart';
import 'package:building/models/tasks_model/task.dart';
import 'package:building/models/user/connection_option.dart';
import 'package:building/models/user/user.dart';
import 'package:building/models/users_model/users_model.dart';

abstract class MenuState{}

class ReportState extends MenuState{

}
class TaskState extends MenuState{
  List<Task> taskList;

  TaskState({this.taskList});
}

class DebtState extends MenuState{
  List<DebtModel> debtList;
  DebtState({this.debtList});
}

class UsersState extends MenuState{
  List<UsersModel> userList;
  UsersState({this.userList});
}

class ConnectState extends MenuState{
  ConnectionOption connectionOption;
  User user;

  ConnectState({this.connectionOption, this.user});
}

class HomeState extends MenuState{
  List<HouseModel> houseList;
  HomeState({this.houseList});
}
class LoadingMenuState extends MenuState{}

class ErrorMenuState extends MenuState{}

class SyncState extends MenuState{
  List<String> syncResult;
  SyncState({this.syncResult});
}
