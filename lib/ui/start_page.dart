import 'package:building/blocs/connection/connect_bloc.dart';
import 'package:building/blocs/connection/connect_event.dart';
import 'package:building/models/user/connection_option.dart';
import 'package:building/models/user/user.dart';
import 'package:building/ui/main_menu.dart';
import 'package:building/ui/registration/main_reg_page.dart';
import 'package:building/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}
class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    final connectBloc = BlocProvider.of<ConnectBloc>(context);
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          connectBloc.add(DemoConnectEvent());
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MainMenuPage(demo: true,),
          ));
        },
       backgroundColor: Colors.white,
       label: Text("Демо",style: TextStyle(
         color: Colors.red
       ),),
      ),
       body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: screenHeight / 2,
            width:double.infinity,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage(CONSTANTS.logoPath),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(105),
              height: screenHeight / 2,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Center(
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MainRegPage(connectionOption: ConnectionOption(),user: User(),initialIndex: 0,),
                    ));
                  },
                  radius: 40.0,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  highlightColor: Colors.greenAccent,
                  focusColor: Colors.red,
                  splashColor:Colors.red ,
                  child: CircleAvatar(
                    maxRadius: 35.0,
                    minRadius: 30.0,
                    foregroundColor: Colors.red,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_forward,color: Theme.of(context).primaryColor,size: 40.0,),
                  ),
                )
              ),
          ),
        ],
      ),
    );
  }
}
