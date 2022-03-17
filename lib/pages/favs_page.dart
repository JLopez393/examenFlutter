import 'package:flutter/material.dart';
import 'package:pruebaflutter/class/favoritos_class.dart';
import 'package:pruebaflutter/widgets/customprogreso_widget.dart';
import 'package:pruebaflutter/widgets/itemcard_widget.dart';
import 'package:pruebaflutter/widgets/sindatos_widget.dart';

import '../bloc/movilgaleria_bloc.dart';

class FavsPage extends StatefulWidget {
  const FavsPage({Key? key}) : super(key: key);

  @override
  State<FavsPage> createState() => _FavsPageState();
}

class _FavsPageState extends State<FavsPage> {
  TextEditingController cBusqueda = TextEditingController();

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    /* _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // gblPagina++;

        // setState(() {});
      }
    }); */
  }

  @override
  Widget build(BuildContext context) {
    double dAlto = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.transparent,
      height: dAlto * 0.9,
      child: buscarFavoritos(),
    );
  }

  buscarFavoritos() {
    MovilPhotosClassBloc bPhotos = MovilPhotosClassBloc();
    bPhotos.obtenerMovilPhotosClass();
    return StreamBuilder(
      stream: bPhotos.photosClassStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<FavoritosClass>> datos) {
        if (datos.hasData) {
          if (datos.data!.length == 1) {
            if ((int.tryParse(datos.data![0].id!) ?? -1) < 0) {
              return SinDatosWidget(
                  texto: datos.data![0].name == null
                      ? 'Comprueba su conexión a internet'
                      : datos.data![0].name!,
                  tipo: datos.data![0].id!);
            }
          }
          // mensajeCorrecto(context, 'Información recuperada exitosamente.');
          return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  // widgetAppBar(),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (context, index) => itemGaleria(datos.data![index]),
                    childCount: datos.data!.length,
                  ))
                ],
              ));
        }
        return const CustomProgresoWidget();
      },
    );
  }

  itemGaleria(FavoritosClass cFavorito) {
    return ItemCardWidget(
      cFavorito: cFavorito,
    );
  }
}
