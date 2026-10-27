import 'package:flutter/material.dart';
import 'modelo_publicacion.dart';
import 'encabezado_publicacion.dart';
import 'contenido_publicacion.dart';
import 'acciones_publicacion.dart';
import 'pie_publicacion.dart';

class TarjetaPublicacion extends StatelessWidget {
  final ModeloPublicacion publicacion;

  const TarjetaPublicacion({super.key, required this.publicacion});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: const Color(0xFF262A30)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EncabezadoPublicacion(
            usuario: publicacion.usuario,
            subtitulo: publicacion.subtitulo,
            tiempo: publicacion.tiempo,
            avatar: publicacion.imagen,
          ),
          ContenidoPublicacion(
            imagen: publicacion.imagen,
            texto: publicacion.textoSobreImagen,
          ),
          AccionesPublicacion(
            comentarios: publicacion.comentarios,
            compartidos: publicacion.compartidos,
            likesIniciales: publicacion.likes,
          ),
          PiePublicacion(
            usuario: publicacion.usuario,
            texto: publicacion.descripcion,
          ),
        ],
      ),
    );
  }
}
