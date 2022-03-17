import 'dart:async';

import 'package:pruebaflutter/class/favoritos_class.dart';
import 'package:pruebaflutter/database/favoritos_database.dart';

class MovilPhotosClassBloc {
  final wPhotosClass = BDFavorito();

  static final MovilPhotosClassBloc _singleton =
      MovilPhotosClassBloc._internal();

  factory MovilPhotosClassBloc() {
    return _singleton;
  }

  MovilPhotosClassBloc._internal() {
    //obtenerPhotosClass();
  }

  final _photosClassController =
      StreamController<List<FavoritosClass>>.broadcast();

  Stream<List<FavoritosClass>> get photosClassStream =>
      _photosClassController.stream;

  dispose() {
    _photosClassController.close();
  }

  obtenerMovilPhotosClass() async {
    _photosClassController.sink
        .add(await wPhotosClass.obtenerListadoFavoritos());
  }
}
