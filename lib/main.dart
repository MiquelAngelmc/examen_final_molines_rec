// Importacions de classes i packets necesaris per s'aplicació

import 'package:examen_final_molines_rec/screens/login_screen.dart';

import 'package:flutter/material.dart';

// Main on s'inicialitzará l'aplicació i es cridarà la pantalla de login
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Títol de l'aplicació
      title: 'Examen Final Miquel Àngel Molines Colom',
      theme: ThemeData(primarySwatch: Colors.green),
      // Ruta a pantalla de login on està el formulari
      home: LoginScreen(),
    );
  }
}
