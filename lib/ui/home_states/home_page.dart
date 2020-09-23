import 'package:building/blocs/flat_bloc/flat_bloc.dart';
import 'package:building/blocs/flat_bloc/flat_event.dart';
import 'package:building/models/flat_models/house_model.dart';
import 'package:building/ui/home_states/flat_page.dart';
import 'package:building/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final List<HouseModel> mainData;
  final bool demo;
  HomePage({this.mainData, this.demo});
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Список домов"),
       ),
       body: ListView.builder(
            itemCount: mainData.length,
            itemBuilder:(context, index) {
              return   Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    width: 2.0,
                    color: CONSTANTS.mainBackgroundColor,
                  ),
                ),
                margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                   Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child:  Text("${mainData[index].house}",style: TextStyle(
                          fontSize: 18.0,
                          color: CONSTANTS.mainBtnColor3,
                          fontWeight: FontWeight.w500
                      ),),
                    ),
                    Divider(color: Colors.green,height: 2.0,),
                    getDetailDates("Общая площадь", " ${mainData[index].totalSpace}"),
                    getDetailDates("Жилая площадь", " ${mainData[index].livingSpace}"),
                    getDetailDates("Количество этажей", " ${mainData[index].numberOfFloors}"),
                    getDetailDates("Количество квартир", " ${mainData[index].numberOfApartments}"),

                    Divider(color: Colors.green.shade900,height: 10.0,),

                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                            width: double.infinity-150,
                            child: FlatButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              padding: EdgeInsets.all(8.0),
                              splashColor: Colors.blueAccent,
                              onPressed: () {
                                BlocProvider.of<FlatBloc>(context).add(FreeFlatEvent(demo:demo ,houseModel: mainData[index]));
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => FlatPage(),
                                ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                                child: Text(
                                  "Свободные",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                            width: double.infinity-150,
                            child: FlatButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              padding: EdgeInsets.all(8.0),
                              splashColor: Colors.blueAccent,
                              onPressed: () {
                                BlocProvider.of<FlatBloc>(context).add(BookedFlatEvent(demo:demo ,houseModel: mainData[index]));
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => FlatPage(),
                                ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                                child: Text(
                                  "Забронированные",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                            width: double.infinity-150,
                            child: FlatButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              padding: EdgeInsets.all(8.0),
                              splashColor: Colors.blueAccent,
                              onPressed: () {
                                 BlocProvider.of<FlatBloc>(context).add(UnFreeFlatEvent(demo:demo ,houseModel: mainData[index]));
                                 Navigator.of(context).push(MaterialPageRoute(
                                   builder: (context) => FlatPage(),
                                 ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                                child: Text(
                                  "Проданные",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
           },
       ),
     );
  }

  Widget getDetailDates(String name, String value){
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("$name",style: TextStyle(
              fontSize: 16.0,
              color: CONSTANTS.mainBackgroundColor,
              fontWeight: FontWeight.w500
          ),),
          SizedBox(width: 5.0,),
          Text("$value",style: TextStyle(
              fontSize: 16.0,
              color:CONSTANTS.mainBackgroundColor,
              fontWeight: FontWeight.bold
          ),),
        ],
      ),
    );
  }


}
