import 'package:building/blocs/flat_bloc/flat_event.dart';
import 'package:building/blocs/flat_bloc/flat_state.dart';
import 'package:building/models/flat_models/flat_model.dart';
import 'package:building/servises/db_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlatBloc extends Bloc<FlatEvent,FlatState>{
  @override

  FlatState get initialState => LoadingFlatState();

  @override
  Stream<FlatState> mapEventToState(FlatEvent event) async*{
    List<FlatModel> flatList;

    if(event.demo){
      if(event is FreeFlatEvent){
        flatList = await FlatModel.getDemoFlat(status: "free",houseGuid: event.houseModel.guid);
      }else if(event is UnFreeFlatEvent){
        flatList = await FlatModel.getDemoFlat(status: "unfree",houseGuid: event.houseModel.guid);
      }else{
        flatList = await FlatModel.getDemoFlat(status: "booked",houseGuid: event.houseModel.guid);
      }

    }else{
      if(event is FreeFlatEvent){
        flatList = await DBProvider.db.getFlats("free",event.houseModel.guid);
      }else if(event is UnFreeFlatEvent){
        flatList = await DBProvider.db.getFlats("unfree",event.houseModel.guid);
      }else{
        flatList = await DBProvider.db.getFlats("booked",event.houseModel.guid);
       }

    }

    if(event is FreeFlatEvent){
      yield InitializedFreeFlatState(flatList:flatList);
    }else if (event is UnFreeFlatEvent){
      yield InitializedUnFreeFlatState(flatList:flatList);
    }else if (event is BookedFlatEvent){
      yield InitializedBookedFlatState(flatList:flatList);
    }else{
      yield UnInitializedFlatState();
    }
  }
}