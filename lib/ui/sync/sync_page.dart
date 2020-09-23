import 'package:building/blocs/menu/menu_bloc.dart';
import 'package:building/blocs/menu/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SyncPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Результаты обмена"),
      ),

      //TODO нужно через блок листенер , можем добавить event пока так думаю
      body: BlocBuilder<MenuBloc,MenuState>(
        builder: (context, state) {
          if(state is SyncState){
            return ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: state.syncResult.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${state.syncResult[index]}"),
                  );
                },

                );
          }else {

            final snackBar = SnackBar(
              backgroundColor: Colors.red,
              duration: Duration(seconds: 5),
              content: Text("Не предвиденная ошибка",
                style: TextStyle(
                color: Colors.white,
            ),
              ),
            );
            Scaffold.of(context).showSnackBar(snackBar);
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
    );
  }
}
