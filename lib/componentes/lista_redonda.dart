import 'package:flutter/material.dart';

import 'item_redondeado.dart';

class ListaRedonda extends StatelessWidget {
  List<String> lista_tipos = [
    "https://github.com/carlosmilenaquesada/di_repositorio_imagenes/blob/main/tipo1.png?raw=true",
    "https://github.com/carlosmilenaquesada/di_repositorio_imagenes/blob/main/tipo2.png?raw=true",
    "https://github.com/carlosmilenaquesada/di_repositorio_imagenes/blob/main/tipo3.png?raw=true",
    "https://github.com/carlosmilenaquesada/di_repositorio_imagenes/blob/main/tipo4.png?raw=true",
    "https://github.com/carlosmilenaquesada/di_repositorio_imagenes/blob/main/tipo5.png?raw=true",
    "https://github.com/carlosmilenaquesada/di_repositorio_imagenes/blob/main/tipo6.png?raw=true",
    "https://github.com/carlosmilenaquesada/di_repositorio_imagenes/blob/main/tipo7.png?raw=true",
    "https://github.com/carlosmilenaquesada/di_repositorio_imagenes/blob/main/tipo8.png?raw=true",
    "https://github.com/carlosmilenaquesada/di_repositorio_imagenes/blob/main/tipo9.png?raw=true",
    "https://github.com/carlosmilenaquesada/di_repositorio_imagenes/blob/main/tipo10.png?raw=true",
    "https://github.com/carlosmilenaquesada/di_repositorio_imagenes/blob/main/tipo11.png?raw=true",
    "https://github.com/carlosmilenaquesada/di_repositorio_imagenes/blob/main/tipo12.png?raw=true"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: lista_tipos.length,
          itemBuilder: (context, index) {
            return ItemRedondeado(lista_tipos[index]);
          },
        ));
  }
}
