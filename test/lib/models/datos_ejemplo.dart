import 'package:flutter/material.dart';
import 'post.dart';
import 'story.dart';

List<Story> crearHistorias() {
  return [
    Story(
      user: 'tu_historia',
      time: 'hace 1 h',
      text: 'Mi dia en la U',
      icon: Icons.school,
      colors: [Color(0xFF4A00E0), Color(0xFF8E2DE2)],
    ),
    Story(
      user: 'camila_r',
      time: 'hace 2 h',
      text: 'Atardecer en Tunja',
      icon: Icons.wb_twilight,
      colors: [Color(0xFFFF512F), Color(0xFFF09819)],
    ),
    Story(
      user: 'juan_dev',
      time: 'hace 3 h',
      text: 'Programando en Flutter',
      icon: Icons.code,
      colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
    ),
    Story(
      user: 'sofi.art',
      time: 'hace 4 h',
      text: 'Nuevo dibujo listo',
      icon: Icons.brush,
      colors: [Color(0xFFFF1685), Color(0xFF9C00FF)],
    ),
    Story(
      user: 'andres_fit',
      time: 'hace 5 h',
      text: 'Rutina de hoy',
      icon: Icons.fitness_center,
      colors: [Color(0xFF11998E), Color(0xFF38EF7D)],
    ),
    Story(
      user: 'cafe_central',
      time: 'hace 7 h',
      text: 'Cafe recien hecho',
      icon: Icons.coffee,
      colors: [Color(0xFF603813), Color(0xFFB29F94)],
    ),
    Story(
      user: 'musica_24',
      time: 'hace 9 h',
      text: 'Playlist de la tarde',
      icon: Icons.music_note,
      colors: [Color(0xFF232526), Color(0xFFFF1685)],
    ),
  ];
}

List<Post> crearPosts() {
  return [
    Post(
      user: 'camila_r',
      verified: true,
      caption: 'Atardeceres que valen la pena',
      time: 'hace 2 horas',
      icon: Icons.wb_twilight,
      colors: [Color(0xFFFF512F), Color(0xFFF09819)],
      imageUrl:'https://media.tenor.com/Cc2aw2DtNnEAAAAM/exitoso-detectado-exit.gif' ,
      likes: 124,
      comments: ['Hermosa foto!', 'Quiero ir ahi'],
    ),
    Post(
      user: 'juan_dev',
      caption: 'Aprendiendo POO con Flutter #dart',
      time: 'hace 4 horas',
      icon: Icons.code,
      colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
      imageUrl:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMr5Ed2A5gdYyvxX-ETu5aezcLgJptaXyInUb_R9ukTAk-lXPPMpk2DDA&s=10' ,
      likes: 89,
      comments: ['Buen avance'],
    ),
    Post(
      user: 'sofi.art',
      verified: true,
      caption: 'Nuevo trabajo terminado',
      time: 'hace 6 horas',
      icon: Icons.brush,
      colors: [Color(0xFFFF1685), Color(0xFF9C00FF)],
      imageUrl:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXh2_c4In5eJvjAAG5v8yPBqMSGtS4Llut1otFZBGDty7dOO015iGLQ0g&s=10' ,
      likes: 342,
    ),
    Post(
      user: 'andres_fit',
      caption: 'Sin excusas, a entrenar',
      time: 'hace 8 horas',
      icon: Icons.fitness_center,
      colors: [Color(0xFF11998E), Color(0xFF38EF7D)],
      imageUrl:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRULsC71WVxLrL5S149xaJ2iPskATnyvp206oSCR9n2ZPQlUZQddo3oae7k&s=10' ,
      likes: 57,
      comments: ['Vamos!', 'Crack'],
    ),
    Post(
      user: 'cafe_central',
      verified: true,
      caption: 'El mejor cafe de la ciudad',
      time: 'hace 1 dia',
      icon: Icons.coffee,
      colors: [Color(0xFF603813), Color(0xFFB29F94)],
      imageUrl:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRh3YYa1iqI49cns1Fw-zcJZLajb-T6lgiYyaHFD68KphTrlZOL6R1e5Fx5&s=10' ,
      likes: 210,
    ),
  ];
}
