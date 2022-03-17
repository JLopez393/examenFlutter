import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/pages_provider.dart';

class CustomBottonBar extends StatelessWidget {
  const CustomBottonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOpt = Provider.of<PagesProvider>(context);
    final paginaSeleccionada = menuOpt.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: (int i) => menuOpt.selectedMenuOpt = i,
      currentIndex: paginaSeleccionada,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favs')
      ],
    );
  }
}
