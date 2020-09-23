import 'dart:convert';

import 'package:flutter/services.dart';

class ReportDetailModel{
  String keyAccount;
  String account;
  String subconto;
  String amount ;
  String currencyAmount;
  String comment;

  ReportDetailModel({this.keyAccount, this.account,this.subconto, this.amount,
      this.currencyAmount, this.comment});

  factory ReportDetailModel.fromJson (Map<String,dynamic> parsedJson){
    return new ReportDetailModel(
      keyAccount: parsedJson["keyAccount"],
      account: parsedJson["account"],
      subconto: parsedJson["subconto"],
      amount: parsedJson["amount"],
      currencyAmount: parsedJson["currencyAmount"],
      comment: parsedJson["comment"],
    );
  }

  Map<String,dynamic> toMap(){
    return {
      "keyAccount":keyAccount,
      "account":account,
      "subconto":subconto,
      "amount":amount,
      "currencyAmount":currencyAmount,
      "comment":comment,
    };
  }


  static Future<String> _loadJsonAssets () async {
    return rootBundle.loadString("assets/demo/reportdata.json");
  }

  static Future<List<ReportDetailModel>> getReportDetailDemoData({String key}) async{
    String jsonString = await _loadJsonAssets();
    final jsonResponse = await json.decode(jsonString);
    final List<ReportDetailModel> datesInList = [];
     final List<ReportDetailModel> detailModels = [];

    for (var item in jsonResponse) {
      var reportDetailModel = ReportDetailModel.fromJson(item);
      datesInList.add(reportDetailModel);
     }
    for (var item in datesInList ) {
      if(item.keyAccount == key || item.account==key){
        detailModels.add(item);
      }
     }
     return detailModels;
  }
}
