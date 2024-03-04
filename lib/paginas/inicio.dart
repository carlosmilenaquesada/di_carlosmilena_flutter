import 'package:flutter/material.dart';

import '../componentes/Central.dart';
import '../componentes/ScrollUno.dart';
import '../componentes/ScrollDos.dart';

class InicioPage extends StatelessWidget {
  var imagenes = List.of({});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: ListView(
        children: [CartelPrincipal(),  ListaCuadrada()],
      ),
      bottomNavigationBar: navInferior(context),
    );
  }

  BottomNavigationBar navInferior(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white38,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
        const BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up), label: "Like"),
        const BottomNavigationBarItem(
            icon: Icon(Icons.thumb_down), label: "Dislike"),
        const BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app), label: "Salir"),
      ],
      onTap: (int index) {
        _mostrarMensaje(context, "${_obtenerTextoBoton(index)}");
      },
    );
  }

  void _mostrarMensaje(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        duration: Duration(seconds: 2),
      ),
    );
  }

  String _obtenerTextoBoton(int index) {
    switch (index) {
      case 0:
        return "Inicio";
      case 1:
        return "Like";
      case 2:
        return "Dislike";
      case 3:
        return "Salir";
      default:
        return "";
    }
  }

}