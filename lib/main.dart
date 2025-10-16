import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/list_screen.dart';
import 'screens/about.dart';

void main() {
  runApp(const StudyFlutterApp());
}

class StudyFlutterApp extends StatelessWidget {
  const StudyFlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
      routes: {
        ListScreen.routeName: (_) => const ListScreen(),
        AboutScreen.routeName: (_) => const AboutScreen(),
      },
    );
  }
}
