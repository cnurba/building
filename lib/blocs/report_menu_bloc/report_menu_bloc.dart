import 'package:building/blocs/report_menu_bloc/report_menu_event.dart';
import 'package:building/blocs/report_menu_bloc/report_menu_state.dart';
import 'package:building/models/report_model/report_detail_model.dart';
import 'package:building/servises/db_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportMenuBloc extends Bloc<ReportMenuEvent,ReportMenuState> {
  @override
  ReportMenuState get initialState => LoadingReportState();

  @override
  Stream<ReportMenuState> mapEventToState(ReportMenuEvent event) async* {
     if(event is ClickedReportMenu){
       if(!event.demo){
         final List<ReportDetailModel> reportDetailList = await DBProvider.db.getReportDetailModels(event.reportMenu.account);
         yield InitializedReportState(reportDetailList: reportDetailList);

       }else{
         final List<ReportDetailModel> reportDetailList = await ReportDetailModel.getReportDetailDemoData(key:event.reportMenu.account);
         yield InitializedReportState(reportDetailList: reportDetailList);
       }

     }else if(event is FirstOpenReportMenu){
       if(!event.demo){
         yield LoadingReportState();
       }else{
         final List<ReportDetailModel> reportDetailList = await ReportDetailModel.getReportDetailDemoData(key:"1100");
         yield InitializedReportState(reportDetailList: reportDetailList);
       }

     } else {
       yield LoadingReportState();
     }
  }

}