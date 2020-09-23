import 'package:building/blocs/connection/connect_bloc.dart';
import 'package:building/blocs/connection/connect_event.dart';
import 'package:building/blocs/connection/connect_state.dart';
import 'package:building/models/user/connection_option.dart';
import 'package:building/models/user/user.dart';
import 'package:building/servises/preferense_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../main_menu.dart';

class LoginPage extends StatefulWidget {
  final ConnectionOption connectionOption;
  final User user;
  const LoginPage({Key key, this.connectionOption, this.user}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Future showDelayedSnakeBar(context, String message, bool error) async {
    await Future.delayed(Duration(seconds: 1));
    Scaffold.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text(message),
      backgroundColor: (error) ? Colors.red : Colors.greenAccent,
      duration: Duration(seconds: 10),),
    );
 }

 @override
  void initState() {
    super.initState();
    userController.text = (widget.user!=null)?widget.user.name:"";
    passwordController.text = (widget.user!=null)?widget.user.password:"";

 }
 @override
  void dispose() {
    super.dispose();
    userController.dispose();
    passwordController.dispose();
  }

 @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectBloc,ConnectState>(
      listener: (context, state) {
        if (state is UserCheckedState) {
          showDelayedSnakeBar(context, state.textScaffold, true);
        } else if (state is ConnectAuthenticated) {
          showDelayedSnakeBar(context, "Успешное соединение", false);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MainMenuPage(demo: false,user: state.user,connectionOption: state.connectionOption,),
          ));
        }
      },

      child: BlocBuilder<ConnectBloc,ConnectState>(
        builder: (context, state) =>
        Form(
          child: Column(
            children: <Widget>[
               Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextFormField(
                      controller: userController,
                      keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                        hintText: "Логин",
                        prefixIcon:Icon(Icons.person,size: 18.0,),
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
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
                onPressed: () {
                  BlocProvider.of<ConnectBloc>(context).add(LoggedInEvent(
                      connectionOption:widget.connectionOption,user: new User(
                      name: userController.text,password: passwordController.text)
                  ),
                  );
                 },
                child: Text("Регистрация"),
                color: Colors.brown,

                )
            ],
          ),
        ),
      ),
    );
  }
}
