import 'package:flutter/material.dart';
import 'package:prueba_poo/widget/historia_usuario.dart';

class ContenedorDeTitulo extends StatelessWidget {
  final Color color;

  const ContenedorDeTitulo({super.key, required this.color});
  static const List<Map<String, String>> historias = [
    {'nombre': 'paula_perezz_0', 'foto': 'https://images.unsplash.com/photo-1529156069898-49953e39b3ac?auto=format&fit=crop&w=300&h=300&q=80'},
    {'nombre': 'kx_vin', 'foto': 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?auto=format&fit=crop&w=300&h=300&q=80'},
    {'nombre': 'lexeerk', 'foto': 'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=300&h=300&q=80'},
    {'nombre': 'pupis_123', 'foto': 'https://images.unsplash.com/photo-1512621776951-a57141f2eeb?auto=format&fit=crop&w=300&h=300&q=80'},
    {'nombre': 'valentina.sierraa', 'foto': 'https://images.unsplash.com/photo-1529156069898-49953e39b3ac?auto=format&fit=crop&w=300&h=300&q=80'},
    {'nombre': 'paulssss_a', 'foto': 'https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=300&h=300&q=80'},
    {'nombre': 'itskarolv._', 'foto': 'https://images.unsplash.com/photo-1518770660439-4636190af475?auto=format&fit=crop&w=300&h=300&q=80'},
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
