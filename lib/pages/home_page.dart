import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebaflutter/pages/favs_page.dart';
import 'package:pruebaflutter/pages/general_page.dart';
import 'package:pruebaflutter/widgets/custom_bottonbar.dart';

import '../providers/pages_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: const CustomBottonBar(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menuOpt = Provider.of<PagesProvider>(context);
    final paginaSeleccionada = menuOpt.selectedMenuOpt;

    switch (paginaSeleccionada) {
      case 0:
        return const GeneralPage();
      case 1:
        return const FavsPage();
      default:
        return Container();
    }
  }
}
