import 'dart:convert';
import 'package:flutter/services.dart';

class DebtModel {
  String paymentDate;
  String paymentSum;
  String payer;
  String comment;

  DebtModel({this.paymentDate, this.paymentSum, this.payer, this.comment});

  factory DebtModel.fromJson(Map<String, dynamic> parsedJson) {
    return new DebtModel(
      comment: parsedJson['comment'],
      paymentDate: parsedJson['paymentDate'],
      paymentSum: parsedJson['paymentSum'],
      payer: parsedJson['payer'],
    );
  }

  Map<String,dynamic>toMap(){
    return {
      "comment":comment,
      "paymentDate":paymentDate,
      "paymentSum":paymentSum,
      "payer":payer,
  };
}

  static Future<String> _loadJsonFromAssets() async {
    return await rootBundle.loadString("assets/demo/debt.json");
  }

  static Future<List<DebtModel>> getDemoDebt() async {
    String jsonString = await _loadJsonFromAssets();
    final parsedJson = await json.decode(jsonString);
    List<DebtModel> listDebt = [];
    for (var item in parsedJson) {
      var debt = DebtModel.fromJson(item);
      listDebt.add(debt);
    }
    return listDebt;
  }
}
