import 'package:building/ui/sidebar/report_detail_page.dart';
import 'package:building/ui/sidebar/sidebar.dart';
import 'package:flutter/material.dart';

class SideBarLayout extends StatelessWidget {
  final bool demo;
  SideBarLayout({this.demo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ReportDetailPage(),
          SideBar(demo: demo,),
        ],
      ),
    );
  }
}
