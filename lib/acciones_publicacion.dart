import 'package:flutter/material.dart';
import 'boton_me_gusta.dart';

class AccionesPublicacion extends StatelessWidget {
  final int comentarios;
  final int compartidos;
  final int likesIniciales;

  const AccionesPublicacion({
    super.key,
    required this.comentarios,
    required this.compartidos,
    required this.likesIniciales,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 4),
      child: Row(
        children: [
          BotonMeGusta(likesIniciales: likesIniciales),
          const SizedBox(width: 18),
          const Icon(Icons.chat_bubble_outline, size: 26),
          const SizedBox(width: 6),
          Text('$comentarios'),
          const SizedBox(width: 18),
          const Icon(Icons.repeat, size: 26),
          const SizedBox(width: 6),
          Text('$compartidos'),
          const SizedBox(width: 18),
          const Icon(Icons.send_outlined, size: 26),
          const Spacer(),
          const Icon(Icons.bookmark_border, size: 28),
        ],
      ),
    );
  }
}
