import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/screens/itemFilter_screen.dart';
import 'package:flutter_repo_guide/screens/itemList_screen.dart';
import 'package:flutter_repo_guide/widgets/customDrawe.dart';
import 'package:flutter_repo_guide/widgets/myCard_Song.dart';
import 'package:flutter_repo_guide/widgets/myCard_artist.dart';

class ItemScreen extends StatelessWidget {
  final MyCard_Artist myCard = MyCard_Artist(
    nombre: 'Gustavo Cerati',
    generos: ['rock', 'pop'],
    popularidad: '89',
    imagenUrl: 'https://fotos.perfil.com/2022/08/11/gustavo-cerati-1400969.jpg',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(myCard.nombre),
        backgroundColor: Color.fromRGBO(33, 134, 18, 0.992),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: myCard,
      ),
    );
  }
}
