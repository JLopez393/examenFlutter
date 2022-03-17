import 'dart:async';

import 'package:pruebaflutter/class/photos_class.dart';
import '../api/photos_api.dart';

class PhotosClassBloc {
  final wPhotosClass = PhotosApi();

  static final PhotosClassBloc _singleton = PhotosClassBloc._internal();

  factory PhotosClassBloc() {
    return _singleton;
  }

  PhotosClassBloc._internal() {
    //obtenerPhotosClass();
  }

  final _photosClassController =
      StreamController<List<PhotosClass>>.broadcast();

  Stream<List<PhotosClass>> get photosClassStream =>
      _photosClassController.stream;

  dispose() {
    _photosClassController.close();
  }

  obtenerPhotosClass(String? busqueda) async {
    if (busqueda == null) {
      _photosClassController.sink.add(await wPhotosClass.obtenerDatos());
    } else {
      _photosClassController.sink.add(await wPhotosClass.buscaDato(busqueda));
    }
  }
}
