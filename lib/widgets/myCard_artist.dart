import 'package:flutter/material.dart';

class MyCard_Artist extends StatelessWidget {
  final String nombre;
  final String popularidad;
  final List<String> generos;
  final String imagenUrl;

  MyCard_Artist({
    required this.nombre,
    required this.popularidad,
    required this.generos,
    required this.imagenUrl,
  });

  @override
  Widget build(BuildContext context) {
    String generosConcat = generos.join(' - ');

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 350,
      ),
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 200,
                maxHeight: 250,
              ),
              child: Image(
                image: NetworkImage(imagenUrl),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey,
                    child: Center(
                      child: Icon(Icons.error),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nombre,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Popularidad: $popularidad',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Géneros: $generosConcat',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
