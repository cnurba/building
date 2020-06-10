class CashModel{

  String account;
  String organization;
  String subconto;
  String amount ;
  String currencyAmount;
  String comment;

  CashModel({this.account, this.organization, this.subconto, this.amount,
      this.currencyAmount, this.comment});


  factory CashModel.FromJon (Map<String,dynamic> parsedJson){

    return new CashModel(
      organization: parsedJson["organization"],
      account: parsedJson["account"],
      subconto: parsedJson["subconto"],
      amount: parsedJson["amount"],
      currencyAmount: parsedJson["currencyAmount"],
      comment: parsedJson["comment"],

    );

  }



}