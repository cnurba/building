class StatmentModel {
  String name;
  String organization;
  String id;
  String amount;
  String flag;
  String comment;

  StatmentModel({this.name, this.organization, this.id, this.amount, this.flag,
      this.comment});

  factory StatmentModel.fromJson(Map<String, dynamic> parsedJson) {
    return StatmentModel(
        name: parsedJson["name"],
        amount: parsedJson['amount'],
        comment: parsedJson['comment'],
        flag: parsedJson['flag'],
        id: parsedJson['id'],
        organization: parsedJson['organization']);
  }

  Map<String, dynamic> toJson() =>
   {
        'flag': flag,
        'id': id,
   };
}
