import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/helpers/preferences.dart';
import 'package:flutter_repo_guide/screens/item_screen.dart';

void main() async {
  // TODO: Comentar
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.initShared();

  // runApp(const MyApp());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Demo',
        // theme: Preferences.darkmode ? ThemeData.dark() : ThemeData.light(),

        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (context) => ItemScreen(),
        });
  }
}
