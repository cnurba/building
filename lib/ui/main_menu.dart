import 'package:building/models/user/settings.dart';
import 'package:building/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainMenuPage extends StatelessWidget {
  final Settings settings;
  const MainMenuPage({Key key, this.settings}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
      ),
      body: GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Container(
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
                Icon(Icons.forward,size: 35.0,color: CONSTANTS.mainBackgroundColor,),
                Text("Отчеты"),
              ],
            ) ,
          );
        },
      ),
    );
  }
}
