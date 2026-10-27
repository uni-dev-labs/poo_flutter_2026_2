import 'package:flutter/material.dart';
import 'package:prueba_poo/widget/historia_usuario.dart';

class ContenedorDeTitulo extends StatelessWidget {
  final Color color;

  const ContenedorDeTitulo({super.key, required this.color});

  static const List<Map<String, String>> historias = [
    {'nombre': 'tina_g', 'foto': 'https://i.imgur.com/aFtxD7Y.jpeg'},
    {'nombre': 'andre.perez', 'foto': 'https://i.pravatar.cc/200?img=11'},
    {'nombre': 'isa_.0', 'foto': 'https://i.pravatar.cc/200?img=14'},
    {'nombre': 'sof__', 'foto': 'https://i.imgur.com/fTEbPG0.jpeg'},
    {'nombre': 'mateo.rincon', 'foto': 'https://i.imgur.com/BLZHwCk.jpeg'},
    {'nombre': 'junior_beltran', 'foto': 'https://i.imgur.com/as721Ev.jpeg'},
    {'nombre': 'cami--moreno', 'foto': 'https://i.pravatar.cc/200?img=59'},
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
