import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  var database;

  createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = (databasesPath + 'my.db');

    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    return database;
  }

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE PDFTABLE ("
        "id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "create_date INTEGER,"
        "size INTEGER ,"
        ")");
    await database.execute("CREATE TABLE WORD ("
        "id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "create_date INTEGER,"
        "size INTEGER ,"
        ")");
    await database.execute("CREATE TABLE NOTES ("
        "id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "create_date INTEGER,"
        "size INTEGER ,"
        ")");
    await database.execute("CREATE TABLE IMAGES ("
        "id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "create_date INTEGER,"
        "size INTEGER ,"
        ")");
    await database.execute("CREATE TABLE MESSAGES ("
        "id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "create_date INTEGER,"
        "size INTEGER ,"
        ")");
    await database.execute("CREATE TABLE VIDEOS ("
        "id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "create_date INTEGER,"
        "size INTEGER ,"
        ")");
    await database.execute("CREATE TABLE RECENTS ("
        "id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "create_date INTEGER,"
        "size INTEGER ,"
        ")");
  }


 /* Future<dynamic> create({ required String table_name , dynamic model} ) async {
    var result = await database.insert(table_name , model);
    return result;
  }*/
  Future<dynamic> create({required String table_name , dynamic model}) async {
    var result =
     await database;
    return database.insert(
      table_name , model,
      //conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<dynamic> read({required String table_name , dynamic model}) async {
    var result = await database.rawQuery('SELECT * FROM table_name');
    return result.toList();
  }

  Future<dynamic> update({required String table_name , dynamic model}) async {
    return await database.update(table_name, model.toMap()/*, where: "id = ?", whereArgs: [model]*/);
  }

  Future<dynamic> delete({required String table_name , dynamic model}) async {
    return await database.delete(where : table_name /*, where: 'id = ?', whereArgs: [id]*/ );
  }

}
