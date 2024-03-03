import 'package:flutter/material.dart';

import 'nav_bar_superior.dart';

class CartelPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      cabecera(),
      infoSerie(),
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
      Icon(
        Icons.accessibility_outlined,
        color: Colors.black,
        size: 15.0,
      ),
      Text(
        "Pokedex",
        style: TextStyle(color: Colors.black, fontSize: 15.0, letterSpacing: 5),
      ),
      Icon(
        Icons.accessibility_outlined,
        color: Colors.black,
        size: 15.0,
      ),
    ],
  );
}

Widget botonera(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 1.0),
    child: TextButton(
      child: const Text("Ver pokédex",
        style: TextStyle(color: Colors.black, fontSize: 15.0, letterSpacing: 5),),
      onPressed: () {
        Navigator.pushNamed(context, '/second');

      },
      style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
    ),
  );
}
