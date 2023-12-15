import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/helpers/estilos.dart';
import 'package:flutter_repo_guide/widgets/customDrawe.dart';
import 'package:flutter_repo_guide/widgets/myCard_Song.dart';

class SongListScreen extends StatelessWidget {
  final List<Map<String, String>> songs = [
    {
      'titulo': 'Amor amarillo',
      'artista': 'Gustavo Cerati',
      'duracion': '2:30',
      'imagenUrl':
          'https://images-na.ssl-images-amazon.com/images/I/71P8kbXVHJL._SL1500_.jpg',
    },
    {
      'titulo': 'Bocanada',
      'artista': 'Gustavo Cerati',
      'duracion': '3:10',
      'imagenUrl':
          'https://i.scdn.co/image/ab67616d0000b2731152471596980e1bba03b6ab',
    },
    {
      'titulo': 'Lisa',
      'artista': 'Gustavo Cerati',
      'duracion': '4:30',
      'imagenUrl':
          'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/7fddf627364375.5636404464236.jpeg',
    },
    {
      'titulo': 'Puente',
      'artista': 'Gustavo Cerati',
      'duracion': '2:80',
      'imagenUrl':
          'https://images-na.ssl-images-amazon.com/images/I/71P8kbXVHJL._SL1500_.jpg',
    },
  ];

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
