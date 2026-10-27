import 'modelo_historia.dart';
import 'modelo_publicacion.dart';

const _pub = 'assets/publicaciones/';
const _his = 'assets/historias/';

const historiasDemo = [
  ModeloHistoria(
    usuario: 'juanse.run...',
    avatar: '${_his}historia1.jpg',
    imagenes: ['${_his}historia1.jpg', '${_his}historia2.jpg'],
  ),
  ModeloHistoria(
    usuario: 'yair17yt',
    avatar: '${_his}historia2.jpg',
    imagenes: ['${_his}historia2.jpg', '${_his}historia3.jpg'],
  ),
  ModeloHistoria(
    usuario: '4_ana29',
    avatar: '${_his}historia3.jpg',
    imagenes: ['${_his}historia3.jpg'],
  ),
  ModeloHistoria(
    usuario: 'stiven.rubi...',
    avatar: '${_his}historia4.jpg',
    imagenes: ['${_his}historia4.jpg', '${_his}historia5.jpg'],
  ),
  ModeloHistoria(
    usuario: 'cristiam_g...',
    avatar: '${_his}historia5.jpg',
    imagenes: ['${_his}historia5.jpg', '${_his}historia6.jpg'],
  ),
  ModeloHistoria(
    usuario: 'juanma_10...',
    avatar: '${_his}historia6.jpg',
    imagenes: ['${_his}historia6.jpg'],
  ),
];

const publicacionesDemo = [
  ModeloPublicacion(
    usuario: 'diefordt_dj',
    subtitulo: 'Audio original',
    tiempo: '6 d',
    imagen: '${_pub}publicacion1.jpg',
    textoSobreImagen: 'Pero este verso de DON OMAR????',
    descripcion: 'LA CONOCÍ UNA NOCHE Y LA LLEVÉ A MI CAMA...',
    likes: 1400,
    comentarios: 3,
    compartidos: 145,
  ),
  ModeloPublicacion(
    usuario: 'yair17yt',
    subtitulo: 'Bosque de Nueva Hampshire',
    tiempo: '5 d',
    imagen: '${_pub}publicacion2.jpg',
    textoSobreImagen: 'Este lugar es de otro mundo',
    descripcion: 'Una caminata que no se olvida',
    likes: 892,
    comentarios: 14,
    compartidos: 31,
  ),
  ModeloPublicacion(
    usuario: '4_ana29',
    subtitulo: 'Vista aérea',
    tiempo: '4 d',
    imagen: '${_pub}publicacion3.jpg',
    textoSobreImagen: 'Así se ve el campo desde arriba',
    descripcion: 'Verde, amarillo y mucha paz',
    likes: 2300,
    comentarios: 27,
    compartidos: 88,
  ),
  ModeloPublicacion(
    usuario: 'stiven.rubi...',
    subtitulo: 'Primavera',
    tiempo: '3 d',
    imagen: '${_pub}publicacion4.jpg',
    textoSobreImagen: 'Las flores ya llegaron',
    descripcion: 'Macro con luz de la tarde',
    likes: 640,
    comentarios: 9,
    compartidos: 12,
  ),
  ModeloPublicacion(
    usuario: 'cristiam_g...',
    subtitulo: 'Viaje a la India',
    tiempo: '2 d',
    imagen: '${_pub}publicacion5.jpg',
    textoSobreImagen: 'Arquitectura que quita el aliento',
    descripcion: 'Cada detalle tiene su historia',
    likes: 1100,
    comentarios: 18,
    compartidos: 54,
  ),
  ModeloPublicacion(
    usuario: 'juanma_10...',
    subtitulo: 'Audio original',
    tiempo: '1 d',
    imagen: '${_pub}publicacion6.jpg',
    textoSobreImagen: 'Mood de la semana',
    descripcion: 'Sin filtro y sin pensarlo mucho',
    likes: 315,
    comentarios: 5,
    compartidos: 7,
  ),
  ModeloPublicacion(
    usuario: 'juanse.run...',
    subtitulo: 'Audio original',
    tiempo: '5 h',
    imagen: '${_pub}publicacion7.jpg',
    textoSobreImagen: 'Último del día',
    descripcion: 'Nos vemos mañana',
    likes: 178,
    comentarios: 2,
    compartidos: 3,
  ),
];
