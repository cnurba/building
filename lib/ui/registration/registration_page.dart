import 'package:building/blocs/connection/connect_bloc.dart';
import 'package:building/blocs/connection/connect_event.dart';
import 'package:building/models/user/connection_option.dart';
import 'package:building/ui/registration/login_page.dart';
import 'package:building/ui/registration/reg_widgets/clipper_widget.dart';
import 'package:building/ui/registration/reg_widgets/text_field_widget.dart';
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
    httpController.text = (widget.connectionOption.http != null)?widget.connectionOption.http:"";
    loginController.text = (widget.connectionOption.login != null)?widget.connectionOption.login:"";
    passwordController.text = (widget.connectionOption.password != null)?widget.connectionOption.password:"";
    portController.text = (widget.connectionOption.port != null)?widget.connectionOption.port:"";
    ipController.text = (widget.connectionOption.ip != null)?widget.connectionOption.ip:"";
  }

  @override
  Widget build(BuildContext context) {
    final connectBloc = BlocProvider.of<ConnectBloc>(context);

    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
           child: Column(
            children: <Widget>[
              ClipPath(
                clipper: ClipperWidget(),
                child: Container(
                  color: Colors.brown,
                  width: double.infinity,
                  height: size.height / 4 - 10,
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
                    Text("Параметры подключения"),
                    SizedBox(
                      height: 12.0,
                    ),
                    TextFieldWidget(
                      controller: loginController,
                      onChanged: () {},
                      obscureText: false,
                      hintText: "user",
                      prefixIconData: Icons.person,
                    ),
                    TextFieldWidget(
                      controller:passwordController ,
                      onChanged: () {},
                      obscureText: true,
                      hintText: "password",
                      prefixIconData: Icons.lock,
                    ),
                    TextFieldWidget(
                      controller:ipController ,
                      onChanged: () {},
                      obscureText: false,
                      hintText: "ip",
                      prefixIconData: Icons.adjust,
                    ),
                    TextFieldWidget(
                      controller:httpController ,
                      onChanged: () {},
                      obscureText: false,
                      hintText: "http",
                      prefixIconData: Icons.http,
                    ),
                    TextFieldWidget(
                      controller:portController ,
                      onChanged: () {},
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
                    onPressed: () {
                      connectBloc.add(DemoConnectEvent());
                    },
                    child: Text("Демо"),
                    color: Colors.brown,
                  ),
                  RaisedButton(
                    onPressed: () {
                      connectBloc.add(CheckConnectEvent());
                    },
                    child: Text("Далее"),
                    color: Colors.brown,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      //],
      //),
    );
  }
}
