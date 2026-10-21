import 'package:flutter/material.dart';
import 'package:prueba_poo/widget/historia_usuario.dart';

class ContenedorDeTitulo extends StatelessWidget {
  final Color color;

  const ContenedorDeTitulo({
    super.key,
    required this.color,
  });

  static const List<Map<String, String>> historias = [
    {
      'nombre': 'camila',
      'foto':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReI-vtE0f8CEynSImBO8CPsjJhKhfH-AYJX9YBmQ2py3yfqgTG1aOm8GX6&s=10',
    },
    {'nombre': 'hola chicos'},
    {'nombre': 'diani.11', 'foto': 'https://picsum.photos/seed/diani/200'},
    {'nombre': 'natinatt11', 'foto': 'https://picsum.photos/seed/natinatt/200'},
    {'nombre': 'nana_ram', 'foto': 'https://picsum.photos/seed/nana/200'},
    {'nombre': 'santoto_st', 'foto': 'https://picsum.photos/seed/santoto/200'},
    {'nombre': 'nico.d02', 'foto': 'https://picsum.photos/seed/nico/200'},
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