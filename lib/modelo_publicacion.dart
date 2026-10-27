class ModeloPublicacion {
  final String usuario;
  final String subtitulo;
  final String tiempo;
  final String imagen;
  final String textoSobreImagen;
  final String descripcion;
  final int likes;
  final int comentarios;
  final int compartidos;

  const ModeloPublicacion({
    required this.usuario,
    required this.subtitulo,
    required this.tiempo,
    required this.imagen,
    required this.textoSobreImagen,
    required this.descripcion,
    required this.likes,
    required this.comentarios,
    required this.compartidos,
  });
}
