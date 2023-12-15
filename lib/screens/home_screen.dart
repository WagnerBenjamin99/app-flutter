import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/helpers/estilos.dart';
import 'package:flutter_repo_guide/material.dart/barradenavegacion.dart';
import 'package:flutter_repo_guide/widgets/customDrawe.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My-Spotify",
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Estilos.greenOscuro,
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: CustomDrawer(),
      body: _buildBody(_selectedIndex),
      bottomNavigationBar:
          barradenavegacion(context, _selectedIndex, (int index) {
        setState(() {
          _selectedIndex = index;
        });
      }),
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/imageppal.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Text(
                  'INTEGRANTES : Antonio Del Greco Diego, Caba Emilce , Dupont Matias, Wagner Benjamin ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );

      case 1:
        return CustomDrawer();
      case 2:
        return Placeholder();
      default:
        return const Center(
          child: Text('Página no encontrada'),
        );
    }
  }
}
