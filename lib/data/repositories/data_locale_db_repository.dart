// ignore_for_file: prefer_const_declarations, avoid_print

import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:squamobi_to_do/domain/repositories/locale_db_repository.dart';

class DataLocalDBRepository implements LocaleDbRepository {
  static final DataLocalDBRepository _instance = DataLocalDBRepository._init();

  static Database? _database;

  DataLocalDBRepository._init();
  factory DataLocalDBRepository() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('user.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
      onUpgrade: _upgradeDB,
    );
  }

  Future _createDB(Database db, int version) async {
    final id = 'TEXT PRIMARY KEY';
    final title = 'TEXT NOT NULL';
    String content = 'TEXT NOT NULL';
    String imageUrl = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE toDo ( 
  id $id, 
  title $title,
  content $content,
  imageUrl $imageUrl
  )
''');
  }

  FutureOr<void> _upgradeDB(Database db, int oldVersion, int newVersion) {
    if (oldVersion < newVersion) {}
  }

  @override
  Future<int> setDatabase(String tableName, Map<String, dynamic> toMap) async {
    final db = await _instance.database;
    try {
      int id = await db.insert(tableName, toMap);
      return id;
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  @override
  Future<List> getDatabase(String tableName) async {
    try {
      final db = await _instance.database;
      final result = await db.query(tableName);
      return result;
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  @override
  Future<void> deleteRowFromDatabase(String tableName, String id) async {
    try {
      final db = await database;
      await db.delete(
        tableName,
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  @override
  Future<int> updateRowFromDatabase(
      String tableName, int id, Map<String, dynamic> toMap) async {
    try {
      final db = await database;
      int rowID = await db.update(
        tableName,
        toMap,
        where: "id = ?",
        whereArgs: [id],
      );
      return rowID;
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }
}
