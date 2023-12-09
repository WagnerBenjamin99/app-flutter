import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/widgets/myCard_Song.dart';

class ItemScreen extends StatelessWidget {
  ItemScreen();

  MyCard_Song myCard = MyCard_Song(
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
        title: Text('Amor amarillo'),
      ),
      body: Center(
        child: myCard,
      ),
    );
  }
}
