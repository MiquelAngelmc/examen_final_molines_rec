// Importacions de classes i packets necesaris per s'aplicació

// Panta home
import 'package:examen_final_molines_rec/screens/home_screen.dart';

// Material
import 'package:flutter/material.dart';

// SharedPreferences per guardar les credencials
import 'package:shared_preferences/shared_preferences.dart';

// Classe login on es farà el login de l'usuari

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _recuerdame = false;

  @override
  void initState() {
    super.initState();
    _loadCredentials();
  }

  // Utilitzar shared_preferences per carregar les credencials

  Future<void> _loadCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool remember = prefs.getBool('remember_me') ?? false;

    if (remember) {
      setState(() {
        _recuerdame = true;
        _userController.text = prefs.getString('username') ?? '';
        _passController.text = prefs.getString('password') ?? '';
      });
    }
  }

  // Utiitzar shared_preferences amb el checkbox

  Future<void> _saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_recuerdame) {
      await prefs.setBool('remember_me', true);
      await prefs.setString('username', _userController.text);
      await prefs.setString('password', _passController.text);
    } else {
      await prefs.setBool('remember_me', false);
      await prefs.remove('username');
      await prefs.remove('password');
    }
  }

  // Anar a la pantalla home després de fer login

  void _login() async {
    if (_userController.text.isNotEmpty && _passController.text.isNotEmpty) {
      await _saveCredentials();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Introdueix usuari i contrasenya")),
      );
    }
  }

  // Dispose dels controladors

  @override
  void dispose() {
    _userController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LOGIN")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _userController,
              decoration: InputDecoration(labelText: "Usuario"),
            ),
            TextField(
              controller: _passController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            Row(
              children: [
                Checkbox(
                  value: _recuerdame,
                  onChanged: (bool? value) {
                    setState(() {
                      _recuerdame = value ?? false;
                    });
                  },
                ),
                Text("RECUERDAME"),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(onPressed: _login, child: Text("INICIAR SESIÓN")),
          ],
        ),
      ),
    );
  }
}
