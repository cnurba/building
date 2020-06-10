class UnFreeFlatModel {
   String house;
   String floor;
   //number of apartment
   String number;
   //Count of flats
   String count;
   String space;
   String buyer;
   String amount;
   String agent;

   UnFreeFlatModel({
      this.house,
      this.floor,
      this.number,
      this.count,
      this.space,
      this.buyer,
      this.amount,
      this.agent});
  factory UnFreeFlatModel.FromJson(Map<String,dynamic> parsedJson){
     return UnFreeFlatModel(
       house: parsedJson["house"],
       floor: parsedJson["floor"],
       number: parsedJson["number"],
       count: parsedJson["count"],
       space: parsedJson["space"],
       buyer: parsedJson["buyer"],
       amount: parsedJson["amount"],
       agent: parsedJson["agent"],
     );
   }
}