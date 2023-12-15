import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/helpers/estilos.dart';

class MyCard_Song extends StatelessWidget {
  final String titulo;
  final String artista;
  final String duracion;
  final String imagenUrl;

  MyCard_Song({
    required this.titulo,
    required this.artista,
    required this.duracion,
    required this.imagenUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
        leading: Image(
          image: NetworkImage(imagenUrl),
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 50,
              height: 50,
              color: Colors.grey,
              child: Center(
                child: Icon(Icons.error),
              ),
            );
          },
        ),
        title: Text(
          titulo,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text('$artista - $duracion'),
        trailing: IconButton(
          icon: Icon(Icons.play_circle),
          color: Estilos.greenOscuro,
          onPressed: () {},
        ),
      ),
    );
  }
}
