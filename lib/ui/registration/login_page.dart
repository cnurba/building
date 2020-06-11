import 'package:building/models/user/connection_option.dart';
import 'package:building/ui/registration/reg_widgets/clipper_widget.dart';
import 'package:building/ui/registration/reg_widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final ConnectionOption connectionOption;

  const LoginPage({Key key, this.connectionOption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: ClipperWidget(),
              child: Container(
                color: Colors.brown,
                width: double.infinity,
                height: size.height / 4,
                child: Center(
                    child: Text(
                  "Добро пожаловать",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextFieldWidget(
                    onChanged: () {},
                    obscureText: false,
                    hintText: "login",
                    prefixIconData: Icons.person,
                  ),
                  TextFieldWidget(
                    onChanged: () {},
                    obscureText: true,
                    hintText: "password",
                    prefixIconData: Icons.lock,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Назад"),
                  color: Colors.brown,
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("Регистрация"),
                  color: Colors.brown,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
