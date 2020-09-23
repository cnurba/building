import 'package:building/models/user/connection_option.dart';
import 'package:building/models/user/user.dart';
import 'package:building/util/enums.dart';

abstract class MenuEvent{}

class MenuClickedEvent extends MenuEvent{
  final TypeOfMainMenu typeOfMainMenu;
  final bool demo;
  final ConnectionOption connectionOption;
  final User user;
  MenuClickedEvent({this.connectionOption, this.user,this.typeOfMainMenu, this.demo});
}
