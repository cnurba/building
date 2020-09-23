import 'package:building/blocs/slider_report/slider_bloc.dart';
import 'package:building/blocs/slider_report/slider_event.dart';
import 'package:building/blocs/slider_report/slider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportDrawerState extends StatefulWidget {
  final bool demo;
   ReportDrawerState({this.demo});
  @override
  _ReportDrawerStateState createState() => _ReportDrawerStateState();
}

class _ReportDrawerStateState extends State<ReportDrawerState> {

  SliderBloc sliderBloc;
  @override
  void initState() {
    super.initState();
    sliderBloc.add(OpenSideBarEvent());
    print("Drawer open");
  }

  @override
  void dispose() {
    super.dispose();
    print("Drawer close");
  }

  @override
  Widget build(BuildContext context) {
   
    return  BlocBuilder<SliderBloc,SliderState>(
      builder: (context, state) {
        if(state is SliderOpeningState){
          final reportMenu = state.listReportMenu;
          return Drawer(
            child: Expanded(
               child: ListView.separated(
                  itemCount: reportMenu.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Flexible(child: Text("${reportMenu[index].name}")),
                      trailing: Icon(Icons.chevron_right),
                      onTap: (){
                        BlocProvider.of<SliderBloc>(context).add(CloseSideBarEvent(demo: widget.demo));
//                      Navigator.pop(context);
//                      print("POP");
//                      debugPrint("Print debyg");
                      },
                    );
                  },
                  separatorBuilder:(_,index)=> Divider(color: Colors.green,height: 2.0,)
              ),
            ),

          );
        }else {
          return CircularProgressIndicator();
        }

      },


    );
  }
}
