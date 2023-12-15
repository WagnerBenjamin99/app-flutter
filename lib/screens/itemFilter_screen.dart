import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/helpers/estilos.dart';
import 'package:flutter_repo_guide/widgets/customDrawe.dart';
import 'package:flutter_repo_guide/widgets/myCard_Song.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final List<Map<String, String>> songs = [
    {
      'titulo': 'Amor amarillo',
      'artista': 'Gustavo Cerati',
      'duracion': '2:30',
      'genero': 'Rock',
      'imagenUrl':
          'https://images-na.ssl-images-amazon.com/images/I/71P8kbXVHJL._SL1500_.jpg',
    },
    {
      'titulo': 'Bocanada',
      'artista': 'Gustavo Cerati',
      'duracion': '3:10',
      'genero': 'Rock',
      'imagenUrl':
          'https://i.scdn.co/image/ab67616d0000b2731152471596980e1bba03b6ab',
    },
    {
      'titulo': 'Lisa',
      'artista': 'Gustavo Cerati',
      'duracion': '4:30',
      'genero': 'Rock',
      'imagenUrl':
          'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/7fddf627364375.5636404464236.jpeg',
    },
    {
      'titulo': 'Puente',
      'artista': 'Gustavo Cerati',
      'duracion': '2:80',
      'genero': 'Rock',
      'imagenUrl':
          'https://images-na.ssl-images-amazon.com/images/I/71P8kbXVHJL._SL1500_.jpg',
    },
    {
      'titulo': 'Costumbres',
      'artista': 'Damas gratis',
      'duracion': '3:50',
      'genero': 'Cumbia',
      'imagenUrl':
          'https://images-na.ssl-images-amazon.com/images/I/71P8kbXVHJL._SL1500_.jpg',
    }
  ];

  List<String> generos = ['Rock', 'Reggaeton', 'Tango', 'Cumbia', 'All'];

  String generoSeleccionado = 'All';
  List<Map<String, String>> valoresFiltrados = [];

  @override
  void initState() {
    super.initState();

    songs.forEach((song) {
      valoresFiltrados.add(song);
    });
  }

  void actualizarValoresFiltrados(String nuevoGenero) {
    setState(() {
      generoSeleccionado = nuevoGenero;
      if (generoSeleccionado == 'All')
        valoresFiltrados = List.from(songs);
      else {
        valoresFiltrados.clear();
        songs.forEach((song) {
          if (song['genero'] == generoSeleccionado) valoresFiltrados.add(song);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtro Canciones'),
        backgroundColor: Estilos.greenOscuro,
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: generoSeleccionado,
              items: generos.map((String genero) {
                return DropdownMenuItem<String>(
                  value: genero,
                  child: Text(genero),
                );
              }).toList(),
              onChanged: (String? nuevoGenero) {
                if (nuevoGenero != null) {
                  actualizarValoresFiltrados(nuevoGenero);
                }
              },
            ),
            SizedBox(height: 20),
            Text('Canciones filtradas: '),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: valoresFiltrados.length,
                itemBuilder: (context, index) {
                  final song = valoresFiltrados[index];
                  return MyCard_Song(
                    titulo: song['titulo']!,
                    artista: song['artista']!,
                    duracion: song['duracion']!,
                    imagenUrl: song['imagenUrl']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
