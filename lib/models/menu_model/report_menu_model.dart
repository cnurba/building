class ReportMenuModel{
  String name;
  String account;
  ReportMenuModel({this.name, this.account});


  factory ReportMenuModel.FromJson(Map<String,dynamic> parsedJson){
    return ReportMenuModel(
      name: parsedJson["name"],
      account:parsedJson["account"]
    );
  }





 static List<ReportMenuModel> getDemoReportMenu(){
    return [
      ReportMenuModel(name:"Касса",account: "1100"),
      ReportMenuModel(name:"Банк",account: "1200"),
      ReportMenuModel(name:"Кратко срочные инвестиции",account: "1300"),
      ReportMenuModel(name:"Нам должны",account: "1410"),
      ReportMenuModel(name:"Долг по подотчетам",account: "1520"),
      ReportMenuModel(name:"Товары",account: "1610"),
      ReportMenuModel(name:"ГСМ",account: "1710"),
      ReportMenuModel(name:"Запасные части",account: "1720"),
      ReportMenuModel(name:"Строительные материалы",account: "1730"),
      ReportMenuModel(name:"Прочие строительные материалы, Прочие строительные материалы",account: "1740"),
      ReportMenuModel(name:"МБП",account: "1750"),
      ReportMenuModel(name:"Авансы выданные",account: "1800"),
      ReportMenuModel(name:"Мы должны",account: "3000"),
      ReportMenuModel(name:"Авансы полученные",account: "3200"),
      ReportMenuModel(name:"Краткосрочные банковские займы",account: "3300"),
      ReportMenuModel(name:"Налоги к оплате",account: "3400"),
      ReportMenuModel(name:"Долги по ЗП",account: "3520"),
      ReportMenuModel(name:"Долги по СФ",account: "3530"),
      ReportMenuModel(name:"Дивиденты",account: "3540"),

    ];
  }

}