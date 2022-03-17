import 'package:flutter/material.dart';
import 'package:pruebaflutter/bloc/galeria_bloc.dart';
import 'package:pruebaflutter/class/globales_class.dart';
import 'package:pruebaflutter/class/photos_class.dart';
import 'package:pruebaflutter/widgets/customprogreso_widget.dart';
import 'package:pruebaflutter/widgets/itemcard_widget.dart';
import 'package:pruebaflutter/widgets/sindatos_widget.dart';
import 'package:pruebaflutter/widgets/texto_android_widget.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({Key? key}) : super(key: key);

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

//obtenerDatos

class _GeneralPageState extends State<GeneralPage> {
  TextEditingController cBusqueda = TextEditingController();

  PhotosClassBloc bPhotos = PhotosClassBloc();

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        gblPagina++;

        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double dAlto = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.transparent,
      height: dAlto * 0.9,
      child: galeria(),
    );
  }

  galeria() {
    bPhotos.obtenerPhotosClass(null);
    return StreamBuilder(
      stream: bPhotos.photosClassStream,
      builder: (BuildContext context, AsyncSnapshot<List<PhotosClass>> datos) {
        if (datos.hasData) {
          if (datos.data!.length == 1) {
            if (int.parse(datos.data![0].id!) < 0) {
              return SinDatosWidget(
                  texto: datos.data![0].description == null
                      ? 'Comprueba su conexión a internet'
                      : datos.data![0].description!,
                  tipo: datos.data![0].id!);
            }
          }
          // mensajeCorrecto(context, 'Información recuperada exitosamente.');
          return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  widgetAppBar(),
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

  itemGaleria(PhotosClass cPhotos) {
    return ItemCardWidget(
      cPhoto: cPhotos,
    );
  }

  widgetAppBar() {
    double margenH = 40;
    if (esMovil) {
      margenH = 20;
    } else if (esTablet) {
      margenH = 30;
    }
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      flexibleSpace: Padding(
        padding:
            EdgeInsets.only(left: margenH, right: margenH, top: 5, bottom: 10),
        child: TextAndroidWidget(
            cCampo: cBusqueda,
            iAccion: TextInputAction.search,
            iTipo: TextInputType.text,
            icono: Icons.search,
            dCambia: cambio,
            dEnvia: validar,
            hTexto: "Buscar por username",
            lTexto: "Buscar por username",
            esPassword: false,
            esAutofocus: false,
            esHabilitado: true),
      ),
    );
  }

  cambio(String valor) {
    if (valor.isEmpty) {
      bPhotos.obtenerPhotosClass(null);
    }
  }

  validar(String valor) {
    bPhotos.obtenerPhotosClass(valor);
  }
}
