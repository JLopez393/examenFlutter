import 'package:flutter/material.dart';
import 'package:pruebaflutter/class/favoritos_class.dart';
import 'package:pruebaflutter/class/globales_class.dart';

import 'database.dart';
import 'package:sqflite/sqflite.dart';

class BDFavorito {
  BaseDatos conexion = BaseDatos();

  aregarFavorito(FavoritosClass cFavorito) async {
    final db = await conexion.baseDatos();
    Batch agrega = db.batch();

    agrega.insert("tblFavoritos", cFavorito.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    await agrega.commit();
    await db.close();
  }

  buscarIdFavorito(String idFavorito) async {
    final db = await conexion.baseDatos();
    final res = await db
        .query("tblFavoritos", where: " id = ? ", whereArgs: [idFavorito]);
    List<FavoritosClass> list = res.isNotEmpty
        ? res.map((detalle) => FavoritosClass.fromJson(detalle)).toList()
        : [];
    await db.close();
    if (list.isEmpty) {
      colorInicial = Colors.white;
      gblExiste = false;
    } else {
      colorInicial = Colors.red;
      gblExiste = true;
      eliminarFavorito(idFavorito);
    }
    return gblExiste;
  }

  Future<int> eliminarFavorito(String idFavorito) async {
    final db = await conexion.baseDatos();
    final res = await db
        .delete("tblFavoritos", where: "id = ?", whereArgs: [idFavorito]);
    await db.close();
    return res;
  }

  Future<List<FavoritosClass>> obtenerListadoFavoritos() async {
    final db = await conexion.baseDatos();
    final res = await db.query("tblFavoritos");
    List<FavoritosClass> list = res.isNotEmpty
        ? res.map((detalle) => FavoritosClass.fromJson(detalle)).toList()
        : [];
    db.close();
    return list;
  }
}
