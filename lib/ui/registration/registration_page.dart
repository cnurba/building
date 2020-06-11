import 'package:building/models/user/connection_option.dart';
import 'package:building/ui/registration/login_page.dart';
import 'package:building/ui/registration/reg_widgets/clipper_widget.dart';
import 'package:building/ui/registration/reg_widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegistrationPage extends StatefulWidget {
  final ConnectionOption connectionOption;

  const RegistrationPage({Key key, this.connectionOption}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  TextEditingController loginController;


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
                  height: size.height/4.5,
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
                    Text("Параметры подключения"),
                    SizedBox(height:12.0 ,),
                    TextFieldWidget(
                      onChanged: (){},
                      obscureText: false,
                      hintText: "User",
                      prefixIconData: Icons.person,
                    ),

                    TextFieldWidget(
                      onChanged: (){},
                      obscureText: true,
                      hintText: "password",
                      prefixIconData: Icons.lock,
                    ),
                    TextFieldWidget(
                      onChanged: (){},
                      obscureText: false,
                      hintText: "ip",
                      prefixIconData: Icons.adjust,
                    ),
                    TextFieldWidget(
                      onChanged: (){},
                      obscureText: false,
                      hintText: "http",
                      prefixIconData:Icons.http,
                    ),
                    TextFieldWidget(
                      onChanged: (){},
                      obscureText: false,
                      hintText: "port",
                      prefixIconData: Icons.pie_chart_outlined,
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    onPressed: (){

                    },
                    child: Text("Демо"),
                    color: Colors.brown,
                  ),
                  RaisedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginPage(
                          connectionOption: ConnectionOption(),
                        ),
                      ));
                    },
                    child: Text("Далее"),
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
