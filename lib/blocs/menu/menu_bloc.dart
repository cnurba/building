import 'package:building/blocs/menu/menu_event.dart';
import 'package:building/blocs/menu/menu_state.dart';
import 'package:building/util/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuBloc extends Bloc<MenuEvent,MenuState>{
  @override
  MenuState get initialState => LoadingMenuState();

  @override
  Stream<MenuState> mapEventToState(MenuEvent event) async*{

    if(event is MenuClickedEvent){
     if(event.demo){
       final MenuState currentState = getDemoDate(event.typeOfMainMenu);


     }else{

     }
    }
  }
}

MenuState getDemoDate(TypeOfMainMenu typeOfMainMenu) {
  MenuState menuState;

  if(typeOfMainMenu==TypeOfMainMenu.home){

  }else if(typeOfMainMenu==TypeOfMainMenu.report){

  }else if (typeOfMainMenu==TypeOfMainMenu.settings){

  }else if (typeOfMainMenu==TypeOfMainMenu.task){

  }else if (typeOfMainMenu==TypeOfMainMenu.debtOnSchedule){

  }else {

  }

  return menuState;

}