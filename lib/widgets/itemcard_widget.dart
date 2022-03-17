import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as https;
import 'dart:typed_data';
import 'package:pruebaflutter/class/favoritos_class.dart';
import 'package:pruebaflutter/class/globales_class.dart';
import 'package:pruebaflutter/class/photos_class.dart';
import 'package:pruebaflutter/database/favoritos_database.dart';

class ItemCardWidget extends StatefulWidget {
  final PhotosClass? cPhoto;
  final FavoritosClass? cFavorito;
  const ItemCardWidget({Key? key, this.cPhoto, this.cFavorito})
      : super(key: key);

  @override
  State<ItemCardWidget> createState() => _ItemCardWidgetState();
}

class _ItemCardWidgetState extends State<ItemCardWidget> {
  FavoritosClass cFavoritos = FavoritosClass();

  Map<String, String> headers = {};

  @override
  Widget build(BuildContext context) {
    double dAlto = MediaQuery.of(context).size.height;
    double dAncho = MediaQuery.of(context).size.width;

    double margenH = 0.20;

    if (widget.cPhoto != null) {
      cFavoritos.id = widget.cPhoto!.id;
      cFavoritos.username = widget.cPhoto!.user!.username;
      cFavoritos.name = widget.cPhoto!.user!.name;
      cFavoritos.headerImage = widget.cPhoto!.urls!.small!;
      cFavoritos.profileImage = widget.cPhoto!.user!.profileImage!.medium!;
      cFavoritos.likes = widget.cPhoto!.likes;
    } else {
      cFavoritos = widget.cFavorito!;
    }

    construyeMapa(cFavoritos.headerImage!);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: widget.cPhoto!);
      },
      onDoubleTap: () {
        mensajeInformacion(context, 'Descargando imagen, espere...');
        // await bdFavorito.buscarIdFavorito(cFavorito.id!);
        // colorInicial = Colors.red;
        agregaFavorito(cFavoritos);
        setState(() {});
      },
      child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.only(
              left: dAncho * margenH,
              bottom: dAlto * 0.01,
              top: dAlto * 0.02,
              right: dAncho * 0.2),
          elevation: 10,
          shadowColor: const Color.fromARGB(255, 68, 64, 64),
          child: Column(
            children: [
              Stack(children: [
                FadeInImage(
                  fit: BoxFit.fill,
                  width: double.infinity,
                  placeholder: const AssetImage('assets/jar-loading.gif'),
                  image: NetworkImage(cFavoritos.headerImage!.split('?')[0],
                      headers: headers),
                ),
                Container(
                  padding: EdgeInsets.only(
                      bottom: dAlto * 0.02, left: dAncho * 0.45),
                  color: Colors.transparent,
                  width: dAncho * margenH,
                  height: dAlto * 0.10,
                  child: Icon(
                    Icons.favorite,
                    color: colorInicial,
                    size: 70,
                  ),
                ),
              ]),
              Container(
                  padding:
                      const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(children: [
                        const Icon(Icons.thumb_up_alt_outlined),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(cFavoritos.likes!.toString())
                      ]),
                      Text(cFavoritos.name == null
                          ? 'No especificado'
                          : cFavoritos.name!)
                    ],
                  ))
            ],
          )),
    );

    // Conta(child: const Icon(Icons.favorite_border_outlined))
  }

  construyeMapa(String url) {
    String titulo = "";
    String contenido = "";
    List<String> items = url.split('?')[1].split('&');

    for (var item in items) {
      titulo = item.split('=')[0];
      contenido = item.split('=')[1];

      headers.addAll({titulo: contenido});
    }
  }

  agregaFavorito(FavoritosClass cFavorito) async {
    BDFavorito bdFavorito = BDFavorito();
    String dominio = 'images.unsplash.com';
    String foto = "";
    String base64 = "";
    await bdFavorito.buscarIdFavorito(cFavorito.id!);

    if (!gblExiste) {
      /* foto = cFavorito.headerImage!.split('?')[0].split('/')[3];

      Uri url = Uri.http(dominio, foto);
      https.Response response = await https.get(url);
      Uint8List bytes = response.bodyBytes;
      //base64 = base64Encode(bytes);
      cFavoritos.headerBase64 = base64; */

      /* foto = cFavorito.profileImage!.split('?')[0].split('/')[3];

      url = Uri.http(dominio, foto);
      response = await https.get(url);
      bytes = response.bodyBytes;

      cFavoritos.profileBase64 = await base64Encode(bytes); */

      await bdFavorito.aregarFavorito(cFavorito);
      if (base64.isNotEmpty) {
        mensajeCorrecto(context, 'Imagen descargada con exito');
      }
    }
  }
}
