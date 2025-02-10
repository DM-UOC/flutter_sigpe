import 'package:flutter/material.dart';
import 'package:flutter_sigpe/models/comun/usuario_login.dart';
import 'package:provider/provider.dart';

import 'package:flutter_sigpe/interfaces/comun/login_interno.abstract.dart';

import 'package:flutter_sigpe/providers/seguridad/seguridad_provider.dart';

import 'package:flutter_sigpe/views/comun/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _usuarioController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> _loginUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      // * consulta...
      final response = await context
          .read<SeguridadProvider>()
          .loginUsuarioInterno(UserLogin(
              usuario: _usuarioController.text.trim(),
              password: _passwordController.text.trim()));
      // * todo ok...
      // * navega al home...
      if (response) _navigateToHome();
    } catch (e) {
      _showError('Error: ${e.toString()} ');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              // * Icono o logo
              FlutterLogo(size: 100),
              const SizedBox(height: 40),
              // * Campo de usuario o correo electrónico...
              TextFormField(
                controller: _usuarioController,
                keyboardType:
                    TextInputType.text, // *TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  prefixIcon: const Icon(Icons.verified_user),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese el usuario';
                  }
                  // * ** if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  // * **     .hasMatch(value)) {
                  // * **   return 'Ingrese un correo electrónico válido';
                  // * ** }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // * Campo de contraseña
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su contraseña';
                  }
                  if (value.length < 14) {
                    return 'La contraseña debe tener al menos 14 caracteres';
                  }
                  // * todo correcto...
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // * Botón de olvidó la contraseña
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Navegar a pantalla de recuperación de contraseña
                  },
                  child: const Text('¿Olvidaste tu contraseña?'),
                ),
              ),
              const SizedBox(height: 20),
              // * Botón de inicio de sesión
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _loginUser,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.amber,
                        )
                      : const Text('Iniciar Sesión'),
                ),
              ),
              const SizedBox(height: 30),
              // Opción de registro
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('¿No tienes cuenta?'),
                  TextButton(
                    onPressed: () {
                      // Navegar a pantalla de registro
                    },
                    child: const Text('Regístrate aquí'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
