import 'package:building/models/debt_models/debt_model.dart';
import 'package:building/util/constants.dart';
import 'package:flutter/material.dart';

class DebtPage extends StatelessWidget {
  final List<DebtModel> debtList;
  DebtPage({this.debtList});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Долги по графикам"),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(height: 2.0,color: Colors.green,),
        itemCount:debtList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ListTile(
              title: Text(debtList.elementAt(index).payer),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Дата платежа:") ,
                        Text(debtList.elementAt(index).paymentDate) ,
                      ],
                    ),
                    SizedBox(height: 8.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Сумма платежа:") ,
                        Text(debtList.elementAt(index).paymentSum) ,
                      ],
                    ),
                    SizedBox(height: 8.0,),
                    Text("${debtList.elementAt(index).comment}",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                      color: CONSTANTS.mainBtnColor3,
                    ),
                    ),
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
