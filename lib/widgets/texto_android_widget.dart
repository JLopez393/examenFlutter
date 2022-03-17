import 'package:flutter/material.dart';
import 'package:pruebaflutter/class/globales_class.dart';

class TextAndroidWidget extends StatelessWidget {
  final TextEditingController cCampo;
  final TextInputAction iAccion;
  final TextInputType iTipo;
  final IconData icono;
  final Function dCambia;
  final Function dEnvia;
  final String hTexto;
  final String lTexto;
  final bool esPassword;
  final bool esAutofocus;
  final bool esHabilitado;
  final FocusNode? fNode;
  const TextAndroidWidget(
      {Key? key,
      required this.cCampo,
      required this.iAccion,
      required this.iTipo,
      required this.icono,
      required this.dCambia,
      required this.dEnvia,
      required this.hTexto,
      required this.lTexto,
      required this.esPassword,
      required this.esAutofocus,
      required this.esHabilitado,
      this.fNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: esHabilitado,
      style: TextStyle(color: colorLetra),
      controller: cCampo,
      autofocus: esAutofocus,
      focusNode: fNode,
      keyboardType: iTipo,
      obscureText: esPassword,
      textInputAction: iAccion,
      onChanged: (valor) => dCambia(valor),
      onSubmitted: (valor) => dEnvia(valor),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorDesactivado),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorLetra),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        hintText: hTexto,
        hintStyle: TextStyle(color: colorAyuda, fontSize: 12),
        labelText: lTexto,
        labelStyle: TextStyle(color: colorAyuda, fontSize: 12),
        prefixIcon: GestureDetector(
            onTap: () {
              if (cCampo.text.isNotEmpty) {
                dEnvia(cCampo.text);
              }
            },
            child: Icon(icono, color: colorIcono)),
        suffixIcon: GestureDetector(
            onTap: () {
              cCampo.text = "";
              dCambia("");
            },
            child: Icon(Icons.close, color: colorLetra)),
      ),
    );
  }
}
