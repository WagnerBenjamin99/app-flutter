import 'package:flutter/material.dart';

class CardAlbumTracks extends StatelessWidget {
  final String titulo;
  final String album;
  final String duracion;
  final String imagenUrl;

  CardAlbumTracks({
    required this.titulo,
    required this.album,
    required this.imagenUrl,
    required this.duracion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35)),
              child: Image.network(
                imagenUrl,
                height: 250,
                width: 250,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    titulo,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    album,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    duracion,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      //  reproduccion de la canción
                    },
                    child: Text('Reproducir'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
