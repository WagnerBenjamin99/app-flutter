import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/screens/albumesVistas/albums_azar_screen.dart';
import 'package:flutter_repo_guide/screens/artista_top_screen.dart';
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
          ListTile(
            title: Text('Inicio'),
            onTap: () {
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
          ListTile(
            title: Text('Filtro de canciones - Wagner'),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer antes de navegar
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FilterScreen()),
              );
            },
          ),
          //Diego Antonio Del Greco
          ListTile(
            title: const Text('5 Artistas Top'),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer antes de navegar
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ArtistaTop()),
              );
            },
          ),
          //Diego Antonio Del Greco
          ListTile(
            title: const Text('Albumes recomendados'),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer antes de navegar
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AlbumsAzar()),
              );
            },
          ),
        ],
      ),
    );
  }
}
