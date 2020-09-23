import 'package:building/models/flat_models/house_model.dart';

abstract class FlatEvent{
  final bool demo;
  final HouseModel houseModel;

  FlatEvent({this.houseModel, this.demo});
}

class FreeFlatEvent extends FlatEvent{
  final bool demo;
  final HouseModel houseModel;

  FreeFlatEvent({this.demo, this.houseModel});
}
class UnFreeFlatEvent extends FlatEvent{
  final bool demo;
  final HouseModel houseModel;

  UnFreeFlatEvent({this.demo, this.houseModel});
}
class BookedFlatEvent extends FlatEvent{
  final bool demo;
  final HouseModel houseModel;

  BookedFlatEvent({this.demo, this.houseModel});
}
