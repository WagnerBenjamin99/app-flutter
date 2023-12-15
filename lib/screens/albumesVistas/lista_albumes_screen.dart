import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/helpers/estilos.dart';
import 'package:flutter_repo_guide/widgets/customDrawe.dart';
import 'package:flutter_repo_guide/widgets/custom_card.dart';

class ListaAlbumes extends StatelessWidget {
  final int cantidad;
  const ListaAlbumes({super.key, required this.cantidad});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> albums = [
      {
        'nombre': 'Rhythms of Spring',
        'cantidadCanciones': 12,
        'albumURL': 'https://url-album-1.com/image.jpg'
      },
      {
        'nombre': 'Melodies in the Moonlight',
        'cantidadCanciones': 10,
        'albumURL': 'https://url-album-2.com/image.jpg'
      },
      {
        'nombre': 'Harmony\'s Symphony',
        'cantidadCanciones': 15,
        'albumURL': 'https://url-album-3.com/image.jpg'
      },
      {
        'nombre': 'Echoes of the Past',
        'cantidadCanciones': 8,
        'albumURL': 'https://url-album-4.com/image.jpg'
      },
      {
        'nombre': 'Serenade Under the Stars',
        'cantidadCanciones': 11,
        'albumURL': 'https://url-album-5.com/image.jpg'
      },
      {
        'nombre': 'Whispers in the Wind',
        'cantidadCanciones': 14,
        'albumURL': 'https://url-album-6.com/image.jpg'
      },
      {
        'nombre': 'Jazz in the Park',
        'cantidadCanciones': 9,
        'albumURL': 'https://url-album-7.com/image.jpg'
      },
      {
        'nombre': 'Mystic Aura',
        'cantidadCanciones': 13,
        'albumURL': 'https://url-album-8.com/image.jpg'
      },
      {
        'nombre': 'Enchanted Harmonies',
        'cantidadCanciones': 16,
        'albumURL': 'https://url-album-9.com/image.jpg'
      },
      {
        'nombre': 'Symphonic Dreams',
        'cantidadCanciones': 7,
        'albumURL': 'https://url-album-10.com/image.jpg'
      },
    ];

    List<Widget> albumesWidgets = List.generate(
      cantidad,
      (index) => CustomCard(
        nombre: albums[index]['nombre'] ?? '',
        generoCantidad: albums[index]['cantidadCanciones'] ?? '',
        imgURL: albums[index]['albumURL'] ?? '',
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('$cantidad ALBUMES RECOMENDADOS'),
        backgroundColor: Estilos.greenOscuro,
      ),
      drawer: CustomDrawer(),
      backgroundColor: Estilos.greenClarito,
      body: ListView(
        children: albumesWidgets,
      ),
    );
  }
}
