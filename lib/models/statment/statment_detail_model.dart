class StatmentDetailModel{

  String account;
  String organization;
  String subconto;
  String amount ;
  String currencyAmount;
  String comment;

  StatmentDetailModel({this.account, this.organization, this.subconto, this.amount,
      this.currencyAmount, this.comment});


  factory StatmentDetailModel.FromJon (Map<String,dynamic> parsedJson){

    return new StatmentDetailModel(
      organization: parsedJson["organization"],
      account: parsedJson["account"],
      subconto: parsedJson["subconto"],
      amount: parsedJson["amount"],
      currencyAmount: parsedJson["currencyAmount"],
      comment: parsedJson["comment"],
    );
  }
}