import 'package:building/models/user/connection_option.dart';
import 'package:building/ui/registration/login_page.dart';
import 'package:building/ui/registration/registration_page.dart';
import 'package:building/util/constants.dart';
import 'package:flutter/material.dart';

class MainRegPage extends StatefulWidget {
  final int initialIndex;
  final ConnectionOption connectionOption;
  const MainRegPage({Key key, this.connectionOption, this.initialIndex}) : super(key: key);
  @override
  _MainRegPageState createState() => _MainRegPageState();
}

class _MainRegPageState extends State<MainRegPage>{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: new Scaffold(
        appBar: new AppBar(
          leading: Container(),
          backgroundColor: CONSTANTS.mainBackgroundColor,
          flexibleSpace: new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              new TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  new Tab(text: "Подключения",),
                  new Tab(text: "Вход",),
               ],
              ),
            ],
          ),
        ),
        body: new TabBarView(
          children: <Widget>[
            SingleChildScrollView(
                child: new RegistrationPage(connectionOption: widget.connectionOption,)
            ),
            SingleChildScrollView(
                child: new LoginPage(connectionOption: widget.connectionOption,)
            ),
          ],
        ),
      ),
    );

  }
}
