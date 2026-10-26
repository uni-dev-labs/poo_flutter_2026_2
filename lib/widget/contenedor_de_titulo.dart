import 'package:flutter/material.dart';
import 'package:prueba_poo/widget/historia_usuario.dart';

class ContenedorDeTitulo extends StatelessWidget {
  final Color color;

  const ContenedorDeTitulo({super.key, required this.color});
  static const List<Map<String, String>> historias = [
    {'nombre': '_elkinr_07', 'foto': 'https://i.imgur.com/LQN5oyx.jpeg'},
    {'nombre': '_isisb3lla', 'foto': 'https://i.imgur.com/jrVo8hN.jpeg'},
    {'nombre': 'dary.mon.mnz', 'foto': 'https://i.imgur.com/VYD4eX7.jpeg'},
    {'nombre': 'stiven.cano_0', 'foto': 'https://i.imgur.com/z4bKtr5.jpeg'},
    {'nombre': 'its_juanita', 'foto': 'https://i.imgur.com/ShUgT3G.jpeg'},
    {'nombre': 'michel._.jaramillo', 'foto': 'https://i.imgur.com/92JDXDP.jpeg'},
    {'nombre': 'valeriaortiz4708', 'foto': 'https://i.imgur.com/iGLjVyR.jpeg'},
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
