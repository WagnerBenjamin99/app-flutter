import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/helpers/estilos.dart';
import 'dart:math';
import 'package:flutter_repo_guide/widgets/custom_card.dart';

class ArtistaTop extends StatefulWidget {
  const ArtistaTop({Key? key}) : super(key: key);

  @override
  State<ArtistaTop> createState() => _ArtistaTopState();
}

class _ArtistaTopState extends State<ArtistaTop> {
  final List<Map<String, String>> artists = [
    {
      'nombre': 'Red Hot Chili Peppers',
      'genero': 'Funk',
      'imagenUrl':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Rhcp-live-pinkpop05.jpg/220px-Rhcp-live-pinkpop05.jpg',
    },
    {
      'nombre': 'The Weekend',
      'genero': 'Pop',
      'imagenUrl': 'https://forbes.es/wp-content/uploads/2023/01/pheWeeknd.jpg',
    },
    {
      'nombre': 'Bad Bunny',
      'genero': 'Trap latino',
      'imagenUrl':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Bad_Bunny_2019_by_Glenn_Francis_%28cropped%29.jpg/396px-Bad_Bunny_2019_by_Glenn_Francis_%28cropped%29.jpg',
    },
    {
      'nombre': 'Dua Lipa',
      'genero': 'Pop',
      'imagenUrl':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/DuaLipaO2020522_%28101_of_110%29_%2852052470251%29_%28cropped%29.jpg/412px-DuaLipaO2020522_%28101_of_110%29_%2852052470251%29_%28cropped%29.jpg',
    },
    {
      'nombre': 'Travis Scott',
      'genero': 'Rap',
      'imagenUrl':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Travis_Scott_-_Openair_Frauenfeld_2019_08.jpg/513px-Travis_Scott_-_Openair_Frauenfeld_2019_08.jpg',
    },
  ];

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
