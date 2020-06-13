import 'package:building/models/menu_model/main_menu_model.dart';
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
  final List<MainMenuModel> listOfMainMenuModel;
  final bool demo;
  ConnectAuthenticated({this.listOfMainMenuModel, this.demo =false});
}
//not authenticated
class ConnectUnauthenticated  extends ConnectState{}


