import 'package:building/blocs/menu/menu_bloc.dart';
import 'package:building/blocs/menu/menu_state.dart';
import 'package:building/blocs/report_menu_bloc/report_menu_bloc.dart';
import 'package:building/blocs/report_menu_bloc/report_menu_event.dart';
import 'package:building/blocs/slider_report/slider_bloc.dart';
import 'package:building/blocs/slider_report/slider_event.dart';
import 'package:building/ui/home_states/home_page.dart';
import 'package:building/ui/registration/main_reg_page.dart';
import 'package:building/ui/sidebar/sidebar_layout.dart';
import 'package:building/ui/sync/sync_page.dart';
import 'package:building/ui/tasks/tasks_page.dart';
import 'package:building/ui/users_state/users_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'debt_states/debt_page.dart';

class MainMenuHelper extends StatelessWidget {
  final bool demo;
  MainMenuHelper({this.demo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MenuBloc,MenuState>(
          builder: (context, state) {
            if (state is ReportState) {
              BlocProvider.of<SliderBloc>(context).add(CloseSideBarEvent(demo: true,isSideBarOpened: false));
              BlocProvider.of<ReportMenuBloc>(context).add(FirstOpenReportMenu(demo:demo));
              return SideBarLayout(demo: demo,); //this is reportPage
             }else if(state is HomeState){
              return HomePage(mainData: state.houseList,demo: demo,);
              }else if (state is DebtState){
               return DebtPage(debtList: state.debtList,);
            }else if (state is ConnectState){
              return MainRegPage(initialIndex: 0,connectionOption: state.connectionOption,user: state.user,);
            }else if (state is UsersState){
              return UsersPage(usersList: state.userList,);
            } else if (state is TaskState){
              return TasksPage(taskList: state.taskList);
            } else if (state is SyncState){
              return SyncPage();
             }
            else{
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  title: Text("Идет чтение данных"),
                ),
                body: Center(child: CircularProgressIndicator()));
            }
          }
      ),

    );
  }
}
