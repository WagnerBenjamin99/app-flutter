import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/screens/item_screen.dart';
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

    // Agrega más datos de canciones según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Canciones'),
          backgroundColor: Color.fromRGBO(33, 134, 18, 0.992),
        ),
        drawer: Drawer(
          // Contenido del drawer (menú lateral)
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(33, 134, 18, 0.992),
                ),
                child: Text(
                  'Menú',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              // Agrega más opciones de menú si es necesario
              ListTile(
                title: Text('Inicio '),
                onTap: () {
                  // Acción cuando se selecciona la opción 1
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Lista de canciones - Wagner'),
                onTap: () {
                  Navigator.pop(context); // Cierra el drawer antes de navegar
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SongListScreen()),
                  );
                },
              ),
              ListTile(
                title: Text('Registro individual - Wagner'),
                onTap: () {
                  Navigator.pop(context); // Cierra el drawer antes de navegar
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ItemScreen()),
                  );
                },
              ),
            ],
          ),
        ),
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
