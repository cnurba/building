import 'package:building/blocs/slider_report/slider_event.dart';
import 'package:building/blocs/slider_report/slider_state.dart';
import 'package:building/models/menu_model/report_menu_model.dart';
import 'package:building/servises/db_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderBloc extends Bloc<SideBarEvent,SliderState>{
  @override
  SliderState get initialState => SliderLoadingState();
  @override
  Stream<SliderState> mapEventToState(SideBarEvent event) async* {
   if(event is OpenSideBarEvent){
     if(event.demo){
       final listReportMenu = ReportMenuModel.getDemoReportMenu();
       yield SliderOpeningState(listReportMenu: listReportMenu);
     }else{
       final listReportMenu = await DBProvider.db.getListReportMenu();
       yield SliderOpeningState(listReportMenu: listReportMenu);
     }
   }else if(event is CloseSideBarEvent){
     yield SliderClosingState(listReportMenu: []);
   }else {
     yield SliderLoadingState();
   }
  }
}