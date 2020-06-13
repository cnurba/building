import 'package:building/blocs/connection/connect_bloc.dart';
import 'package:building/blocs/connection/connect_state.dart';
import 'package:building/blocs/menu/menu_bloc.dart';
import 'package:building/blocs/menu/menu_event.dart';
import 'package:building/models/user/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainMenuPage extends StatelessWidget {
  final Settings settings;
  const MainMenuPage({Key key, this.settings}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("ОсОО Аристикрат"),
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
                       BlocProvider.of<MenuBloc>(context).add(MenuClickedEvent(demo: state.demo,typeOfMainMenu: state.listOfMainMenuModel.elementAt(index).typeOfMainMenu));
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
            return CircularProgressIndicator();
          }
        },

      ),
    );
  }
}
