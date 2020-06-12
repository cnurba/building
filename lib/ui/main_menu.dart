import 'package:building/models/user/settings.dart';
import 'package:building/util/constants.dart';
import 'package:flutter/material.dart';
class MainMenuPage extends StatelessWidget {
  final Settings settings;

  const MainMenuPage({Key key, this.settings}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(

      appBar: AppBar(


      ),
      body:Container(
        height:size.height/6 ,
        width: size.width-30,
        decoration: BoxDecoration(
          color: CONSTANTS.mainBtnColor0,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),

          ]
        ),

      ) ,
    );
  }
}
