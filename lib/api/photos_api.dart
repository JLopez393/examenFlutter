import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:pruebaflutter/class/photos_class.dart';
import 'package:pruebaflutter/class/globales_class.dart';

class PhotosApi {
  List<PhotosClass> lGaleria = [];
  PhotosClass dPhotos = PhotosClass();
  obtenerDatos() async {
    lGaleria = [];
    dPhotos = PhotosClass();

    try {
      final url = obtenerUrlS(
          '/photos', {'page': gblPagina.toString(), 'client_id': gblKey});
      final resp = await https.get(url);
      if (resp.statusCode == 200) {
        final decodeData = json.decode(resp.body);

        for (int i = 0; i < decodeData.length; i++) {
          PhotosClass aGaleria = PhotosClass();
          aGaleria = PhotosClass.fromJson(decodeData[i]);
          lGaleria.add(aGaleria);
        }

        return lGaleria;
      } else {
        return almacenaError(0, resp.body);
      }
    } catch (e) {
      if (e is SocketException) {
        return almacenaError(-1, e.toString());
      } else if (e is TimeoutException) {
        return almacenaError(-2, e.toString());
      } else if (e is HttpException) {
        return almacenaError(-3, e.toString());
      } else if (e is FormatException) {
        return almacenaError(-4, e.toString());
      } else {
        return almacenaError(-5, e.toString());
      }
    }
  }

  buscaDato(String query) async {
    lGaleria = [];
    dPhotos = PhotosClass();

    try {
      final url =
          obtenerUrlS('search/users', {'query': query, 'client_id': gblKey});

      final resp = await https.get(url);
      if (resp.statusCode == 200) {
        final decodeData = json.decode(resp.body);

        for (int i = 0; i < decodeData.length; i++) {
          PhotosClass aGaleria = PhotosClass();
          aGaleria = PhotosClass.fromJson(decodeData[i]);
          lGaleria.add(aGaleria);
        }

        return lGaleria;
      } else {
        return almacenaError(0, resp.body);
      }
    } catch (e) {
      if (e is SocketException) {
        return almacenaError(-1, e.toString());
      } else if (e is TimeoutException) {
        return almacenaError(-2, e.toString());
      } else if (e is HttpException) {
        return almacenaError(-3, e.toString());
      } else if (e is FormatException) {
        return almacenaError(-4, e.toString());
      } else {
        return almacenaError(-5, e.toString());
      }
    }
  }

  almacenaError(int idx, String mensaje) {
    dPhotos.id = idx.toString();
    dPhotos.description = mensaje;
    lGaleria.add(dPhotos);
    return lGaleria;
  }
}
