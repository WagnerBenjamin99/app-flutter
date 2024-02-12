import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/helpers/estilos.dart';
import 'package:flutter_repo_guide/widgets/customDrawe.dart';
import 'package:flutter_repo_guide/widgets/custom_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListaAlbumes extends StatefulWidget {
  //Diego
  final int cantidad;

  const ListaAlbumes({Key? key, required this.cantidad}) : super(key: key);

  @override
  _ListaAlbumesState createState() => _ListaAlbumesState();
}

class _ListaAlbumesState extends State<ListaAlbumes> {
  List<Map<String, dynamic>> albums = [];

  @override
  void initState() {
    super.initState();
    _fetchAlbumsAzarData();
  }

  Future<void> _fetchAlbumsAzarData() async {
    try {
      final response = await http
          .get(Uri.parse('http://localhost:8000/api/v1/albums-actuales'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        setState(() {
          albums = data.map((album) {
            return {
              'nombre': album["name"],
              'cantidadCanciones': album['total_tracks'],
              'albumURL': album['images'][0]['url'],
            };
          }).toList();

          // Mezcla aleatoriamente los álbumes
          albums.shuffle();
        });
      } else {
        throw Exception('Fallo en leer los datos de la API.');
      }
    } catch (error) {
      throw Exception('Fallo en leer los datos de la API.');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> albumesWidgets = List.generate(
      widget.cantidad,
      (index) {
        if (index < albums.length) {
          return CustomCard(
            nombre: albums[index]['nombre'] ?? '',
            generoCantidad: albums[index]['cantidadCanciones'] ?? '',
            imgURL: albums[index]['albumURL'] ?? '',
          );
        } else {
          return Container();
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.cantidad} ALBUMES RECOMENDADOS'),
        backgroundColor: Estilos.greenOscuro,
      ),
      backgroundColor: Estilos.greenClarito,
      body: ListView(
        children: albumesWidgets,
      ),
    );
  }
}
