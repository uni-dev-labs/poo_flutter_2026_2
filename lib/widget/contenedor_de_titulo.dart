import 'package:flutter/material.dart';
import 'package:prueba_poo/widget/historia_usuario.dart';

class ContenedorDeTitulo extends StatelessWidget {
  final Color color;

  const ContenedorDeTitulo({super.key, required this.color});

  static const List<Map<String, String>> historias = [
    {'nombre': 'camila_sierra21', 'foto': 'https://i.imgur.com/0sijBkE.jpeg'},
    {'nombre': 'nicoooo_sd', 'foto': 'https://i.imgur.com/oi1ZOT5.jpeg'},
    {'nombre': 'karensevillano', 'foto': 'https://i.imgur.com/BbHkV36.jpeg'},
    {'nombre': 'crisshurtado', 'foto': 'https://i.imgur.com/y823XXm.jpeg'},
    {'nombre': 'maluma', 'foto': 'https://i.imgur.com/DL9xq1Z.jpeg'},
    {'nombre': 'issaflow', 'foto': 'https://i.imgur.com/54xNrXf.jpeg'},
    {'nombre': 'alisson.nails', 'foto': 'https://i.imgur.com/MiLG51q.jpeg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (final historia in historias) ...[
              HistoriaUsuario(
                color: color,
                titulo: historia['nombre']!,
                urlImagen: historia['foto'],
              ),
              const SizedBox(width: 12),
            ],
          ],
        ),
      ),
    );
  }
}
