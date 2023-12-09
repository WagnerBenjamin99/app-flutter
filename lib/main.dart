import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/helpers/preferences.dart';
import 'package:flutter_repo_guide/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // TODO: Comentar
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.initShared();

  // runApp(const MyApp());
  runApp(MyApp());
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
          'home': (context) => const HomeScreen(),
        });
  }
}
