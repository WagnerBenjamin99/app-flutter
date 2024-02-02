import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/helpers/estilos.dart';
import 'package:flutter_repo_guide/screens/albumesVistas/lista_albumes_screen.dart';
import 'package:flutter_repo_guide/widgets/customDrawe.dart';

class AlbumsAzar extends StatefulWidget {
  const AlbumsAzar({Key? key}) : super(key: key);

  @override
  _AlbumsAzarState createState() => _AlbumsAzarState();
}

class _AlbumsAzarState extends State<AlbumsAzar> {
  int contador = 5;

  void increment() {
    setState(() {
      if (contador < 10) {
        contador++;
      }
    });
  }

  void decrement() {
    setState(() {
      if (contador > 1) {
        contador--;
      }
    });
  }

  void traer() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListaAlbumes(cantidad: contador),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RECOMENDACIONES'),
        backgroundColor: Estilos.greenOscuro,
      ),
      drawer: CustomDrawer(),
      backgroundColor: Estilos.greenClarito,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "No sabes que escuchar?",
              textAlign: TextAlign.center,
              style: Estilos.titleTextStyle,
            ),
            const SizedBox(height: 10),
            const Text(
              "Elegi una cantidad de 0 a 10, y te recomendaremos esa cantidad de albumes al azar.",
              textAlign: TextAlign.center,
              style: Estilos.descriptionTextStyle,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: decrement,
                  backgroundColor: Estilos.greenOscuro,
                  child: const Icon(Icons.exposure_minus_1_outlined),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    '$contador',
                    style: const TextStyle(fontSize: 40),
                  ),
                ),
                FloatingActionButton(
                  onPressed: increment,
                  backgroundColor: Estilos.greenOscuro,
                  child: const Icon(Icons.plus_one),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: traer,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Estilos.greenOscuro),
              child: const Text('Traer'),
            ),
          ],
        ),
      ),
    );
  }
}
