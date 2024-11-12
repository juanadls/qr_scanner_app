import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/scan_model.dart';

//Singleton implementation
class DBProvider {
  static Database? _database;
//Constructor privado
  static final DBProvider db = DBProvider._();

  DBProvider._();

  get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  //DTABASE CREATION
  initDB() async {
    Directory documentsDirectory = await getApplicationCacheDirectory();
    final path = join(documentsDirectory.path, "ScansDB.db");
    print(path);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        //tABLE CREATION
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

  //Manipulates a new instance on the database using a model that represents the
  //table
  newScanRaw(ScanModel newScan) async {
    final id = newScan.id;
    final tipo = newScan.tipo;
    final valor = newScan.valor;

    //verifies db
    final Database dbase = await database;

    //insertion

    final res = await dbase.rawInsert('''
      INSERT INTO Scans( id, tipo, valor )
        VALUES( $id, '$tipo', '$valor' )
    ''');

    return res;
  }

  newScan(ScanModel newScan) async {
    //verifies db
    final Database dbase = await database;
    final res = dbase.insert("Scans", newScan.toJson());

//Res es el id del ultimo registro insertado
    return res;
  }
}
