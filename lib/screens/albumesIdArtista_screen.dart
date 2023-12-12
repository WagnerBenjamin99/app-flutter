import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/screens/item_screen.dart';
import 'package:flutter_repo_guide/widgets/myCard_Song.dart';

class AlbumIdArtistaScreen extends StatelessWidget {
  final List<Map<String, String>> albumes = [
    {
      'titulo': 'Tercer Arco',
      'artista': 'Los Piojos',
      'anio': '1998',
      'imagenUrl':
          'https://akamai.sscdn.co/letras/360x360/albuns/8/8/4/b/639591529678955.jpg',
    },
    {
      'titulo': 'Azul',
      'artista': 'Los Piojos',
      'anio': '1998',
      'imagenUrl':
          'https://akamai.sscdn.co/letras/360x360/albuns/8/1/6/6/641231530022824.jpg',
    },
    {
      'titulo': 'Verde Paisaje Del Infierno',
      'artista': 'Los Piojos',
      'anio': '2000',
      'imagenUrl':
          'https://www.letras.com/los-piojos/discografia/verde-paisaje-del-infierno-2000/',
    },
    {
      'titulo': 'Civilizacion',
      'artista': 'Los Piojos',
      'anio': '2007',
      'imagenUrl':
          'https://www.letras.com/los-piojos/discografia/civilizacion-2007/',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Albumes T'),
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
                title: Text('Lista de Albumes '),
                onTap: () {
                  Navigator.pop(context); // Cierra el drawer antes de navegar
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SongListScreen()),
                  );
                },
              ),
              ListTile(
                title: Text('Registro individual '),
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
            itemCount: albumes.length,
            itemBuilder: (context, index) {
              final album = albumes[index];
              return MyCard_Song(
                titulo: album['titulo']!,
                artista: album['artista']!,
                duracion: album['anio']!,
                imagenUrl: album['imagenUrl']!,
              );
            },
          ),
        )));
  }
}
