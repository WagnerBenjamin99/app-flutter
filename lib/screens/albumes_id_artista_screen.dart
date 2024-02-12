import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/helpers/estilos.dart';
import 'package:flutter_repo_guide/widgets/card_albumtracks.dart';
import 'package:http/http.dart' as http;

class AlbumIdArtistaScreen extends StatefulWidget {
  @override
  _AlbumIdArtistaScreenState createState() => _AlbumIdArtistaScreenState();
}

class _AlbumIdArtistaScreenState extends State<AlbumIdArtistaScreen> {
  List<Map<String, dynamic>> albumes = [];

  @override
  void initState() {
    super.initState();
    _fetchAlbumes();
  }

  Future<void> _fetchAlbumes() async {
    const artistId = '4IjHltwoSKbUeZLPeULyDe';

    try {
      final response = await http.get(
          Uri.parse('http://localhost:8000/api/v1/artistas/$artistId/albums'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['items'];

        setState(() {
          albumes = data.map((item) {
            return {
              'titulo': item['name'],
              'artista': item['artists'][0]
                  ['name'], // Corregir la clave de 'album'
              // 'duracion': (item['duration_ms'] / 1000)
              //     .toString(), // Asumiendo que la duración está disponible
              'imagenUrl': item['images'][0]['url'],
            };
          }).toList();
        });
      } else {
        print('Error al obtener los datos: ${response.statusCode}');
      }
    } catch (error) {
      print('Error al realizar la solicitud HTTP: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albumes por Id Artista'),
        backgroundColor: Estilos.greenOscuro,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: kToolbarHeight),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: albumes.length,
            itemBuilder: (context, index) {
              final album = albumes[index];
              return CardAlbumTracks(
                titulo: album['titulo']!,
                artista: album['artista']!, // Cambiar 'artista' por 'album'
                imagenUrl: album['imagenUrl']!,
              );
            },
          ),
        ),
      ),
    );
  }
}
