import 'package:building/models/flat_models/flat_model.dart';

abstract class FlatState{}

class LoadingFlatState extends FlatState{}
class UnInitializedFlatState extends FlatState{}

class InitializedFreeFlatState extends FlatState{
  final List<FlatModel> flatList;
  InitializedFreeFlatState({this.flatList});
}

class InitializedUnFreeFlatState extends FlatState{
  final List<FlatModel> flatList;
  InitializedUnFreeFlatState({this.flatList});
}

class InitializedBookedFlatState extends FlatState{
  final List<FlatModel> flatList;
  InitializedBookedFlatState({this.flatList});
}