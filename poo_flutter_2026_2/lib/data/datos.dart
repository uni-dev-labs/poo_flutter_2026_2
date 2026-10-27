// Datos de ejemplo para el feed (no hay backend: todo es simulado).

String foto(String semilla, {int w = 600, int h = 600}) =>
    'https://picsum.photos/seed/$semilla/$w/$h';

String avatar(String semilla) => 'https://i.pravatar.cc/150?u=$semilla';

/// Foto de "camila" que ya tenías en tu proyecto.
const String urlCamila =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReI-vtE0f8CEynSImBO8CPsjJhKhfH-AYJX9YBmQ2py3yfqgTG1aOm8GX6&s=10';

class Historia {
  final String usuario;
  final String? urlImagen;
  const Historia(this.usuario, this.urlImagen);
}

class Publicacion {
  final String usuario;
  final String? ubicacion;
  final String urlAvatar;

  /// Una o varias fotos. Si es dinámica se muestran como carrusel (1 foto a la vez).
  final List<String> urlFotos;

  /// true  -> se puede dar corazón y tiene efecto carrusel.
  /// false -> publicación estática (solo se ve).
  final bool dinamico;
  final int meGusta;
  final String descripcion;
  final int comentarios;
  final String tiempo;
  const Publicacion({
    required this.usuario,
    this.ubicacion,
    required this.urlAvatar,
    required this.urlFotos,
    this.dinamico = false,
    required this.meGusta,
    required this.descripcion,
    required this.comentarios,
    required this.tiempo,
  });

  String get urlFoto => urlFotos.first;
}

class ReelDato {
  final String usuario;
  final String urlAvatar;
  final String urlPortada;
  final String descripcion;
  final String audio;
  final int meGusta;
  final int comentarios;
  final String vistas;
  const ReelDato({
    required this.usuario,
    required this.urlAvatar,
    required this.urlPortada,
    required this.descripcion,
    required this.audio,
    required this.meGusta,
    required this.comentarios,
    required this.vistas,
  });
}

final List<Historia> historias = [
  const Historia('camila', urlCamila),
  for (int i = 0; i < 7; i++) const Historia('hola chicos', null),
];

