import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

String gblIpWeb = "api.unsplash.com";
String gblKey = "WWsnQ522d0BwOfOEBv1YiWnNHIPazvfajZN5IeooVYM";

String gblURL = gblIpWeb + gblKey;

bool esMovil = false;
bool esEscritorio = false;
bool esTablet = false;
bool esDetalle = false;

Color colorFondo = const Color.fromARGB(255, 255, 255, 255);
Color colorObjetos = const Color.fromARGB(255, 255, 255, 255); //263238
Color colorBotones = const Color.fromARGB(255, 255, 255, 255);
Color colorLetra = const Color.fromARGB(255, 0, 0, 0);
Color colorAyuda = const Color.fromARGB(255, 0, 0, 0);
Color colorDesactivado = const Color.fromARGB(255, 0, 0, 0);
Color colorLogo = Colors.white;
Color colorOferta = Colors.orange;
Color colorTachado = Colors.red;

Color colorBotonCancelar = Colors.red;
Color colorLetraAlerta = Colors.red;
Color colorBoton = colorObjetos;

Color colorIcono = const Color(0XFFECA21D); //004F92
Color colorIconoCancelar = const Color(0xFFFFFFFF);
Color colorIconoAceptar = const Color(0xFFFFFFFF);

Color colorFondoCorrecto = const Color(0xFFFFFFFF);
Color colorFondoError = const Color(0xFFFFFFFF);
Color colorInicial = Colors.white;

int gblPagina = 1;

bool gblExiste = false;

obtenerUrlS(String metodo, Map<String, dynamic> query) {
  return Uri.http(gblIpWeb, metodo, query);
}

mensajeCorrecto(BuildContext context, String mensaje) {
  showTopSnackBar(
    context,
    CustomSnackBar.success(
      message: mensaje,
    ),
  );
}

mensajeInformacion(BuildContext context, String mensaje) {
  showTopSnackBar(
    context,
    CustomSnackBar.info(
      message: mensaje,
    ),
  );
}
