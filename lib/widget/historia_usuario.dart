import 'package:flutter/material.dart';

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
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 3),
            ),
            child: ClipOval(
              child: urlImagen != null
                  ? Image.network(
                      urlImagen!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => _inicial(),
                    )
                  : _inicial(),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            titulo,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _inicial() {
    return Container(
      color: Colors.grey[300],
      alignment: Alignment.center,
      child: Text(
        titulo.isNotEmpty ? titulo[0].toUpperCase() : '?',
        style: const TextStyle(color: Colors.black, fontSize: 24),
      ),
    );
  }
}