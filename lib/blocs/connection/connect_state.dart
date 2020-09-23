import 'package:building/models/menu_model/main_menu_model.dart';
import 'package:building/models/user/connection_option.dart';
import 'package:building/models/user/user.dart';
import 'package:equatable/equatable.dart';

abstract class ConnectState extends Equatable {
  @override
  List<Object> get props {
    return [];
  }
}
//waiting to see if the user is authenticated or not on app start
class ConnectUninitialized  extends ConnectState {}
//waiting to persist/delete a token
class ConnectLoading extends ConnectState{}
//successfully authenticated
class ConnectAuthenticated  extends ConnectState{
  final ConnectionOption connectionOption;
  final User user;
  final List<MainMenuModel> listOfMainMenuModel;
  final bool demo;
  ConnectAuthenticated({this.connectionOption, this.user, this.listOfMainMenuModel, this.demo =false});
}
//not authenticated
class ConnectUnauthenticated  extends ConnectState{}

//checking connection.on click button checkConnection
class ConnectCheckedState extends ConnectState{
  final bool error;
  final String textScaffold;
  ConnectCheckedState({this.error, this.textScaffold});
}

class UserCheckedState extends ConnectState{
  final bool error;
  final String textScaffold;
  UserCheckedState({this.error, this.textScaffold});
}



