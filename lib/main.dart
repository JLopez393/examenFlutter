import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebaflutter/pages/details_page.dart';
import 'package:pruebaflutter/pages/home_page.dart';
import 'package:pruebaflutter/providers/pages_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PagesProvider()),
        // ChangeNotifierProvider(create: (_) => PantallaModel())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomePage(),
        'details': (_) => const DetailsPage()
      },
    );
  }
}
