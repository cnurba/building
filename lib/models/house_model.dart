class HouseModel {
  String organization;
  String house;
  String id;
  String totalSpace;
  String livingSpace;
  String numberOfFloors;
  String numberOfApartments;

  HouseModel({this.id, this.organization, this.house,  this.totalSpace,
      this.livingSpace, this.numberOfFloors, this.numberOfApartments});

  factory HouseModel.FromJson(Map<String,dynamic> parsedJson){

    return new HouseModel(
      organization: parsedJson["organization"],
      house: parsedJson["house"],
      totalSpace: parsedJson["totalSpace"],
      id:parsedJson["id"] ,
      livingSpace: parsedJson["livingSpace"],
      numberOfFloors: parsedJson["numberOfFloors"],
      numberOfApartments: parsedJson["numberOfApartments"],
    );

  }
  Map<String, dynamic> toJsonFreeFlats() =>
      {
        'status': "free",
        'id': id,
      };
  Map<String, dynamic> toJsonUnFreeFlats() =>
      {
        'status': "unfree",
        'id': id,
      };
  Map<String, dynamic> toJsonBookedFlats() =>
      {
        'status': "booked",
        'id': id,
      };
}