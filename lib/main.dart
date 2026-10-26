import 'package:flutter/material.dart';
import 'package:prueba_poo/widget/contenedor_de_titulo.dart';
import 'package:prueba_poo/Imagen_usuario.dart';

void main() {
  runApp(const MyApp(title: 'prueba de aplicacion'));
}

class MyApp extends StatelessWidget {
  final String title;

  const MyApp({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: const MyHomePage(title: 'Instagram'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});
  static const List<Map<String, dynamic>> posts = [
    {
      'usuario': 'Carla_San_18',
      'avatar': 'https://i.imgur.com/2zWNlOx.jpeg',
      'imagen': 'https://i.imgur.com/CnIKiOU.png',
      'tiempo': '5 h',
      'likes': '20,8 mil',
      'comentarios': '1000',
      'descripcion': 'historia de Carlongass',
    },
    {
      'usuario': '_isisb3lla',
      'avatar': 'https://i.imgur.com/hXxDYTY.jpeg',
      'imagen': 'https://i.imgur.com/oDV4p7y.jpeg',
      'tiempo': '3 h',
      'likes': '1.842',
      'comentarios': '96',
      'descripcion': 'Día de pierna 🔥 nadie dijo que sería fácil',
      'lugar': 'Gym del barrio',
      'meGusta': true,
    },
    {
      'usuario': '_elkinr_07',
      'avatar': 'https://i.imgur.com/LQN5oyx.jpeg',
      'imagen': 'https://i.imgur.com/iGLjVyR.jpeg',
      'tiempo': '6 h',
      'likes': '12,4 mil',
      'comentarios': '843',
      'descripcion': 'La cara de Juanita cuando le ganamos por 3 vez en parchis 🤣​',
      'lugar': 'Tunja, Boyacá',
    },
    {
      'usuario': 'Carla_San_18',
      'avatar': 'https://i.imgur.com/2zWNlOx.jpeg',
      'imagen': 'https://i.imgur.com/92JDXDP.jpeg',
      'tiempo': '8 h',
      'likes': '5.310',
      'comentarios': '212',
      'descripcion': "Michel despues de ganar la partida",
      'meGusta': true,
    },
    {
      'usuario': 'viajeros.co',
      'avatar': 'https://i.pravatar.cc/150?img=33',
      'imagen': 'https://picsum.photos/seed/atardecer/600/600',
      'tiempo': '10 h',
      'likes': '48,9 mil',
      'comentarios': '2.104',
      'descripcion': 'Atardeceres que valen más que cualquier clase 🌅',
      'lugar': 'Guatapé, Antioquia',
      'verificado': true,
    },
    {
      'usuario': 'gamer.dani',
      'avatar': 'https://i.pravatar.cc/150?img=15',
      'imagen': 'https://picsum.photos/seed/setup/600/600',
      'tiempo': '12 h',
      'likes': '9.077',
      'comentarios': '531',
      'descripcion': 'Setup nuevo desbloqueado 🎮 ¿qué le falta?',
      'verificado': true,
    },
    {
      'usuario': 'cafe_y_libros',
      'avatar': 'https://i.pravatar.cc/150?img=9',
      'imagen': 'https://picsum.photos/seed/libros/600/600',
      'tiempo': '14 h',
      'likes': '3.456',
      'comentarios': '78',
      'descripcion': 'Plan perfecto: lluvia, café y un libro ☕📚',
      'meGusta': true,
    },
    {
      'usuario': 'mauro.beats',
      'avatar': 'https://i.pravatar.cc/150?img=52',
      'imagen': 'https://picsum.photos/seed/concierto/600/600',
      'tiempo': '16 h',
      'likes': '15,2 mil',
      'comentarios': '980',
      'descripcion': 'Anoche fue épico 🎶 todavía no tengo voz',
      'lugar': 'Movistar Arena, Bogotá',
    },
    {
      'usuario': 'karol.arte',
      'avatar': 'https://i.pravatar.cc/150?img=44',
      'imagen': 'https://picsum.photos/seed/arte/600/600',
      'tiempo': '18 h',
      'likes': '7.801',
      'comentarios': '305',
      'descripcion': 'Tardé 3 semanas en terminar esta pintura 🎨',
    },
    {
      'usuario': 'nico_runner',
      'avatar': 'https://i.pravatar.cc/150?img=68',
      'imagen': 'https://picsum.photos/seed/correr/600/600',
      'tiempo': '1 d',
      'likes': '2.215',
      'comentarios': '64',
      'descripcion': 'Km 10 completado 🏃‍♂️ el cuerpo dice no, la mente dice sí',
      'meGusta': true,
    },
    {
      'usuario': 'cami.fotografia',
      'avatar': 'https://i.pravatar.cc/150?img=25',
      'imagen': 'https://picsum.photos/seed/montana/600/600',
      'tiempo': '1 d',
      'likes': '21,7 mil',
      'comentarios': '1.320',
      'descripcion': 'Boyacá no se cansa de sorprender 🏔️',
      'lugar': 'Boyacá, Colombia',
      'verificado': true,
    },
    {
      'usuario': 'memes.u',
      'avatar': 'https://i.pravatar.cc/150?img=60',
      'imagen': 'https://picsum.photos/seed/meme/600/600',
      'tiempo': '2 d',
      'likes': '88,3 mil',
      'comentarios': '4.502',
      'descripcion': 'Yo: "voy a dormir temprano"\nLas 3 AM: 🙃',
    },
    {
      'usuario': 'chef.valen',
      'avatar': 'https://i.pravatar.cc/150?img=32',
      'imagen': 'https://picsum.photos/seed/pizza/600/600',
      'tiempo': '2 d',
      'likes': '6.940',
      'comentarios': '187',
      'descripcion': 'Pizza casera desde cero 🍕 receta en mi perfil',
      'meGusta': true,
    },
    {
      'usuario': 'techlover_js',
      'avatar': 'https://i.pravatar.cc/150?img=8',
      'imagen': 'https://picsum.photos/seed/codigo/600/600',
      'tiempo': '3 d',
      'likes': '11,6 mil',
      'comentarios': '702',
      'descripcion': 'Cuando por fin compila a la primera 😎💻',
      'verificado': true,
    },
    {
      'usuario': 'sebas.moto',
      'avatar': 'https://i.pravatar.cc/150?img=57',
      'imagen': 'https://picsum.photos/seed/moto/600/600',
      'tiempo': '4 d',
      'likes': '4.088',
      'comentarios': '143',
      'descripcion': 'Ruta de domingo 🏍️ la carretera es terapia',
      'lugar': 'Vía Tunja - Paipa',
    },
  ];

  Widget _post(Map<String, dynamic> p) {
    final bool meGusta = p['meGusta'] ?? false;
    final bool verificado = p['verificado'] ?? false;
    final String? lugar = p['lugar'];

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.pinkAccent, width: 2),
                ),
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(p['avatar']),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        p['usuario'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (verificado) ...[
                        const SizedBox(width: 4),
                        const Icon(Icons.verified, size: 14, color: Colors.blue),
                      ],
                      const SizedBox(width: 8),
                      Text(
                        p['tiempo'],
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  if (lugar != null)
                    Text(lugar, style: const TextStyle(fontSize: 12)),
                ],
              ),
              const Spacer(),
              const Icon(Icons.more_horiz),
            ],
          ),
          const SizedBox(height: 10),
          ImagenUsuario(urlImagen: p['imagen']),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                meGusta ? Icons.favorite : Icons.favorite_border,
                size: 28,
                color: meGusta ? Colors.red : null,
              ),
              const SizedBox(width: 5),
              Text(p['likes']),
              const SizedBox(width: 15),
              const Icon(Icons.chat_bubble_outline, size: 28),
              const SizedBox(width: 5),
              Text(p['comentarios']),
              const SizedBox(width: 15),
              const Icon(Icons.repeat, size: 28),
              const SizedBox(width: 15),
              const Icon(Icons.send, size: 28),
              const Spacer(),
              const Icon(Icons.bookmark_border, size: 28),
            ],
          ),
          const SizedBox(height: 8),

          
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${p['usuario']} ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: p['descripcion']),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Ver los ${p['comentarios']} comentarios',
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 470),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ContenedorDeTitulo(color: Colors.pinkAccent),
                    const SizedBox(height: 10),
                    for (final p in posts) _post(p),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}