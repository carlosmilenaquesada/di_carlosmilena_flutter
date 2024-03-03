import 'package:flutter/material.dart';

import '../componentes/cartel_principal.dart';
import '../componentes/lista_cuadrada.dart';
import '../componentes/lista_redonda.dart';

class InicioPage extends StatelessWidget {
  var imagenes = List.of({});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: ListView(
        children: [CartelPrincipal(), ListaRedonda(), ListaCuadrada()],
      ),
      bottomNavigationBar: navInferior(),
    );
  }

  BottomNavigationBar navInferior() {
    return BottomNavigationBar(
      backgroundColor: Colors.white38,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      // ignore: prefer_const_literals_to_create_immutables
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
        const BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up), label: "Like"),
        const BottomNavigationBarItem(
            icon: Icon(Icons.thumb_down), label: "Dislike"),
        const BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app), label: "Salir"),
      ],
    );
  }
}