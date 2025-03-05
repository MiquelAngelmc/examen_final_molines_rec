// Importa els paquets necessaris

import 'package:examen_final_molines_rec/models/joguina.dart';
import 'package:examen_final_molines_rec/screens/add_joguina.dart';
import 'package:examen_final_molines_rec/screens/joguina_detail_screen.dart';
import 'package:examen_final_molines_rec/services/joguina_service.dart';
import 'package:flutter/material.dart';

// Classe que mostra la llista de joguines

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Joguina>> _joguinesFuture;

  @override
  // Inicialitza la llista de joguines
  void initState() {
    super.initState();
    _joguinesFuture = JoguinaService.getJoguines();
  }

  // Metode que refresca
  void _refreshJoguines() {
    setState(() {
      _joguinesFuture = JoguinaService.getJoguines();
    });
  }

  // Metode que elimina
  void _deleteJoguina(int id) async {
    await JoguinaService.deleteJoguina(id);
    _refreshJoguines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JUGUETERÍA"),

        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewUserScreen()),
              );
              _refreshJoguines();
            },
          ),
        ],
      ),

      // Llista de joguines
      body: FutureBuilder<List<Joguina>>(
        future: _joguinesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          else if (snapshot.hasError)
            return Center(child: Text("Error: ${snapshot.error}"));
          else if (!snapshot.hasData || snapshot.data!.isEmpty)
            return Center(child: Text("ESPERAR A JUGUETES."));
          else {
            final joguines = snapshot.data!;
            return ListView.builder(
              itemCount: joguines.length,
              itemBuilder: (context, index) {
                final joguina = joguines[index];
                return ListTile(
                  title: Text(joguina.nom),

                  onTap: () {
                    // Després de pitjar es mourà a la pantalla de detall

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => JoguinaDetailScreen(joguina: joguina),
                      ),
                    );
                  },

                  // Botó per eliminar
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: const Color.fromARGB(255, 57, 13, 9),
                    ),
                    onPressed: () {
                      _deleteJoguina(joguina.id);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
