import 'dart:convert';

import 'package:flutter/services.dart';

class FlatModel {
  String guid;
  String houseGuid;
  String house;
  String floor;
  String status;
  //number of apartment
  String number;
  //Count of flats
  String count;
  String space;
  String buyer;
  String amount;
  String agent;
  String comment;

  FlatModel(
      {this.guid,
      this.status,
      this.houseGuid,
      this.house,
      this.floor,
      this.number,
      this.count,
      this.space,
      this.buyer,
      this.amount,
      this.comment,
      this.agent});

  Map<String,dynamic> toMap(){

    return {
      "guid":guid,
      "houseGuid":houseGuid,
      "status":status,
      "house":house,
      "floor":floor,
      "number":number,
      "count":count,
      "space":space,
      "buyer":buyer,
      "amount":amount,
      "agent":agent,
      "comment":comment,

    };

  }




  factory FlatModel.FromJson(Map<String, dynamic> parsedJson) {
    return FlatModel(
      guid: parsedJson["guid"],
      houseGuid: parsedJson["houseGuid"],
      status: parsedJson["status"],
      house: parsedJson["house"],
      floor: parsedJson["floor"],
      number: parsedJson["number"],
      count: parsedJson["count"],
      space: parsedJson["space"],
      buyer: parsedJson["buyer"],
      amount: parsedJson["amount"],
      agent: parsedJson["agent"],
      comment: parsedJson["comment"],
    );
  }

  static Future<String> _loadJsonFromAssets() async {
    return rootBundle.loadString("assets/demo/flats.json");
  }

  static Future<List<FlatModel>> getDemoFlat({String status, houseGuid}) async {
    String jsonString = await _loadJsonFromAssets();
    final jsonResponse = json.decode(jsonString);
    List<FlatModel> listFlats = [];
    for (var item in jsonResponse) {
      var flat = FlatModel.FromJson(item);
      if (flat.status == status && flat.houseGuid == houseGuid) {
        listFlats.add(flat);
      }
    }
    return listFlats;
  }
}
