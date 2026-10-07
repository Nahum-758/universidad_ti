import 'package:flutter/material.dart';

// ---------------------------------------------------------------------
// MODELO: describe la información que necesita CADA carrera.
// ---------------------------------------------------------------------
class Carrera {
  final String nombre;
  final IconData icono;    // el ícono hace de "imagen representativa"
  final Color color;
  final String descripcion;

  const Carrera({
    required this.nombre,
    required this.icono,
    required this.color,
    required this.descripcion,
  });
}