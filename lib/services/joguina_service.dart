// Importar http (Per fer crud) i joguina per utilitzar el seu model

import 'dart:convert';
import 'package:examen_final_molines_rec/models/joguina.dart';
import 'package:http/http.dart' as http;

// Classe que conté els serveis per a les joguines

class JoguinaService {
  // URL base de l'API
  static const String baseUrl =
      'https://ca761b9d5ea08abbf0fc.free.beeceptor.com';
  //https://ca761b9d5ea08abbf0fc.free.beeceptor.com/api/joguina/
  // Obtenir totes les joguines

  static Future<List<Joguina>> getJoguines() async {
    final response = await http.get(Uri.parse('$baseUrl/api/joguina/'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Joguina> joguines = [];
      joguines =
          data
              .map((e) => Joguina.fromJson(e))
              .toList(); // no posar joguines, sino Joguina
      return joguines;
    } else {
      throw Exception('JUGUETES NO ENCONTRADOS');
    }
  }

  // Crear una nova joguina

  static Future<Joguina> createJoguina(Joguina joguina) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/joguines.json'),
      body: json.encode(joguina.toJson()),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = json.decode(response.body);
      return Joguina(
        id: joguina.id,
        nom: joguina.nom,
        descripcio: joguina.descripcio,
        model: joguina.model,
        marca: joguina.marca,
        foto: joguina.foto,
      );
    } else {
      throw Exception('JUGUETE NO CREADO');
    }
  }

  // ELIMINAR JOGUINA

  static Future<void> deleteJoguina(int id) async {
    final response = await http.delete(Uri.parse(baseUrl + '/api/joguina/$id'));
    if (response.statusCode != 200) {
      throw Exception('ELIMINAR JOGUINA ERROR');
    }
  }
}
