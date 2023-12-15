import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/helpers/estilos.dart';
import 'package:flutter_repo_guide/screens/itemFilter_screen.dart';
import 'package:flutter_repo_guide/screens/itemList_screen.dart';
import 'package:flutter_repo_guide/widgets/customDrawe.dart';
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
        backgroundColor: Estilos.greenOscuro,

      ),
      drawer: CustomDrawer(),
      body: Center(
        child: myCard,
      ),
    );
  }
}
