import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/helpers/estilos.dart';
import 'dart:math';
import 'package:flutter_repo_guide/widgets/custom_card.dart';
import 'package:http/http.dart' as http;

class ArtistaTop extends StatefulWidget {
  const ArtistaTop({Key? key}) : super(key: key);

  @override
  State<ArtistaTop> createState() => _ArtistaTopState();
}

class _ArtistaTopState extends State<ArtistaTop> {
List<Map<String, dynamic>> artists = [];

@override
  void initState() {
    super.initState();
    _fetchArtistsData();
  }

  Future<void> _fetchArtistsData() async {
    final response =
        await http.get(Uri.parse('http://localhost:8000/api/v1/artistas-top'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      setState(() {
        artists = data.map((artist) {
          return {
            'nombre': artist['name'],
            'genero': (artist['genres'].isNotEmpty) ? artist['genres'][0] : 'Sin genero',
            'imagenUrl': artist['images'][0]['url'],
          };
        }).toList();
      });
    } else {
      throw Exception('Fallo en leer los datos de la API.');
    }
  }

  @override
  Widget build(BuildContext context) {
    artists.shuffle(Random());

    return Scaffold(
      appBar: AppBar(
        title: const Text('5 ARTISTAS DEL MOMENTO'),
        backgroundColor: Estilos.greenOscuro,
      ),
      backgroundColor: Estilos.greenClarito,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            for (var artist in artists)
              CustomCard(
                nombre: artist['nombre'] ?? '',
                generoCantidad: artist['genero'] ?? 'Genero',
                imgURL: artist['imagenUrl'] ?? '',
              )
          ],
        ),
      ),
    );
  }
}
