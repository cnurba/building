import 'package:building/models/menu_model/report_menu_model.dart';

abstract class SliderState{}

class SliderOpeningState extends SliderState{
  final List<ReportMenuModel> listReportMenu;
  SliderOpeningState({this.listReportMenu});
}

class SliderClosingState extends SliderState{
  final List<ReportMenuModel> listReportMenu;
  SliderClosingState({this.listReportMenu});
}

class SliderLoadingState extends SliderState{}


class SliderUnInitializeState extends SliderState{}
