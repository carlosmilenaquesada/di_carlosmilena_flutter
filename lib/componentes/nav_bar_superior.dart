import 'package:flutter/material.dart';

class NavBarSuperior extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade300, // Fondo azul suave
          ),
          onPressed: () {
            _mostrarMensaje(context, 'Inicio');
          },
          child: Icon(
            Icons.home,
            color: Colors.white, // Texto blanco
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade300, // Fondo azul suave
          ),
          onPressed: () {
            _mostrarMensaje(context, 'Explorar');
          },
          child: Icon(
            Icons.explore,
            color: Colors.white, // Texto blanco
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade300, // Fondo azul suave
          ),
          onPressed: () {
            _mostrarMensaje(context, 'Notificaciones');
          },
          child: Icon(
            Icons.notifications,
            color: Colors.white, // Texto blanco
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade300, // Fondo azul suave
          ),
          onPressed: () {
            _mostrarMensaje(context, 'Perfil');
          },
          child: Icon(
            Icons.person,
            color: Colors.white, // Texto blanco
          ),
        ),
      ],
    );
  }

  void _mostrarMensaje(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Presionaste: $mensaje'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
