import 'package:building/util/enums.dart';

abstract class MenuEvent{}

class MenuClickedEvent extends MenuEvent{
  final TypeOfMainMenu typeOfMainMenu;
  final bool demo;
  MenuClickedEvent({this.typeOfMainMenu, this.demo});
}
