import 'package:flutter/material.dart';

class ImagenUsuario extends StatelessWidget {
  final String urlImagen;
  final double alto;

  const ImagenUsuario({
    super.key,
    required this.urlImagen,
    this.alto = 500,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: alto,
      color: Colors.grey[300],
      child: Image.network(
        urlImagen,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progreso) {
          if (progreso == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Icon(Icons.broken_image, size: 48, color: Colors.grey),
          );
        },
      ),
    );
  }
}