import 'package:building/models/debt_models/debt_model.dart';
import 'package:building/models/flat_models/flat_model.dart';
import 'package:building/models/flat_models/house_model.dart';
import 'package:building/models/menu_model/report_menu_model.dart';
import 'package:building/models/report_model/report_detail_model.dart';
import 'package:building/models/tasks_model/task.dart';
import 'package:building/models/users_model/users_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';

class DBProvider{
  DBProvider._();

  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async{
    if(_database!=null)
      return _database;
      _database= await initDB();
    return _database;
  }

  initDB() async {
    Directory documentDirectory= await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "base.db");
    return await openDatabase(path,version: 1, onOpen: (db){},
    onCreate: _createBase);
}

  void _createBase (Database db, int version) async {
    await db.execute('''
        CREATE TABLE mainMenu(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL
        )
        ''');
    await db.execute('''
        Create table reportMenu(
        id integer primary key autoincrement,
        name TEXT not null,
        account TEXT not null
        )
        ''');
    await db.execute('''
        Create table debt(
        id integer primary key autoincrement,
        paymentDate TEXT not null,
        paymentSum TEXT not null,
        payer TEXT not null,
        comment TEXT not null
        )
        ''');
    await db.execute('''
        Create table house(
        id integer primary key autoincrement,
        house TEXT not null,
        guid TEXT not null,
        totalSpace TEXT not null,
        livingSpace TEXT not null,
        numberOfFloors TEXT not null,
        numberOfApartments TEXT not null
        )
        ''');
    await db.execute('''
        Create table flat(
        id integer primary key autoincrement,
        guid TEXT not null,
        houseGuid TEXT not null,
        house TEXT not null,
        floor TEXT not null,
        status TEXT not null,
        number TEXT not null,
        count TEXT not null,
        space TEXT not null,
        buyer TEXT not null,
        amount TEXT not null,
        agent TEXT,
        comment TEXT 
        )
        ''');
    await db.execute('''
        Create table reportDetailMenu(
        id integer primary key autoincrement,
        keyAccount TEXT not null,
        account TEXT not null,
        subconto TEXT not null,
        amount TEXT not null,
        currencyAmount TEXT not null,
        comment TEXT
        )
        ''');
    await db.execute('''
    Create table tasks(
            id integer primary key autoincrement,
                    completed BIT,
        title TEXT not null,
        description TEXT,
        dueDate
        )
        ''');
    await db.execute('''
       Create table users(
        id integer primary key autoincrement,
        guid Text not null,
        name TEXT not null
        )
        ''');
  }

  void deleteDataFromBase()async{
    final db = await database;
    await deleteAllReportDetailModelData();
    await deleteAllDebtsData();
    await deleteAllTaskData();
    await deleteAllFlatModelData();
    await deleteAllHouseModelData();
    await deleteAllReportDetailModelData();
    await deleteAllMainMenuData();
    await deleteAllReportMenuData();

  }


 insertDataToMainMenu(List<String> mainMenus)async{
   final db = await database;
   List<dynamic> results;
   for(var item in mainMenus){
     var res = await db.insert("mainMenu", {"name":item});
    }

 }

 Future<List<String>> getListMainMenu()async{
    final db = await database;
    var res = await db.rawQuery('SELECT * FROM mainMenu');
    var resList = res.toList();
    List<String> list=[];
    for(var item in resList){
      list.add(item["name"]);
    }
     return list;
   }

  deleteAllMainMenuData() async {
    final db = await database;
    await db.delete("mainMenu");
  }



  insertDataToReportMainMenu(List<ReportMenuModel> reportMenus)async{
    final db = await database;

    for(var item in reportMenus){
      var res = await db.insert("reportMenu", {"name":item.name,"account":item.account});
    }

  }


  Future<List<ReportMenuModel>> getListReportMenu()async{
    final db = await database;
    var res = await db.rawQuery('SELECT * FROM reportMenu');
    var resList = res.toList();
    List<ReportMenuModel> list=[];
    for(var item in resList){
      ReportMenuModel reportMenuModel = ReportMenuModel.FromJson(item);
      list.add(reportMenuModel);
    }
    return list;
  }

  deleteAllReportMenuData() async {
    final db = await database;
    await db.delete("reportMenu");
  }

  insertDataToUsersModel(List<UsersModel> users)async{
    final db = await database;
    for(var item in users){
      var res = await db.insert("users", item.toMap());
    }
  }

  Future<List<UsersModel>> getUsers()async{
    final db = await database;
    var res = await db.rawQuery('SELECT * FROM users');
    var resList = res.toList();

    List<UsersModel> list=[];
    for(var item in resList){
      UsersModel usersModel = UsersModel.FromJson(item);
      list.add(usersModel);
    }
    return list;
  }

  deleteAllUsersData() async {
    final db = await database;
    await db.delete("users");
  }

 insertDataToHouseModel(List<HouseModel> houseModels)async{
    final db = await database;
    for(var item in houseModels){
      var res = await db.insert("house", item.toMap());
    }
  }

  Future<List<HouseModel>> getHouseModels()async{
    final db = await database;
    var res = await db.rawQuery('SELECT * FROM house');
    var resList = res.toList();
    List<HouseModel> list=[];
    for(var item in resList){
      HouseModel houseModel = new HouseModel.FromJson(item);
      list.add(houseModel);
    }
    return list;
  }

  deleteAllHouseModelData() async {
    final db = await database;
    await db.delete("house");
  }


  insertDataToFlatModel(List<FlatModel> flats)async{
    final db = await database;
    for(var item in flats){
      var res = await db.insert("flat", item.toMap());
    }
  }

  Future<List<FlatModel>> getFlats(String status,houseGuid)async{
    final db = await database;
    var res = await db.rawQuery('SELECT * FROM flat Where status =? and houseGuid =?',['$status','$houseGuid']);
    var resList = res.toList();
    List<FlatModel> list=[];
    for(var item in resList){
      FlatModel flatModel = new FlatModel.FromJson(item);
      list.add(flatModel);
    }
    return list;
  }

  deleteAllFlatModelData() async {
    final db = await database;
    await db.delete("flat");
  }


  insertDataToTask(List<Task> tasks)async{
    final db = await database;
    for(var item in tasks){
      var res = await db.insert("flat", item.toMap());
    }
  }

  Future<List<Task>> getTasks()async{
    final db = await database;
    var res = await db.rawQuery('SELECT * FROM tasks');
    var resList = res.toList();
    List<Task> list=[];
    for(var item in resList){
      Task task = new Task.FromJson(item);
      list.add(task);
    }
    return list;
  }

  deleteAllTaskData() async {
    final db = await database;
    await db.delete("tasks");
  }


  insertDataToDebt(List<DebtModel> debts)async{
    final db = await database;
    for(var item in debts){
      var res = await db.insert("debt", item.toMap());
    }
  }

  Future<List<DebtModel>> getDebts()async{
    final db = await database;
    var res = await db.rawQuery('SELECT * FROM debt');
    var resList = res.toList();
    List<DebtModel> list=[];
    for(var item in resList){
      DebtModel debtModel = new DebtModel.fromJson(item);
      list.add(debtModel);
    }
    return list;
  }

  deleteAllDebtsData() async {
    final db = await database;
    await db.delete("debt");
  }


  insertDataToReportDetailModel(List<ReportDetailModel> reportDetails)async{
    final db = await database;
    for(var item in reportDetails){
      var res = await db.insert("reportDetailMenu", item.toMap());
    }
  }

  Future<List<ReportDetailModel>> getReportDetailModels(String account)async{
    final db = await database;
    var res = await db.rawQuery('SELECT * FROM reportDetailMenu where account=? or keyAccount=?',['$account','$account']);
    var resList = res.toList();
    List<ReportDetailModel> list=[];
    for(var item in resList){
      ReportDetailModel detailModel = new ReportDetailModel.fromJson(item);
      list.add(detailModel);
    }
    return list;
  }

  deleteAllReportDetailModelData() async {
    final db = await database;
    await db.delete("reportDetailMenu");
  }


}