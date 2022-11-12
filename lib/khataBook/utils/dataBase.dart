import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Mydb {
  Database? _db;

  Future<Database> Check_db() async {
    if (_db != null) {
      return _db!;
    } else {
      return await Create_db();
    }
  }

  Future<Database> Create_db() async {
    Directory _folder = await getApplicationDocumentsDirectory();
    String _path = join(_folder.path, 'rojmel.db');
    return openDatabase(_path, version: 1, onCreate: (_db, version) {
      String query =
          'CREATE TABLE cus(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, mobile TEXT, address TEXT)';
      String proquery =
          "CREATE TABLE product(id INTEGER PRIMARY KEY AUTOINCREMENT,productname TEXT,quantity TEXT,price TEXT,purchasedate TEXT,client_id INTEGER,payment_status INTEGER)";

      _db.execute(proquery);
      _db.execute(query);
    });
  }

  void insertData(
    String n1,
    String m1,
    String a1,
  ) async {
    _db = await Check_db();
    _db!.insert('cus', {'name': n1, 'mobile': m1, "address": a1});
  }

  Future<List<Map>> readData() async {
    _db = await Check_db();
    String _query = "SELECT * FROM cus";
    List<Map> CusList = await _db!.rawQuery(_query, null);

    return CusList;
  }

  void deleteData(String id) async {
    _db = await Check_db();
    _db!.delete('cus', where: 'id = ?', whereArgs: [int.parse(id)]);
  }

  void updateData(String n1, String m1, String a1, String id) async {
    _db = await Check_db();
    _db!.update('cus', {'name': n1, 'mobile': m1, "address": a1},
        where: 'id = ?', whereArgs: [int.parse(id)]);
  }
  Future<List<Map>> ProreadData(String id)async{
    _db= await Check_db();
    String query = "SELECT * FROM product where client_id = $id";
    List<Map> ProductList = await _db!.rawQuery(query,null);
    return ProductList;
  }
  void ProinsertData(String n1,String q1 ,String p1,String pq,int clientId,int status)async{
    _db =  await Check_db();
    _db!.insert("product", {"productname":n1,"quantity":q1,"price":p1,"purchasedate":pq,"client_id":clientId,"payment_status":status});
  }

  void Prodeletedata(String id)async{
    _db= await Check_db();
    _db!.delete("product",where: "id = ?",whereArgs: [int.parse(id)]);
  }

  void Proupdatedata(String id,String n1, String q1,String p1,String pq,int clientId,int status)async{
    _db= await Check_db();
    _db!.update("product", {"productname":n1,"quantity":q1,"price":p1,"purchasedate":pq,"client_id":clientId,"payment_status":status},where:"id = ?",whereArgs: [int.parse(id)]);
  }
}
