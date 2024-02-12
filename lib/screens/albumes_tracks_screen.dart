/*import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/helpers/estilos.dart';
import 'package:flutter_repo_guide/widgets/Card_albumtracks.dart';
import 'package:flutter_repo_guide/widgets/customDrawe.dart';

class AlbumesTracksScreen extends StatelessWidget {
  final List<Map<String, String>> songs_albumes = [
    {
      'titulo': 'Manjar',
      'album': 'Civilizaciòn',
      'duracion': '4:32 minutos',
      'imagenUrl':
          'https://1.bp.blogspot.com/-rhg29DSsPxY/XP5SN6QO1aI/AAAAAAAAEco/S2V1I5qG5xQe_-RoLZMl-65Bwf-IOgvRwCLcBGAs/s640/Los%2BPiojos.jpg',
    },
    {
      'titulo': 'Pacìfico',
      'album': 'Civilizaciòn',
      'duracion': '4:43 minutos',
      'imagenUrl':
          'https://th.bing.com/th/id/R.28936cfb175022a1f078314f23f87702?rik=iej1uSewHVOCPQ&riu=http%3a%2f%2fpm1.narvii.com%2f6391%2f57fbf7a19de9982e3d8e8f9fddcbd353884b534e_hq.jpg&ehk=4gs04freglkn6rEApbhuf6CNaJEtIiyY9N7y7aKHD7M%3d&risl=&pid=ImgRaw&r=0',
    },
    {
      'titulo': 'Bicho de Ciudad',
      'album': 'Civilizaciòn',
      'duracion': '5:21 minutos',
      'imagenUrl':
          'https://akamai.sscdn.co/uploadfile/letras/albuns/8/6/4/8/641201530022754.jpg',
    },
    {
      'titulo': 'Pollo Viejo',
      'album': 'Civilizaciòn',
      'duracion': '4:36 minutos',
      'imagenUrl':
          'https://studiosol-a.akamaihd.net/letras/338x298/fotos/5/e/9/a/5e9a31fd01c889e9e4878a1242715342.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cancionero del álbum'),
        backgroundColor: Estilos.greenOscuro,
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: kToolbarHeight),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: songs_albumes.length,
            itemBuilder: (context, index) {
              final song = songs_albumes[index];
              return CardAlbumTracks(
                titulo: song['titulo']!,
                album: song['album']!,
                duracion: song['duracion']!,
                imagenUrl: song['imagenUrl']!,
              );
            },
          ),
          //_buildBody(_selectedIndex),
        ),
      ),
    );
  }
}*/
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
          };
        }).toList();
      });
    } else {
      throw Exception('Error al cargar las canciones del álbum');
    }
  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Cancionero del Album'),
//         backgroundColor: Estilos.greenOscuro,
//       ),
//       drawer: CustomDrawer(),
//       body: Center(
//         child: Container(
//           margin: const EdgeInsets.symmetric(vertical: kToolbarHeight),
//           child: ListView.builder(
//             physics: const BouncingScrollPhysics(),
//             itemCount: songs_albumes.length,
//             itemBuilder: (context, index) {
//               final song = songs_albumes[index];
//               return CardAlbumes(
//                 titulo: song['titulo'] ?? '',
//                 artista: song['album'] ?? '',
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
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
                  'https://i.scdn.co/image/ab67616d0000b2738ef0a8bde9750f9f219495d0', // URL de la imagen que deseas usar como fondo
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
                    artista: song['album'] ?? '',
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
