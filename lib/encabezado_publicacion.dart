import 'package:flutter/material.dart';

class EncabezadoPublicacion extends StatelessWidget {
  final String usuario;
  final String subtitulo;
  final String tiempo;
  final String avatar;

  const EncabezadoPublicacion({
    super.key,
    required this.usuario,
    required this.subtitulo,
    required this.tiempo,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundImage: ResizeImage(AssetImage(avatar), width: 100),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: usuario,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' • $tiempo',
                      style: const TextStyle(color: Colors.white54),
                    ),
                  ]),
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  subtitulo,
                  style: const TextStyle(fontSize: 12, color: Colors.white70),
                ),
              ],
            ),
          ),
          const Icon(Icons.more_horiz),
        ],
      ),
    );
  }
}
