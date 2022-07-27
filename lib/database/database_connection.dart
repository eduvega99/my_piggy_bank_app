import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseConnection {

  static Database? _database;
  static final DatabaseConnection connection = DatabaseConnection._();

  DatabaseConnection._();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final String databasePath = join(documentsDirectory.path, 'Piggy.db'); 
    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: _onCreate
    );
  }

  void _onCreate(Database database, int version) async {
    await database.execute('''
      CREATE TABLE transactions(
        id INTEGER PRIMARY KEY,
        amount TEXT,
        date TEXT,
        description TEXT,
        type INTEGER,
        category_id INTEGER 
      )
    ''');
  }

}