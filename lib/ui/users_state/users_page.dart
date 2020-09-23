import 'package:building/models/users_model/users_model.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  final List<UsersModel>usersList;
  UsersPage({this.usersList});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Пользователи"),
      ),
      body:ListView.separated(
          itemCount: usersList.length,
          separatorBuilder: (context, index) => Divider(height: 3.0,color: Colors.green,),
          itemBuilder: (context,index){
            return ListTile(
              leading: Icon(Icons.person),
              title:Text("${usersList[index].name}"),
            );
           } ,
       ) ,
    );
  }
}
