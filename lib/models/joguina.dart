// HE TENGUT PROBLEMES QUAN AFEGESC REGLES A L'API
// Exemple de JSON:

/*
[
    {
        "id": 1,
        "nom": "Terreneitor",
        "descripcio": "Todoterreno",
        "model": "232",
        "marca": "Corte"
        "foto": "https://www.bing.com/ck/a?!&&p=9b5a47b88b82391ae4aafcd3e231ea1f647e2ca7f42f4e52e01d17659c35dc5cJmltdHM9MTc0MDM1NTIwMA&ptn=3&ver=2&hsh=4&fclid=302d017e-913e-658d-2081-154690386420&u=a1L2ltYWdlcy9zZWFyY2g_cT1pbWdhdGdlcyZGT1JNPUlRRlJCQSZpZD1BMDY0OEZCOTYxNjNERkM0MDVGNjIwQTFEMzA3M0UzOTg4MTY4NzUy&ntb=1",

    }
]
*/

//Classe Joguina on mapetja la informació de la base de dades.

class Joguina {
  // El seus atributs seràn id, nom, descripcio, foto, model i marca.

  final int id;
  final String nom;
  final String descripcio;
  final String model;
  final String marca;
  final String foto;

  // Constructor de la classe Joguina

  Joguina({
    required this.id,
    required this.nom,
    required this.descripcio,
    required this.model,
    required this.marca,
    required this.foto,
  });

  // Aquest mètode crea una joguina a partir d'un mapa. He afegit els valors per defecte per evitar errors si surt null.
  factory Joguina.fromJson(Map<String, dynamic> json) {
    return Joguina(
      id: json['id'] ?? 0,
      nom: json['nom'] ?? '',
      descripcio: json['descripcio'] ?? '',
      model: json['model'] ?? '',
      marca: json['marca'] ?? '',
      foto: json['foto'] ?? '',
    );
  }

  // Aquest mètode converteix una joguina en un mapa(JSON).

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'descripcio': descripcio,
      'model': model,
      'marca': marca,
      'foto': foto,
    };
  }
}
