import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//Singleton implementation
class DBProvider extends ChangeNotifier {
  static Database? _database;

//Constructor privado
  static final DBProvider db = DBProvider._();

  DBProvider._();

  get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }
}

initDB() async {
  Directory documentsDirectory = await getApplicationCacheDirectory();
  final path = join(documentsDirectory.path, "ScansDB.db");

  return await openDatabase(
    path,
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
        '''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
        ''',
      );
    },
  );
}
