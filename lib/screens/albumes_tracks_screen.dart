import 'package:flutter/material.dart';
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
}
