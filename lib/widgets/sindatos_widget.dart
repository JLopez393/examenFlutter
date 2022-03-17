import 'package:flutter/material.dart';
import 'package:pruebaflutter/class/globales_class.dart';

class SinDatosWidget extends StatelessWidget {
  final String texto;
  final String tipo;
  const SinDatosWidget({Key? key, required this.texto, required this.tipo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double dAlto = MediaQuery.of(context).size.height;
    double pTamano = 0.4;
    if (esEscritorio) {
      pTamano = 0.8;
    }
    return Container(
      width: double.infinity,
      height: dAlto * pTamano,
      color: Colors.transparent,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(obtenerTipoImagen(0),
              fit: BoxFit.cover, height: dAlto * 0.25),
          Container(height: dAlto * 0.02),
          Text(
            texto,
            style: TextStyle(fontSize: 15, color: colorLetra),
          )
        ],
      )),
    );
  }

  obtenerTipoImagen(int tipo) {
    switch (tipo) {
      case 0:
        return "assets/sindatos.png";
      case -1:
        return "assets/sindatos.png";
      default:
        return "assets/sindatos.png";
    }
  }
}
