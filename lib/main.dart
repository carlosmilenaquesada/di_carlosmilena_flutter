import 'package:di_carlosmilena_flutter/paginas/inicio.dart';
import 'package:di_carlosmilena_flutter/pokedex/PokedexScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => InicioPage(),
        '/second': (context) => const SecondScreen(),
      },
    );
  }
}