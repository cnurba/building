class FreeFlatModel{
  String house;
  String floor;
  //number of apartment
  String number;
  //Count of flats
  String count;
  String space;


  FreeFlatModel({this.house, this.floor,
    this.number, this.count, this.space});


  factory FreeFlatModel.FromJson(Map<String,dynamic> parsedJson){

    return FreeFlatModel(
      house: parsedJson["house"],
      floor: parsedJson["floor"],
      number: parsedJson["number"],
      count: parsedJson["count"],
      space: parsedJson["space"],

    );
  }
}