
import 'package:building/util/constants.dart';
import 'package:flutter/material.dart';

class ReportDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CONSTANTS.appbarBackgroundColor,
      ),

      body: ListView.builder(
          itemCount: 10,
          itemBuilder:(context, index){
            return ListTile(

                title:Text("Организация",style: TextStyle(
                  color: CONSTANTS.appbarBackgroundColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                ),),
                subtitle:Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 12.0,),
                    Text("Касса",style: TextStyle(
                      letterSpacing:1.5,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: CONSTANTS.appbarBackgroundColor,
                    ),
                    ),

                    SizedBox(height: 12.0,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[

                        Text("7500 usd",style: TextStyle(
                          letterSpacing:1.5,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,

                        ),
                        ),

                        Text("10000 cом",style: TextStyle(
                          letterSpacing:1.5,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.0,),
                    Flexible(
                      child: Text("Комментари",style: TextStyle(
                        letterSpacing:1.5,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: CONSTANTS.appbarBackgroundColor,
                      ),
                      ),
                    ),
                    SizedBox(height: 12.0,),
                    Divider(height: 3.0,color: Colors.green,thickness: 2.0,),
                  ],
                )
            );
          }
          ),

    );
  }
}
