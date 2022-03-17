import 'dart:developer';
import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BaseDatos {
  //Nombre y versión de la base de datos
  final String nombreBase = "galeria.db";
  final int versionBase = 1;

  String tblFavoritos =
      "CREATE TABLE IF NOT EXISTS  tblFavoritos(id TEXT PRIMARY KEY,  username TEXT, name TEXT, profileImage TEXT, headerImage TEXT, likes INTEGER, headerBase64 TEXT, profileBase64 TEXT)";

  Future<String> obtenerubicacion() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, nombreBase);
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (e) {
      log(e.toString());
    }
    return path;
  }

  Future<Database> baseDatos() async {
    final path = await obtenerubicacion();
    return await openDatabase(path, version: versionBase, singleInstance: false,
        onCreate: (bd, version) async {
      await bd.execute(tblFavoritos);
    });
  }
}
