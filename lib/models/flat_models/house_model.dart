class HouseModel {
  String house;
  String guid;
  String totalSpace;
  String livingSpace;
  String numberOfFloors;
  String numberOfApartments;

  HouseModel({this.guid, this.house,  this.totalSpace,
      this.livingSpace, this.numberOfFloors, this.numberOfApartments});

  factory HouseModel.FromJson(Map<String,dynamic> parsedJson){

    return new HouseModel(
      house: parsedJson["house"],
      totalSpace: parsedJson["totalSpace"],
      guid:parsedJson["guid"] ,
      livingSpace: parsedJson["livingSpace"],
      numberOfFloors: parsedJson["numberOfFloors"],
      numberOfApartments: parsedJson["numberOfApartments"],
    );

  }

  Map<String,dynamic> toMap(){
    return {
      "house":house,
      "totalSpace":totalSpace,
      "guid":guid,
      "livingSpace":livingSpace,
      "numberOfFloors":numberOfFloors,
      "numberOfApartments":numberOfApartments,
    };
  }


  static List<HouseModel> getDemoHouses (){
    return [
      new HouseModel(
        house: "Цезарь sity",
        guid: "0000001",
        livingSpace: "9 850 m2",
        numberOfApartments: "120",
        numberOfFloors: "12",
        totalSpace: "11 000 m2",
      ),

      new HouseModel(
        house: "Arabic квартал",
        guid: "0000002",
        livingSpace: "12 350 m2",
        numberOfApartments: "150",
        numberOfFloors: "14",
        totalSpace: "14 000 m2",
      ),
    ];
  }


}