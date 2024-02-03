import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String nombre;
  final dynamic generoCantidad;
  final String imgURL;

  const CustomCard({
    super.key,
    required this.nombre,
    required this.generoCantidad,
    required this.imgURL,
  });

  @override
  Widget build(BuildContext context) {
    String label = generoCantidad is int ? 'Cantidad de canciones' : 'Genero';

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imgURL,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Nombre: $nombre",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$label: $generoCantidad',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
