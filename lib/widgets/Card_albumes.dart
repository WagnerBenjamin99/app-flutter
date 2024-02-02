import 'package:flutter/material.dart';

class CardAlbumes extends StatelessWidget {
  final String titulo;
  final String artista;
  final String anio;
  final String imagenUrl;

  CardAlbumes({
    required this.titulo,
    required this.artista,
    required this.anio,
    required this.imagenUrl,
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
                  width: 500,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      artista,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      anio,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        //  Acceder al album
                      },
                      child: Text('Ir al Album'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
