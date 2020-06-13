import 'package:building/models/user/connection_option.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final ConnectionOption connectionOption;
  const LoginPage({Key key, this.connectionOption}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Form(
      child: Column(
        children: <Widget>[
           Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                    hintText: "Логин",
                    prefixIcon:Icon(Icons.person,size: 18.0,),
                  ),
                ),

                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Пароль",
                    prefixIcon:Icon(Icons.lock,size: 18.0,),
                  ),
                ),
              ],
            ),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("Регистрация"),
            color: Colors.brown,
          )
        ],
      ),
    );
  }
}
