import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/screens/itemList_screen.dart';
import 'package:flutter_repo_guide/widgets/myCard_Song.dart';

class ItemScreen extends StatelessWidget {
  final MyCard_Song myCard = MyCard_Song(
    titulo: 'Amor amarillo',
    artista: 'Gustavo Cerati',
    duracion: '2:30',
    imagenUrl:
        'https://images-na.ssl-images-amazon.com/images/I/71P8kbXVHJL._SL1500_.jpg',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(myCard.titulo),
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
            ListTile(
              title: Text('Inicio'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SongListScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Lista de canciones - Wagner'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SongListScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Registro individual - Wagner'),
              onTap: () {
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
        child: myCard,
      ),
    );
  }
}
