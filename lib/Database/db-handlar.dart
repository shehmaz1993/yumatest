
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:path/path.dart';

import 'model_class.dart';

class DBHelper{

  static Database? _db;
  Future<Database?> get db async{
    if(_db!=null){
      return _db;
    }
    _db=await initDatabase();
    return _db;
  }

  initDatabase()async{
     io.Directory documentDirectory = await getApplicationDocumentsDirectory();
     String path= join(documentDirectory.path,'users.db');
     var db=openDatabase(path,version: 1,onCreate: _onCreate);
     return db;
  }

  _onCreate(Database db,int version)async{
      await db.execute("CREATE TABLE users (username TEXT  PRIMARY KEY,consumer_uuid TEXT ,session_id TEXT)");
  }

  Future<UserModel> insert(UserModel usermode)async{
    var dbClient= await db;
    await dbClient!.insert('users', usermode.toJson());
    return usermode;
  }
  Future<List<UserModel>> getUserList()async{
    var dbClient=await db;
    final List<Map<String,Object?>> quaryResult= await dbClient!.query('users');
    return quaryResult.map((e) => UserModel.fromJson(e)).toList();
  }

  Future<int> deleteUser(int id) async {
    print('deleted');
    var dbClient=await db;
    return await dbClient!.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id]
    );

  }


}