import 'package:flutter/material.dart';
//import 'package:flutter_repo_guide/helpers/estilos.dart';
import 'package:flutter_repo_guide/widgets/customDrawe.dart';
import 'package:flutter_repo_guide/widgets/myCard_Song.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FilterScreen extends StatefulWidget {
  // filtro de canciones
  //Benja
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<Map<String, dynamic>> valoresFiltrados = [];
  List<String> generos = ['Rock', 'Reggaeton', 'Tango', 'Cumbia', 'All'];
  String generoSeleccionado = 'All';

  @override
  void initState() {
    super.initState();
    actualizarValoresFiltrados('All');
  }

  Future<void> actualizarValoresFiltrados(String nuevoGenero) async {
    final url =
        Uri.parse('http://localhost:8000/api/v1/track/?genre=$nuevoGenero');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);

        if (data != null && data is List<dynamic>) {
          setState(() {
            valoresFiltrados = data.map((song) {
              return {
                'nombre': song['nombre'] ?? '',
                'artistas': (song['artistas'] as List<dynamic>?)
                        ?.map((artist) => artist)
                        .toList() ??
                    [],
                'album': song['album'] ?? '',
                'imagen': song['imagen'] ?? '',
              };
            }).toList();
          });
        }
      } else {
        print(
            'Error al cargar las canciones. Código de estado: ${response.statusCode}');
      }
    } catch (error) {
      print('Error al cargar las canciones: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtro Canciones'),
        backgroundColor: Colors.green,
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: generoSeleccionado,
              items: generos.map((String genero) {
                return DropdownMenuItem<String>(
                  value: genero,
                  child: Text(genero),
                );
              }).toList(),
              onChanged: (String? nuevoGenero) {
                if (nuevoGenero != null) {
                  generoSeleccionado = nuevoGenero;
                  actualizarValoresFiltrados(nuevoGenero);
                }
              },
            ),
            SizedBox(height: 20),
            Text('Canciones filtradas: '),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: valoresFiltrados.length,
                itemBuilder: (context, index) {
                  final song = valoresFiltrados[index];
                  return MyCard_Song(
                    titulo: song['nombre'],
                    artista: song['artistas'].join(', '),
                    imagenUrl: song['imagen'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
