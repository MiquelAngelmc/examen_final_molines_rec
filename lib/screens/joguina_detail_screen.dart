// Importar model joguina
import 'package:examen_final_molines_rec/models/joguina.dart';
import 'package:flutter/material.dart';

// Classe que mostra els atributs d'una joguina

class JoguinaDetailScreen extends StatelessWidget {
  // Instància de la joguina

  final Joguina joguina;

  const JoguinaDetailScreen({required this.joguina});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(joguina.nom)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                joguina.foto,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(
                "Identificador: ${joguina.id}",
                style: TextStyle(fontSize: 20),
              ),
              Text("Nombre: ${joguina.nom}", style: TextStyle(fontSize: 20)),
              Text(
                "Descripción breve: ${joguina.descripcio}",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Modelo juguete:: ${joguina.model}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Marca juguete: ${joguina.marca}",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
