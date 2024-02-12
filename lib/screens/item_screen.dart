import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/helpers/estilos.dart';
import 'package:flutter_repo_guide/widgets/customDrawe.dart';
import 'package:flutter_repo_guide/widgets/myCard_artist.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ItemScreen extends StatefulWidget {
  //artista por id Benja

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  final artistId = '1QOmebWGB6FdFtW7Bo3F0W?si=2grpn-epQ6ewXJjA0KjkUg';
  MyCard_Artist? myCard;

  @override
  void initState() {
    super.initState();
    _fetchArtistData();
  }

  Future<void> _fetchArtistData() async {
    final response = await http
        .get(Uri.parse('http://localhost:8000/api/v1/artist/${artistId}'));

    if (response.statusCode == 200) {
      // Parse la respuesta JSON si es exitosa
      Map<String, dynamic> data = json.decode(response.body);

      setState(() {
        myCard = MyCard_Artist(
          nombre: data['name'],
          generos: List<String>.from(data['genres']),
          popularidad: data['popularity'].toString(),
          imagenUrl: data['images'][0]['url'],
        );
      });
    } else {
      // Manejar errores, por ejemplo, mostrando un mensaje al usuario
      print('Error al cargar los datos del artista');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artista'),
        backgroundColor: Estilos.greenOscuro,
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: myCard,
      ),
    );
  }
}
