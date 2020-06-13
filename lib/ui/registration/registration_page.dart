import 'package:building/blocs/connection/connect_bloc.dart';
import 'package:building/blocs/connection/connect_event.dart';
import 'package:building/models/user/connection_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatefulWidget {
  final ConnectionOption connectionOption;
  const RegistrationPage({Key key, this.connectionOption}) : super(key: key);
  @override
  _RegistrationPageState createState() => _RegistrationPageState();

}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController loginController;
  TextEditingController passwordController;
  TextEditingController portController;
  TextEditingController httpController;
  TextEditingController ipController;

  @override
  void initState() {
    super.initState();
//    httpController.text = (widget.connectionOption != null)?widget.connectionOption.http:"";
//    loginController.text = (widget.connectionOption != null)?widget.connectionOption.login:"";
//    passwordController.text = (widget.connectionOption != null)?widget.connectionOption.password:"";
//    portController.text = (widget.connectionOption != null)?widget.connectionOption.port:"";
//    ipController.text = (widget.connectionOption != null)?widget.connectionOption.ip:"";
  }

  @override
  Widget build(BuildContext context) {
    final connectBloc = BlocProvider.of<ConnectBloc>(context);
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Form(
           child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
//                    Text("Параметры подключения"),
//                    SizedBox(
//                      height: 12.0,
//                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: loginController,
                      decoration: InputDecoration(
                        hintText: "Логин",
                        prefixIcon:Icon(Icons.person,size: 18.0,),
                      ),
                   ),

                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Пароль",
                        prefixIcon:Icon(Icons.lock,size: 18.0,),
                      ),
                    ),

                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: ipController,
                      decoration: InputDecoration(
                        hintText: "ip",
                        prefixIcon:Icon(Icons.adjust,size: 18.0,),
                      ),
                    ),

                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: httpController,
                      decoration: InputDecoration(
                        hintText: "http",
                        prefixIcon:Icon(Icons.http,size: 18.0,),
                      ),
                    ),

                    TextFormField(
                      keyboardType:TextInputType.number,
                      controller: httpController,
                      decoration: InputDecoration(
                        hintText: "port",
                        prefixIcon:Icon(Icons.pie_chart_outlined,size: 18.0,),
                      ),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () {
                  connectBloc.add(CheckConnectEvent());
                },
                child: Text("Проверка связи"),
                color: Colors.brown,
              )
            ],
          ),
    );
  }
}