final List<Publicacion> publicaciones = [
  Publicacion(
    usuario: 'camila',
    ubicacion: 'Bogotá, Colombia',
    urlAvatar: urlCamila,
    urlFotos: [
      foto('bogota1', w: 800, h: 800),
      foto('bogota2', w: 800, h: 800),
      foto('bogota3', w: 800, h: 800),
      foto('bogota4', w: 800, h: 800),
    ],
    dinamico: true,
    meGusta: 1243,
    descripcion: 'Tarde perfecta por la ciudad ☀️',
    comentarios: 48,
    tiempo: 'Hace 2 horas',
  ),
  Publicacion(
    usuario: 'juan',
    ubicacion: 'Cartagena',
    urlAvatar: avatar('juan'),
    urlFotos: [
      foto('cartagena1', w: 800, h: 800),
      foto('cartagena2', w: 800, h: 800),
      foto('cartagena3', w: 800, h: 800),
      foto('cartagena4', w: 800, h: 800),
    ],
    dinamico: true,
    meGusta: 856,
    descripcion: 'Vacaciones con los parceros 🌴🌊',
    comentarios: 22,
    tiempo: 'Hace 5 horas',
  ),
  Publicacion(
    usuario: 'sofia',
    ubicacion: null,
    urlAvatar: avatar('sofia'),
    urlFotos: [
      foto('cafe1', w: 800, h: 800),
      foto('cafe2', w: 800, h: 800),
      foto('cafe3', w: 800, h: 800),
      foto('cafe4', w: 800, h: 800),
    ],
    dinamico: true,
    meGusta: 3210,
    descripcion: 'Café y código, no necesito más ☕💻',
    comentarios: 130,
    tiempo: 'Hace 9 horas',
  ),
  Publicacion(
    usuario: 'andres',
    ubicacion: 'Medellín',
    urlAvatar: avatar('andres'),
    urlFotos: [
      foto('montana1', w: 800, h: 800),
      foto('montana2', w: 800, h: 800),
      foto('montana3', w: 800, h: 800),
      foto('montana4', w: 800, h: 800),
    ],
    dinamico: true,
    meGusta: 502,
    descripcion: 'Domingo de montaña ⛰️',
    comentarios: 9,
    tiempo: 'Hace 1 día',
  ),
  Publicacion(
    usuario: 'valeria',
    ubicacion: 'Tunja',
    urlAvatar: avatar('valeria'),
    urlFotos: [
      foto('plaza1', w: 800, h: 800),
      foto('plaza2', w: 800, h: 800),
      foto('plaza3', w: 800, h: 800),
      foto('plaza4', w: 800, h: 800),
    ],
    dinamico: true,
    meGusta: 978,
    descripcion: 'Plaza de Bolívar de noche 🌙',
    comentarios: 31,
    tiempo: 'Hace 1 día',
  ),
  Publicacion(
    usuario: 'mateo',
    ubicacion: 'Villa de Leyva',
    urlAvatar: avatar('mateo'),
    urlFotos: [
      foto('villa1', w: 800, h: 800),
      foto('villa2', w: 800, h: 800),
      foto('villa3', w: 800, h: 800),
      foto('villa4', w: 800, h: 800),
    ],
    dinamico: true,
    meGusta: 1520,
    descripcion: 'Fin de semana en el pueblo 🏡',
    comentarios: 57,
    tiempo: 'Hace 2 días',
  ),
  Publicacion(
    usuario: 'laura',
    ubicacion: 'Cali',
    urlAvatar: avatar('laura'),
    urlFotos: [
      foto('salsa1', w: 800, h: 800),
      foto('salsa2', w: 800, h: 800),
      foto('salsa3', w: 800, h: 800),
      foto('salsa4', w: 800, h: 800),
    ],
    dinamico: true,
    meGusta: 2210,
    descripcion: 'Noche de salsa 💃🎶',
    comentarios: 96,
    tiempo: 'Hace 2 días',
  ),
  Publicacion(
    usuario: 'david',
    ubicacion: null,
    urlAvatar: avatar('david'),
    urlFotos: [foto('atardecer', w: 800, h: 800)],
    dinamico: false,
    meGusta: 640,
    descripcion: 'Atardecer sin filtro 🌇',
    comentarios: 12,
    tiempo: 'Hace 3 días',
  ),
  Publicacion(
    usuario: 'paula',
    ubicacion: 'Barranquilla',
    urlAvatar: avatar('paula'),
    urlFotos: [foto('carnaval', w: 800, h: 800)],
    dinamico: false,
    meGusta: 1875,
    descripcion: 'Carnaval se vive así 🎭',
    comentarios: 64,
    tiempo: 'Hace 3 días',
  ),
  Publicacion(
    usuario: 'camilo',
    ubicacion: null,
    urlAvatar: avatar('camilo'),
    urlFotos: [foto('moto', w: 800, h: 800)],
    dinamico: false,
    meGusta: 412,
    descripcion: 'Ruta en moto 🏍️',
    comentarios: 7,
    tiempo: 'Hace 4 días',
  ),
  Publicacion(
    usuario: 'daniela',
    ubicacion: 'Santa Marta',
    urlAvatar: avatar('daniela'),
    urlFotos: [foto('playa', w: 800, h: 800)],
    dinamico: false,
    meGusta: 2980,
    descripcion: 'Playa y buena vibra 🏖️',
    comentarios: 101,
    tiempo: 'Hace 4 días',
  ),
  Publicacion(
    usuario: 'felipe',
    ubicacion: null,
    urlAvatar: avatar('felipe'),
    urlFotos: [foto('estudio', w: 800, h: 800)],
    dinamico: false,
    meGusta: 305,
    descripcion: 'Estudiando para el parcial 📚',
    comentarios: 18,
    tiempo: 'Hace 5 días',
  ),
  Publicacion(
    usuario: 'natalia',
    ubicacion: 'Bucaramanga',
    urlAvatar: avatar('natalia'),
    urlFotos: [foto('canon', w: 800, h: 800)],
    dinamico: false,
    meGusta: 1710,
    descripcion: 'Cañón del Chicamocha 🌄',
    comentarios: 45,
    tiempo: 'Hace 5 días',
  ),
  Publicacion(
    usuario: 'sebastian',
    ubicacion: null,
    urlAvatar: avatar('sebastian'),
    urlFotos: [foto('pizza', w: 800, h: 800)],
    dinamico: false,
    meGusta: 890,
    descripcion: 'Pizza casera 🍕',
    comentarios: 26,
    tiempo: 'Hace 6 días',
  ),
  Publicacion(
    usuario: 'isabela',
    ubicacion: 'Pasto',
    urlAvatar: avatar('isabela'),
    urlFotos: [foto('volcan', w: 800, h: 800)],
    dinamico: false,
    meGusta: 1330,
    descripcion: 'Vista al Galeras 🌋',
    comentarios: 39,
    tiempo: 'Hace 1 semana',
  ),
];

final List<ReelDato> reels = [
  ReelDato(
    usuario: 'valeria',
    urlAvatar: avatar('valeria'),
    urlPortada: foto('reel1', w: 540, h: 960),
    descripcion: 'Bailando en la sala 💃 #baile #viral',
    audio: 'Audio original · valeria',
    meGusta: 15200,
    comentarios: 320,
    vistas: '120 mil',
  ),
  ReelDato(
    usuario: 'mateo',
    urlAvatar: avatar('mateo'),
    urlPortada: foto('reel2', w: 540, h: 960),
    descripcion: 'Receta rápida en 30 segundos 🍝',
    audio: 'Audio original · mateo',
    meGusta: 8700,
    comentarios: 145,
    vistas: '64 mil',
  ),
  ReelDato(
    usuario: 'laura',
    urlAvatar: avatar('laura'),
    urlPortada: foto('reel3', w: 540, h: 960),
    descripcion: 'Rutina de entrenamiento 💪',
    audio: 'Gym Mix · DJ Flow',
    meGusta: 4300,
    comentarios: 88,
    vistas: '31 mil',
  ),
  ReelDato(
    usuario: 'david',
    urlAvatar: avatar('david'),
    urlPortada: foto('reel4', w: 540, h: 960),
    descripcion: 'Atardecer desde el techo 🌇',
    audio: 'Audio original · david',
    meGusta: 22100,
    comentarios: 410,
    vistas: '250 mil',
  ),
];

String formatoNumero(int n) {
  if (n >= 1000000) return '${(n / 1000000).toStringAsFixed(1)} M';
  if (n >= 10000) return '${(n / 1000).toStringAsFixed(1)} mil';
  if (n >= 1000) {
    final s = n.toString();
    return '${s.substring(0, s.length - 3)}.${s.substring(s.length - 3)}';
  }
  return '$n';
}
