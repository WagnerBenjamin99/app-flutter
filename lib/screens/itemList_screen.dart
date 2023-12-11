import 'package:flutter/material.dart';
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
      'duracion': '2:30',
      'imagenUrl':
          'https://www.delabahia.com.ar/wp-content/uploads/2019/06/30467591.jpg',
    },
    {
      'titulo': 'Lisa',
      'artista': 'Gustavo Cerati',
      'duracion': '2:30',
      'imagenUrl':
          'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/7fddf627364375.5636404464236.jpeg',
    },
    {
      'titulo': 'Puente',
      'artista': 'Gustavo Cerati',
      'duracion': '2:30',
      'imagenUrl':
          'https://images-na.ssl-images-amazon.com/images/I/71P8kbXVHJL._SL1500_.jpg',
    },

    // Agrega más datos de canciones según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Canciones'),
      ),
      body: ListView.builder(
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
    );
  }
}
