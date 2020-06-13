import 'package:building/blocs/connection/connect_bloc.dart';
import 'package:building/ui/start_page.dart';
import 'package:building/util/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<ConnectBloc>(create: (context) => ConnectBloc(),),
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home:StartPage(),
     );
  }
}
