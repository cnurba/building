import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  String name;

  AnimationController animationController;

  @override
  void initState() {
      super.initState();

      // Отчеты
      // Настройки
      // Дома
      // Долги по графику\
      //Задачи

      // Выйти

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: Icon(Icons.add),
      appBar: AppBar(

      title: AnimatedBuilder(
        animation:animationController ,

          child: Text("Првиет")),
        actions: <Widget>[
          Icon(Icons.add),
          Icon(Icons.repeat)
        ],
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Kuba"),
              subtitle: Text("Student"),
            );
          } ,

      )

    );
  }
}
