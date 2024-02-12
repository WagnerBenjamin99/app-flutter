import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/helpers/estilos.dart';
import 'package:flutter_repo_guide/widgets/card_albumes.dart';
import 'package:flutter_repo_guide/widgets/customDrawe.dart';
import 'package:http/http.dart' as http;

class AlbumesTracksScreen extends StatefulWidget {
  //tracks de un album
  @override
  _AlbumesTracksScreenState createState() => _AlbumesTracksScreenState();
}

class _AlbumesTracksScreenState extends State<AlbumesTracksScreen> {
  List<Map<String, dynamic>> songs_albumes = [];

  //CardAlbumTracks? cardAlbumestracks;
  @override
  void initState() {
    super.initState();
    _fetchAlbumTracks();
  }

  Future<void> _fetchAlbumTracks() async {
    const String albumId =
        '2UWwSvdLSntNblYm32f6aN'; // Reemplaza con el ID del álbum en Spotify

    const String url = "http://localhost:8000/api/v1/albums/${albumId}/tracks";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['items'];

      setState(() {
        songs_albumes = data.map((item) {
          return {
            'titulo': item['name'],
            'artista': item['artists'][0]['name'],
          };
        }).toList();
      });
    } else {
      throw Exception('Error al cargar las canciones del álbum');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cancionero del Album'),
        backgroundColor: Estilos.greenOscuro,
      ),
      drawer: CustomDrawer(),
      body: Stack(
        fit: StackFit
            .expand, // Para que la imagen ocupe todo el espacio disponible
        children: [
          // Widget para la imagen de fondo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://i.scdn.co/image/ab67616d0000b2738ef0a8bde9750f9f219495d0',
                ),
                fit: BoxFit.cover, // Para cubrir todo el área disponible
              ),
            ),
          ),
          // Contenido de la pantalla
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: kToolbarHeight),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: songs_albumes.length,
                itemBuilder: (context, index) {
                  final song = songs_albumes[index];
                  return CardAlbumes(
                    titulo: song['titulo'] ?? '',
                    artista: song['artista'] ?? '',
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
