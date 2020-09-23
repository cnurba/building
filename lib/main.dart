import 'package:building/blocs/connection/connect_bloc.dart';
import 'package:building/blocs/connection/connect_event.dart';
import 'package:building/blocs/connection/connect_state.dart';
import 'package:building/blocs/flat_bloc/flat_bloc.dart';
import 'package:building/blocs/menu/menu_bloc.dart';
import 'package:building/blocs/report_menu_bloc/report_menu_bloc.dart';
import 'package:building/blocs/slider_report/slider_bloc.dart';
import 'package:building/servises/db_provider.dart';
import 'package:building/ui/main_menu.dart';
import 'package:building/ui/main_menu_helper.dart';
import 'package:building/ui/start_page.dart';
import 'package:building/util/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<ConnectBloc>(create: (context) => ConnectBloc()..add(AppStartedEvent()),),
        BlocProvider<MenuBloc>(create: (context) => MenuBloc(),),
        BlocProvider<SliderBloc>(create: (context) => SliderBloc(),),
        BlocProvider<ReportMenuBloc>(create: (context) => ReportMenuBloc(),),
        BlocProvider<FlatBloc>(create: (context) => FlatBloc(),),
      ],
      child: MyApp()));

  DBProvider.db.initDB();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home:BlocBuilder<ConnectBloc,ConnectState>(
          builder: (context, state) {
            if(state is ConnectAuthenticated){
              return MainMenuPage(demo: false,connectionOption: state.connectionOption,user: state.user,);
            }else if (state is ConnectUnauthenticated){
              return StartPage();
            }else {
              return CircularProgressIndicator();
            }
          },
      )
     );
  }
}
