import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user_profile_model.dart';

class UserDatabase {
  static final UserDatabase instance = UserDatabase._init();
  static Database? _database;
  UserDatabase._init();


  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE user_profile (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      gender TEXT NOT NULL,
      age_range TEXT NOT NULL,
      notifications_enabled INTEGER NOT NULL
    )
  ''');
  }
  Future<int> createUser(UserProfileModel user) async {
    final db = await instance.database;
    return await db.insert('user_profile', user.toMap());
  }
}