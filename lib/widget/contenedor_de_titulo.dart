import 'package:flutter/material.dart';
import 'package:prueba_poo/widget/Historia_usuario.dart';

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
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HistoriaUsuario(color: color, titulo: 'camila', urlImagen: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReI-vtE0f8CEynSImBO8CPsjJhKhfH-AYJX9YBmQ2py3yfqgTG1aOm8GX6&s=10'),
          HistoriaUsuario(color: color, titulo: titulo),
          HistoriaUsuario(color: color, titulo: titulo),
          HistoriaUsuario(color: color, titulo: titulo),
          HistoriaUsuario(color: color, titulo: titulo),
          HistoriaUsuario(color: color, titulo: titulo),
        ],
      ),
    );
  }
}
