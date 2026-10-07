

// ============================================================
// Práctica 3: Universidad TI
// Archivo: lib/main.dart
// ============================================================

// Importa los widgets de Material Design: Scaffold, AppBar, GridView, etc.
import 'package:flutter/material.dart';
import 'package:universidad_ti/views/pantalla_principal.dart';
import 'models/carrera.dart'; // importa el modelo y el arreglo de carreras

// main() es el punto de entrada: Dart siempre empieza a ejecutar aquí.
void main() {
  // runApp() coloca en pantalla el widget raíz de la aplicación.
  runApp(const MyApp());
}

// MyApp configura la app completa: título, tema y cuál es la primera
// pantalla. No cambia mientras la app se ejecuta, por eso es Stateless.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Universidad TI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D47A1)),
        useMaterial3: true,
      ),
      // La primera pantalla que se ve al abrir la app.
      home: const PantallaPrincipal(),
    );
  }
}



// ---------------------------------------------------------------------
// PANTALLA 2: CONTENIDO (detalle de una carrera)
// ---------------------------------------------------------------------
class PantallaContenido extends StatelessWidget {
  // Dato que recibimos de la pantalla principal.
  final Carrera carrera;

  const PantallaContenido({super.key, required this.carrera});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // El AppBar agrega SOLO por defecto la flecha de regreso, porque
      // esta pantalla se abrió con Navigator.push. Al tocarla, Flutter
      // hace exactamente lo mismo que Navigator.pop(context).
      appBar: AppBar(title: const Text('Contenido')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            // Misma imagen representativa que la tarjeta de origen.
            CircleAvatar(
              radius: 60,
              backgroundColor: carrera.color,
              child: Icon(carrera.icono, color: Colors.white, size: 60),
            ),
            const SizedBox(height: 20),
            Text(
              carrera.nombre,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              carrera.descripcion,
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 15, height: 1.4),
            ),
            // Spacer empuja el botón hacia la parte inferior de la pantalla.
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                // pop() cierra esta pantalla y regresa a la anterior.
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Regresar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}