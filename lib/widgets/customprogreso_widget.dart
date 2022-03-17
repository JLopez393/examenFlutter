import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class CustomProgresoWidget extends StatelessWidget {
  const CustomProgresoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double dAlto = MediaQuery.of(context).size.height;
    return SpinPerfect(
      infinite: true,
      duration: const Duration(milliseconds: 3600),
      child: Container(
          color: Colors.transparent,
          width: dAlto * 0.20,
          height: dAlto * 0.70,
          child: const Icon(Icons.chair)),
    );
  }
}
