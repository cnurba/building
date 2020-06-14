import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      drawer: Drawer(
          child: ListView.separated(
              itemCount: 20,
              itemBuilder: (context, i){
                return ListTile(
                  title: Text("Отчеты  $i"),
                  trailing: Icon(Icons.chevron_right),
                  onTap: (){
                    Navigator.pop(context);
                  },
                );
              },
              separatorBuilder:(_,index)=> Divider(color: Colors.green,height: 2.0,)
          ),
      ),
      body: Container(
     ),
    );
  }
}
