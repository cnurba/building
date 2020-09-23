import 'package:building/models/flat_models/flat_model.dart';
import 'package:flutter/material.dart';

class BookedFlatsPage extends StatelessWidget {
  final List<FlatModel> flatList;
  BookedFlatsPage({this.flatList});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Забронированные квартиры"),
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) => Divider(height: 2.0,color: Colors.green,),
          itemCount:flatList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: ListTile(
                title: Text(flatList.elementAt(index).house),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0,left: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(flatList.elementAt(index).number) ,
                          Text(flatList.elementAt(index).floor) ,
                        ],
                      ),
                        SizedBox(height: 8.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(flatList.elementAt(index).count) ,
                          Text(flatList.elementAt(index).space) ,
                        ],
                      ),
                        SizedBox(height: 8.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Покупатель") ,
                            Text(flatList.elementAt(index).buyer) ,
                          ],
                        ),
                        SizedBox(height: 8.0,),
                      //Text("${flatList.elementAt(index).comment}"),
                    ],
                  ),
                ),
              ),
            );
          },

       ),
    );
  }
}
