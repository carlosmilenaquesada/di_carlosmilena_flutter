import 'package:flutter/material.dart';

import 'lista_redonda.dart';
import 'nav_bar_superior.dart';

class CartelPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      cabecera(),
      infoSerie(),
      ListaRedonda(),
      botonera(context),
    ]);
  }

  Widget cabecera() {
    return Column(
      children: [
        Container(
            height: 50.0,
            width: double.infinity,
            child: SafeArea(child: NavBarSuperior())),
        Image.network(
            "https://github.com/carlosmilenaquesada/di_repositorio_imagenes/blob/main/pokemon_logo.png?raw=true",
            fit: BoxFit.cover),
        Container(
          //crea degardado en imagen
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center, //comienza desde el centro
                  end: Alignment.bottomCenter, // al final de la imagen
                  colors: <Color>[
                Colors.white30, // comienza con negro con opacidad 38
                Colors.white30 // a negro
              ])),
        )
      ],
    );
  }
}

Widget infoSerie() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      SizedBox(height: 100),
      Text(
        "Un gran reto te espera",
        style: TextStyle(color: Colors.black, fontSize: 25.0, letterSpacing: 5),
      ),

      SizedBox(height: 100),
    ],
  );
}

Widget botonera(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 1.0),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            child: const Text(
              "Ver pokédex",
              style: TextStyle(color: Colors.black, fontSize: 15.0, letterSpacing: 5),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue.shade100, // Fondo azul suave
            ),
          ),
          SizedBox(width: 8),
          TextButton(
            child: const Text(
              "Registrarse",
              style: TextStyle(color: Colors.black, fontSize: 15.0, letterSpacing: 5),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/third');
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue.shade100, // Fondo azul suave
            ),
          ),
        ],
      ),
    ),
  );
}


