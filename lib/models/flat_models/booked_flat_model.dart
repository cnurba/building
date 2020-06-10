

class BookedFlatModel {
  String house;
  String floor;
  String apartment;
  //number of apartment
  String number;
  //Count of flats
  String count;
  String space;
  String status;
  String buyer;
  String currency;
  String amount;
  String agent;
  String bookedTo;

  BookedFlatModel({
    this.house,
    this.floor,
    this.apartment,
    this.number,
    this.count,
    this.space,
    this.status,
    this.buyer,
    this.currency,
    this.amount,
    this.agent,this.bookedTo});

  factory BookedFlatModel.FromJson(Map<String,dynamic> parsedJson){

    return BookedFlatModel(
      house: parsedJson["house"],
      floor: parsedJson["floor"],
      apartment: parsedJson["apartment"],
      number: parsedJson["number"],
      count: parsedJson["count"],
      space: parsedJson["space"],
      status: parsedJson["status"],
      buyer: parsedJson["buyer"],
      currency: parsedJson["currency"],
      amount: parsedJson["amount"],
      agent: parsedJson["agent"],
      bookedTo: parsedJson["bookedTo"],

    );
  }


}