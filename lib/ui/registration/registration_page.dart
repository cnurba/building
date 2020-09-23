import 'package:building/blocs/connection/connect_bloc.dart';
import 'package:building/blocs/connection/connect_event.dart';
import 'package:building/blocs/connection/connect_state.dart';
import 'package:building/models/user/connection_option.dart';
import 'package:building/ui/registration/main_reg_page.dart';
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
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController portController = TextEditingController();
  TextEditingController httpController = TextEditingController();
  TextEditingController ipController = TextEditingController();

  Future delayedSnakeBar(context, String message, bool error) async {
    await Future.delayed(Duration(seconds: 1));
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: (error) ? Colors.red : Colors.greenAccent,
        duration: Duration(seconds: 10),
      ),
    );
    if (!error) {
      await Future.delayed(Duration(seconds: 1));
      await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return MainRegPage(
            connectionOption: new ConnectionOption(
              ip: ipController.text,
              login: loginController.text,
              http: httpController.text,
              port: portController.text,
              password: passwordController.text,
            ),
            initialIndex: 1,
          );
        },
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    httpController.text = (widget.connectionOption.http != null)
        ? widget.connectionOption.http
        : "";
    loginController.text = (widget.connectionOption.login != null)
        ? widget.connectionOption.login
        : "";
    passwordController.text = (widget.connectionOption.password != null)
        ? widget.connectionOption.password
        : "";
    portController.text = (widget.connectionOption.port != null)
        ? widget.connectionOption.port
        : "";
    ipController.text =
        (widget.connectionOption.ip != null) ? widget.connectionOption.ip : "";
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
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: loginController,
                  decoration: InputDecoration(
                    hintText: "Логин",
                    labelText: "Логин",
                    prefixIcon: Icon(
                      Icons.person,
                      size: 18.0,
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Пароль",
                    labelText: "Пароль",
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 18.0,
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: ipController,
                  decoration: InputDecoration(
                    hintText: "10.0.2.2",
                    labelText: "ip",
                    prefixIcon: Icon(
                      Icons.adjust,
                      size: 18.0,
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: httpController,
                  decoration: InputDecoration(
                    labelText: "http",
                    hintText: "wts/hs/serv",
                    prefixIcon: Icon(
                      Icons.http,
                      size: 18.0,
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: portController,
                  decoration: InputDecoration(
                    hintText: "8000",
                    labelText: "port",
                    prefixIcon: Icon(
                      Icons.pie_chart_outlined,
                      size: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<ConnectBloc, ConnectState>(
            builder: (context, state) {
              if (state is ConnectCheckedState) {
                delayedSnakeBar(context, state.textScaffold, state.error);
                return RaisedButton(
                  onPressed: () {
                    connectBloc.add(CheckConnectEvent(
                      connectionOption: ConnectionOption(
                        password: passwordController.text,
                        port: portController.text,
                        http: httpController.text,
                        login: loginController.text,
                        ip: ipController.text,
                      ),
                    ));
                  },
                  child: Text("Проверка связи"),
                  color: Colors.brown,
                );
              } else {
                return RaisedButton(
                  onPressed: () {
                    connectBloc.add(CheckConnectEvent(
                      connectionOption: ConnectionOption(
                        password: passwordController.text,
                        port: portController.text,
                        http: httpController.text,
                        login: loginController.text,
                        ip: ipController.text,
                      ),
                    ));
                  },
                  child: Text("Проверка связи"),
                  color: Colors.brown,
                );
              }
            },
          ),
          RaisedButton(
           onPressed:(widget.connectionOption.login==null)?null: () {
             Navigator.pop(context);
             },
            child: Text("Назад"),
            color: Colors.white,
            disabledColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
