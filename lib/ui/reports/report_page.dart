import 'package:building/ui/reports/report_drawer_state.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  final bool demo;
  ReportPage({this.demo});

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
     super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:ReportDrawerState(demo: widget.demo,),
      body: Container(),
    );
  }
}
