import 'package:flutter/foundation.dart';

class ConnectionOption {
  String login;
  String password;
  String ip;
  String http;
  String port;


  ConnectionOption({this.login, this.password, this.ip, this.http, this.port});

  factory ConnectionOption.fromJson(){
    return null;
  }

//  factory CashModel.FromJon (Map<String,dynamic> parsedJson){
//
//    return new CashModel(
//      organization: parsedJson["organization"],
//      account: parsedJson["account"],
//      subconto: parsedJson["subconto"],
//      amount: parsedJson["amount"],
//      currencyAmount: parsedJson["currencyAmount"],
//      comment: parsedJson["comment"],
//
//    );

  }


}

