import 'package:building/models/report_model/report_detail_model.dart';

abstract class ReportMenuState{}

class LoadingReportState extends ReportMenuState{}

class UninitializedReportState extends ReportMenuState{}

class InitializedReportState extends ReportMenuState{
  List<ReportDetailModel> reportDetailList;
  InitializedReportState({this.reportDetailList});
}