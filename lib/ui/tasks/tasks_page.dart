import 'package:building/models/tasks_model/task.dart';
import 'package:flutter/material.dart';

class TasksPage extends StatelessWidget {
  List<Task> taskList;
  TasksPage({this.taskList});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Мои задачи"),
      ),
      body: ListView.separated(
          itemCount: taskList.length,
          separatorBuilder:(context, index) =>  Divider(height: 3.0,color: Colors.green, thickness: 2.0,),

         itemBuilder:(context, index) {
           return ListTile(
           title: Text("${taskList[index].title}"),
           subtitle: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               SizedBox(height: 5.0,),
               Text("${taskList[index].description}"),
               SizedBox(height: 5.0,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   Text("Срок до: "),
                   Text("${taskList[index].dueDate}"),
                 ],
               )
             ],
           ),
          );
         },
    ));
  }
}
