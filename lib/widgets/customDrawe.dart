import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/helpers/estilos.dart';
import 'package:flutter_repo_guide/screens/albumesVistas/albums_azar_screen.dart';
import 'package:flutter_repo_guide/screens/albumes_tracks_screen.dart';
import 'package:flutter_repo_guide/screens/artista_top_screen.dart';
import 'package:flutter_repo_guide/screens/home_screen.dart';
import 'package:flutter_repo_guide/screens/itemFilter_screen.dart';
import 'package:flutter_repo_guide/screens/itemList_screen.dart';
import 'package:flutter_repo_guide/screens/item_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Contenido del drawer (menú lateral)
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Estilos.greenOscuro,
            ),
            child: Text(
              'Menú',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Inicio'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
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
          ListTile(
            title: Text('Filtro de Canciones - Wagner '),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer antes de navegar
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FilterScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Albumes por Id del Artista - Caba'),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer antes de navegar
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AlbumesTracksScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Cancionero del album - Caba'),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer antes de navegar
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AlbumesTracksScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Albumes al azar - Antonio Del Greco'),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer antes de navegar
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AlbumsAzar()),
              );
            },
          ),
          ListTile(
            title: const Text('Artistas TOP - Antonio Del Greco'),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer antes de navegar
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ArtistaTop()),
              );
            },
          ),
        ],
      ),
    );
  }
}
