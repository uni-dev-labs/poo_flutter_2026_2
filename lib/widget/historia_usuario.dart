import 'package:flutter/material.dart';
import 'package:prueba_poo/widget/imagen_usuario.dart';

class HistoriaUsuario extends StatelessWidget {
  final Color color;
  final String titulo;
  final String? urlImagen;

  const HistoriaUsuario({
    super.key,
    required this.color,
    required this.titulo,
    this.urlImagen,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImagenUsuario(urlImagen: urlImagen),
        Text(
          titulo,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}