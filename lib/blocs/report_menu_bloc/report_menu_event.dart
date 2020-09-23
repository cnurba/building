import 'package:building/models/menu_model/report_menu_model.dart';

abstract class ReportMenuEvent{}

class ClickedReportMenu extends ReportMenuEvent{
  final ReportMenuModel reportMenu;
  final bool demo;
  ClickedReportMenu({this.reportMenu, this.demo});
}

class FirstOpenReportMenu extends ReportMenuEvent{
   final bool demo;
  FirstOpenReportMenu({this.demo});
}