import 'package:flutter/material.dart';

class ContenidoPublicacion extends StatelessWidget {
  final String imagen;
  final String texto;

  const ContenidoPublicacion({
    super.key,
    required this.imagen,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(imagen, fit: BoxFit.cover, cacheWidth: 940),
          Container(color: Colors.black26),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                texto,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  shadows: [Shadow(blurRadius: 6, color: Colors.black)],
                ),
              ),
            ),
          ),
          Positioned(
            right: 12,
            bottom: 12,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.volume_off, size: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
