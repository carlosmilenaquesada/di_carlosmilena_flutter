import 'dart:convert';
import 'dart:developer';

import 'package:di_carlosmilena_flutter/models/Pokemon.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // es el estilo de la app
      title: "Primera App", // nombre de la app
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({super.key});

  @override
  _InicioState createState() => _InicioState();
}

/*---------------------------------------------------*/

class _InicioState extends State<Inicio> {
  Future<List<Pokemon>?> _listadoPokemon = Future.value();

  Future<List<Pokemon>> _getPokemon() async {
    String urlString =
        "https://raw.githubusercontent.com/carlosmilenaquesada/pokedexjsonfile/main/data_pokedex.json";
    Uri uri = Uri.parse(urlString);

    final response = await http.get(uri);
    List<Pokemon> pokemon = [];
    if (response.statusCode == 200) {
      // correcto
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      for (var item in jsonData["data"]) {


        String tipos = item["type"].toString();
        tipos = tipos
            .replaceAll("[", "")
            .replaceAll("]", "")
            .replaceAll(", ", " - ");

        String id = item["id"].toString();
        if (id.length == 1) {
          id = "N.º 00" + id;
        } else {
          if (id.length == 2) {
            id = "N.º 0" + id;
          } else {
            id = "N.º " + id;
          }
        }

        pokemon.add(Pokemon(item["name"]["english"], item["image"]["hires"], id,
            tipos, item["description"]));
      }
      return pokemon;
    } else {
      throw Exception("Error");
    }
  }

  @override
  void initState() {
    super.initState();
    _listadoPokemon = _getPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // estructura básica de una app
      // estructura de una app movil
      appBar: AppBar(
        title: Text("Primera App Title"),
      ),
      body: Center(
          child: FutureBuilder(
        future: _listadoPokemon,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              padding: EdgeInsets.all(20),
              children: _listPokemon(snapshot.data, context),
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);

            return Text("error");
          }

          return Text("loading");
        },
      )),
    );
  }

  List<Widget> _listPokemon(data, BuildContext context) {
    List<Widget> pokemon = [];
    for (var poke in data) {
      pokemon.add(_buildCard(poke.numero_pokedex, poke.nombre, poke.descripcion,
          poke.url_imagen, poke.tipo, context));
      pokemon.add(SizedBox(height: 16));
    }
    return pokemon;
  }

/*
*
          Column(children: [
        Text(poke.numero_pokedex),
        Text(poke.nombre),
        Image.network(
          poke.url_imagen
        ),
        Text(poke.tipo),
      ])
*
* */

  Widget _buildCard(String numero_pokedex, String nombre, String descripcion,
      String url_imagen, String tipo, BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                numero_pokedex,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 8),
              Text(
                nombre,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Center(
              child: Container(
            width: 140,
            height: 140,
            child: Image.network(
              url_imagen,
              fit: BoxFit
                  .cover, // Ajusta el modo de ajuste según tus necesidades
            ),
          )),
          SizedBox(height: 8),
          Text(
            descripcion,
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 16),
          Center(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue,
                // Puedes ajustar el color según tus preferencias
                borderRadius:
                    BorderRadius.circular(8), // Ajusta el radio de las esquinas
              ),
              child: Text(
                tipo,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white), // Puedes ajustar el color del texto
              ),
            ),
          ),
          SizedBox(height: 16),

        ],
      ),
    );
  }
}
