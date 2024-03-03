import 'package:flutter/material.dart';

import 'item_cuadrado.dart';

class ListaCuadrada extends StatelessWidget {


  List<String> lista_condes = [

    "https://github.com/carlosmilenaquesada/di_repositorio_imagenes/blob/main/001.png?raw=true",
    "https://github.com/carlosmilenaquesada/di_repositorio_imagenes/blob/main/002.png?raw=true",
    "https://github.com/carlosmilenaquesada/di_repositorio_imagenes/blob/main/003.png?raw=true",
    "https://github.com/carlosmilenaquesada/di_repositorio_imagenes/blob/main/004.png?raw=true",
    "https://github.com/carlosmilenaquesada/di_repositorio_imagenes/blob/main/005.png?raw=true",
    "https://github.com/carlosmilenaquesada/di_repositorio_imagenes/blob/main/006.png?raw=true",
    "https://github.com/carlosmilenaquesada/di_repositorio_imagenes/blob/main/007.png?raw=true",
    "https://github.com/carlosmilenaquesada/di_repositorio_imagenes/blob/main/008.png?raw=true",
    "https://github.com/carlosmilenaquesada/di_repositorio_imagenes/blob/main/009.png?raw=true",


  ];



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
          height: 110.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: lista_condes.length,
            itemBuilder: (context, index) {
              return ItemCuadrado(lista_condes[index]);
            },
          )),
    );
  }
}
