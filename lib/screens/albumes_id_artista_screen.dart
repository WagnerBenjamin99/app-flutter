import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/widgets/Card_albumes.dart';
import 'package:flutter_repo_guide/widgets/customDrawe.dart';

class AlbumIdArtistaScreen extends StatelessWidget {
  int _selectedIndex = 0;

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
          'https://akamai.sscdn.co/uploadfile/letras/albuns/1/4/d/1/641221530022803.jpg',
    },
    {
      'titulo': 'Civilizacion',
      'artista': 'Los Piojos',
      'anio': '2007',
      'imagenUrl':
          'https://akamai.sscdn.co/uploadfile/letras/albuns/8/6/4/8/641201530022754.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albumes por Id Artista'),
        backgroundColor: const Color.fromRGBO(33, 134, 18, 0.992),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: kToolbarHeight),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: albumes.length,
            itemBuilder: (context, index) {
              final album = albumes[index];

              return CardAlbumes(
                titulo: album['titulo']!,
                artista: album['artista']!,
                anio: album['anio']!,
                imagenUrl: album['imagenUrl']!,
              );
            },
          ),
        ),
      ),
    );
  }
}
