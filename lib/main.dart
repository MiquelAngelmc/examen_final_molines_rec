// Main on s'inicialitzará l'aplicació i es cridarà la pantalla de login
import 'package:examen_final_molines_rec/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examen Final Miquel Àngel Molines Colom',
      theme: ThemeData(primarySwatch: Colors.blue),
      // Ruta inicial
      home: LoginScreen(),
    );
  }
}
