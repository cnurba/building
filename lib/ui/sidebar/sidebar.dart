import 'package:building/blocs/report_menu_bloc/report_menu_bloc.dart';
import 'package:building/blocs/report_menu_bloc/report_menu_event.dart';
import 'package:building/blocs/slider_report/slider_bloc.dart';
import 'package:building/blocs/slider_report/slider_event.dart';
import 'package:building/blocs/slider_report/slider_state.dart';
import 'package:building/models/menu_model/report_menu_model.dart';
import 'package:building/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'clip_menu.dart';

class SideBar extends StatefulWidget {
  final bool demo;
  SideBar({this.demo});
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  final _animationDuration = const Duration(milliseconds: 500);
  AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: _animationDuration);
  }
  @override
  void dispose() {
     super.dispose();
     _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sliderBloc = BlocProvider.of<SliderBloc>(context);
    final screenSize = MediaQuery.of(context).size;
    return BlocBuilder<SliderBloc,SliderState>(
      builder: (context, state){
        if(state is SliderOpeningState){
         return buildSideBar(isSideBarOpened: true,
             bloc:sliderBloc,screenSize:screenSize,
             menu:state.listReportMenu,demo: widget.demo);
        }else {
          return buildSideBar(isSideBarOpened: false,
              bloc: sliderBloc,
              screenSize: screenSize,
              menu: [],
              demo: widget.demo);
        }
      } ,
    );
  }

 Widget buildSideBar({List<ReportMenuModel> menu,SliderBloc bloc, Size screenSize,bool isSideBarOpened,bool demo}){
    return AnimatedPositioned(
      duration: _animationDuration,
      top: 0,
      bottom: 0,
      left:isSideBarOpened?0 :0 ,
      right:isSideBarOpened?0 :screenSize.width-55 ,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: CONSTANTS.mainBackgroundColor,
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: menu.length,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        bloc.add(CloseSideBarEvent(demo:demo,isSideBarOpened: !isSideBarOpened));
                        BlocProvider.of<ReportMenuBloc>(context).add(ClickedReportMenu(demo: widget.demo,reportMenu: menu[index]));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height:screenSize.height*0.1 ,
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                               Flexible(child: Text(" ${menu[index].name}",
                                 style:TextStyle(color: Colors.white) ,)),
                               Icon(Icons.chevron_right,color: Colors.white,),

                          ],
                        ),

                      ),
                    );
                  },
                  separatorBuilder:(_,index)=> Divider(color: Colors.white,height: 2.0,)
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.9),
            child: GestureDetector(
              onTap: (){
                if(isSideBarOpened) {
                  bloc.add(CloseSideBarEvent(demo:demo,isSideBarOpened: !isSideBarOpened));
                } else {
                  bloc.add(OpenSideBarEvent(isSideBarOpened: !isSideBarOpened,demo: demo));
                }
              },
              child: ClipPath(
                clipper: CustomMenuClipper(),
                child: Container(
                    width: 35,
                    height: 110,
                    color: CONSTANTS.mainBackgroundColor,
                    alignment: Alignment.centerLeft,
                    child: isSideBarOpened? Icon(Icons.fast_rewind,color: Colors.white,size: 25,):Icon(Icons.fast_forward,color: Colors.white,size: 25,)
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
