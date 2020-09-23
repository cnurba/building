import 'package:building/blocs/connection/connect_bloc.dart';
import 'package:building/blocs/connection/connect_event.dart';
import 'package:building/blocs/connection/connect_state.dart';
import 'package:building/blocs/menu/menu_bloc.dart';
import 'package:building/blocs/menu/menu_event.dart';
import 'package:building/models/user/connection_option.dart';
import 'package:building/models/user/user.dart';
import 'package:building/ui/main_menu_helper.dart';
import 'package:building/ui/registration/main_reg_page.dart';
import 'package:building/ui/start_page.dart';
import 'package:building/util/constants.dart';
import 'package:building/util/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainMenuPage extends StatelessWidget {
  final ConnectionOption connectionOption;
  final User user;
  final bool demo;
  const MainMenuPage({Key key,this.demo, this.connectionOption, this.user, }) : super(key: key);

  void choiceAction(String choice,BuildContext context){
    if(choice==CONSTANTS.synchronization){
      BlocProvider.of<MenuBloc>(context).add(
      MenuClickedEvent(demo:demo,typeOfMainMenu: TypeOfMainMenu.sync,connectionOption: connectionOption,user: user),
      );
       
    }else if(choice==CONSTANTS.settings){
      BlocProvider.of<MenuBloc>(context).add(
      MenuClickedEvent(demo:demo,typeOfMainMenu: TypeOfMainMenu.connection,connectionOption: connectionOption,user: user),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => MainRegPage(connectionOption: connectionOption,user: user,initialIndex: 0,),));
    }else{
      BlocProvider.of<ConnectBloc>(context).add(loggedOut());
      Navigator.push(context, MaterialPageRoute(builder: (context) => StartPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(""),
        actions: <Widget>[
         PopupMenuButton<String>(
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
           color: Colors.white,
            icon: Icon(Icons.map),
            tooltip: "Настройки",
            onSelected: (value) {
             choiceAction(value,context);
           },
           itemBuilder:(context) {
            List<String> choices =[];
             if(demo){
               choices = CONSTANTS.demoChoices;
             }else{
               choices = CONSTANTS.choices;
             }
          return choices.map((String choice) {
             return PopupMenuItem<String>(
               value: choice,
               child:Text(choice),
             );
           }).toList();
         },)
        ],
      ),
      body: BlocBuilder<ConnectBloc,ConnectState>(
        builder: (context, state) {
          if(state is ConnectAuthenticated){
            return GridView.builder(
              itemCount: state.listOfMainMenuModel.length,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    BlocProvider.of<MenuBloc>(context).add(
                        MenuClickedEvent(demo: state.demo,typeOfMainMenu: state.listOfMainMenuModel.elementAt(index).typeOfMainMenu,connectionOption: state.connectionOption,user: state.user),
                     );
                     Navigator.of(context).push(MaterialPageRoute(
                       builder: (context) => MainMenuHelper(demo: demo,),
                     ));
                     //BlocProvider.of<MenuBloc>(context).add(MenuClickedEvent(demo: state.demo,typeOfMainMenu: state.listOfMainMenuModel.elementAt(index).typeOfMainMenu));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.all(8.0),
                    height: size.height / 4,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.elliptical(80, 10)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blueGrey,
                              offset: Offset(10,-5.0),
                              blurRadius: 7.0,
                              spreadRadius: 0.5
                          )
                        ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(state.listOfMainMenuModel.elementAt(index).iconData,size: 35.0,color: state.listOfMainMenuModel.elementAt(index).color,),
                        Text("${state.listOfMainMenuModel.elementAt(index).name}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: state.listOfMainMenuModel.elementAt(index).color,
                        ),),
                      ],
                    ) ,
                  ),
                );
              },
            );
          }
          else {
            return Center(child: CircularProgressIndicator());
          }
        },

      ),
    );
  }
}
