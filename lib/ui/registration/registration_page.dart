import 'package:building/ui/registration/reg_widgets/clipper_widget.dart';
import 'package:building/ui/registration/reg_widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
       body:SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ClipPath(
                clipper: ClipperWidget(),
                child: Container(
                  color: Colors.brown,
                  width: double.infinity,
                  height: size.height/4,
                  child: Center(
                      child: Text("Добро пожаловать",style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0
                      ),)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextFieldWidget(
                      onChanged: (){},
                      obscureText: false,
                      hintText: "login",
                      prefixIconData: Icons.person,
                    ),
                    TextFieldWidget(
                      onChanged: (){},
                      obscureText: true,
                      hintText: "password",
                      prefixIconData: Icons.person,
                    ),
                    TextFieldWidget(
                      onChanged: (){},
                      obscureText: false,
                      hintText: "ip",
                      prefixIconData: Icons.person,
                    ),

                    TextFieldWidget(
                      onChanged: (){},
                      obscureText: false,
                      hintText: "http",
                      prefixIconData: Icons.person,
                    ),
                    TextFieldWidget(
                      onChanged: (){},
                      obscureText: false,
                      hintText: "port",
                      prefixIconData: Icons.person,
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    onPressed: (){},
                    child: Text("Войти"),
                    color: Colors.brown,
                  ),
                  RaisedButton(
                    child: Text("Выйти"),
                    color: Colors.brown,
                  ),

                  RaisedButton(
                    child: Text("Демо"),
                    color: Colors.brown,
                  ),
                ],
              )
            ],
         ),
       ),
        //],
      //),
    );
  }
}
