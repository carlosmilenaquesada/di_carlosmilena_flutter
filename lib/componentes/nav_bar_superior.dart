import 'package:flutter/material.dart';

class NavBarSuperior extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        const Text(
          "Tipos",
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        const Text(
          "Habilidades",
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        const Text(
          "Debilidades",
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        )
      ],
    );
  }
}
