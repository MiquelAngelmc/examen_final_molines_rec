// Aquest fitxer és el que es mostra quan es vol afegir una joguina nova

// S'importen els paquets necessaris. Model i serveis de joguina i després material.dart
import 'package:examen_final_molines_rec/models/joguina.dart';
import 'package:examen_final_molines_rec/services/joguina_service.dart';
import 'package:flutter/material.dart';

// Classe que crea una nova joguina
class NewUserScreen extends StatefulWidget {
  @override
  _NewUserScreenState createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _nomController = TextEditingController();
  final _descripcioController = TextEditingController();
  final _modelController = TextEditingController();
  final _marcaController = TextEditingController();
  final _fotoController = TextEditingController();

  bool _isLoading = false;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      Joguina novaJoguina = Joguina(
        id: int.parse(_idController.text),
        nom: _nomController.text,
        descripcio: _descripcioController.text,
        model: _modelController.text,
        marca: _marcaController.text,
        foto: _fotoController.text,
      );
      try {
        await JoguinaService.createJoguina(novaJoguina);

        // Anar cap enrere

        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("JUGUETE NO CREADO: $e")));
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _idController.dispose();
    _nomController.dispose();
    _descripcioController.dispose();
    _modelController.dispose();
    _marcaController.dispose();
    _fotoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AÑADE JUGUETE")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      TextFormField(
                        controller: _idController,
                        decoration: InputDecoration(labelText: "ID"),
                        validator:
                            (value) => value!.isEmpty ? "COMPLETA EL ID" : null,
                      ),
                      TextFormField(
                        controller: _nomController,
                        decoration: InputDecoration(labelText: "Nom"),
                        validator:
                            (value) =>
                                value!.isEmpty ? "COMPLETA EL NOMBRE" : null,
                      ),
                      TextFormField(
                        controller: _descripcioController,
                        decoration: InputDecoration(labelText: "Descripcio"),
                        validator:
                            (value) =>
                                value!.isEmpty
                                    ? "COMPLETA LA DESCRIPCIó"
                                    : null,
                      ),
                      TextFormField(
                        controller: _modelController,
                        decoration: InputDecoration(labelText: "Marca"),
                        validator:
                            (value) =>
                                value!.isEmpty ? "COMPLETA LA MARCA" : null,
                      ),
                      TextFormField(
                        controller: _marcaController,
                        decoration: InputDecoration(labelText: "Model"),
                        validator:
                            (value) =>
                                value!.isEmpty ? "COMPLETA EL MODEL" : null,
                      ),
                      TextFormField(
                        controller: _fotoController,
                        decoration: InputDecoration(
                          labelText: "URL de la imatge",
                        ),
                        validator:
                            (value) =>
                                value!.isEmpty ? "COMPLETA LA URL" : null,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _submit,
                        child: Text("ANADIR JUGUETE"),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}
