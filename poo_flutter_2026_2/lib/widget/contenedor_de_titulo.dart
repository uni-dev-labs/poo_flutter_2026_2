import 'package:flutter/material.dart';
import 'package:prueba_poo/data/datos.dart';
import 'package:prueba_poo/widget/historia_usuario.dart';

/// Barra de historias (la fila de círculos de arriba en Instagram).
class ContenedorDeTitulo extends StatelessWidget {
  final String titulo;
  final Color color;

  const ContenedorDeTitulo({
    super.key,
    required this.titulo,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 124,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        itemCount: historias.length,
        separatorBuilder: (_, __) => const SizedBox(width: 6),
        itemBuilder: (context, i) {
          final h = historias[i];
          return HistoriaUsuario(
            color: color,
            titulo: i == 0 ? titulo : h.usuario,
            urlImagen: h.urlImagen,
            conAnillo: i != 0,
            conMas: i == 0,
          );
        },
      ),
    );
  }
}
