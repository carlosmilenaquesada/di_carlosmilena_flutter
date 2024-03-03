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
  Future<List<Pokemon>?> _listadoPokemon = Future.value(); // esperar a resolver

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


        log(item["name"]["english"].toString());

        pokemon.add(Pokemon(item["name"]["english"], item["image"]["hires"]));

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
              children: _listPokemon(snapshot.data),
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);

            return Text("error");
          }

          return Text("data2");
        },
      )),
    );
  }

  List<Widget> _listPokemon(data) {
    List<Widget> pokemon = [];
    for (var poke in data) {
      pokemon.add(Column(children: [
        Image.network(
          poke.url_imagen, //  URL de  imagen
          width: 200.0, // Ancho de la imagen
          height: 200.0, // Altura de la imagen
          fit: BoxFit.contain, // Ajuste de la imagen dentro del contenedor
        )
      ,Text(poke.nombre)] ));
    }
    return pokemon;
  }
}
