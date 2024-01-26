import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/helpers/estilos.dart';
import 'package:flutter_repo_guide/widgets/customDrawe.dart';
import 'dart:convert';
import 'package:flutter_repo_guide/widgets/myCard_Song.dart';

import 'package:http/http.dart' as http;

class SongListScreen extends StatefulWidget {
  @override
  _SongListScreenState createState() => _SongListScreenState();
}

class _SongListScreenState extends State<SongListScreen> {
  List<Map<String, dynamic>> songs = [];
  final playlistId = '0lJ7vyyEgbf3dym29kQVfk?si=1fea608ce77b4163';

  @override
  void initState() {
    super.initState();
    _fetchPlaylistData();
  }

  Future<void> _fetchPlaylistData() async {
    final response = await http
        .get(Uri.parse('http://localhost:8000/api/v1/playlist/${playlistId}'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> items = data['items'];

      setState(() {
        songs = items.map((item) {
          final track = item['track'];

          return {
            'titulo': track['name'],
            'artista': track['artists'][0]['name'],
            'duracion': (track['duration_ms'] / 1000).toString(),
            'imagenUrl': track['album']['images'][0]['url'],
          };
        }).toList();
      });
    } else {
      print('Error al cargar la lista de canciones');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Canciones'),
          backgroundColor: Estilos.greenOscuro,
        ),
        drawer: CustomDrawer(),
        body: Center(
            child: Container(
          margin: EdgeInsets.symmetric(vertical: kToolbarHeight),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: songs.length,
            itemBuilder: (context, index) {
              final song = songs[index];
              return MyCard_Song(
                titulo: song['titulo']!,
                artista: song['artista']!,
                duracion: song['duracion']!,
                imagenUrl: song['imagenUrl']!,
              );
            },
          ),
        )));
  }
}
