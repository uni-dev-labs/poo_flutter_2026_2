import 'package:flutter/material.dart';
import 'package:prueba_poo/widget/Imagen_usuario.dart';
import 'package:prueba_poo/widget/contenedor_de_titulo.dart';

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
      'usuario': 'michel._.jaramillo',
      'avatar': 'https://i.imgur.com/A9dTras.jpeg',
      'imagen': 'https://i.imgur.com/NmO2MPz.jpeg',
      'tiempo': '5 h',
      'likes': '22,8 mil',
      'comentarios': '1000',
      'descripcion': 'historia de michel',
    },
    {
      'usuario': 'atardeceres.23',
      'avatar': 'https://i.imgur.com/zxJBZeH.jpeg',
      'imagen': 'https://i.imgur.com/Gf3Xzk2.jpeg',
      'tiempo': '3 h',
      'likes': '1.842',
      'comentarios': '96',
      'descripcion': 'Un cielo lleno de magia. 🌅',
      'lugar': 'Santa Marta',
      'meGusta': true,
    },
    {
      'usuario': 'floristeria_la.esquina',
      'avatar': 'https://i.imgur.com/5HCLPT0.jpeg',
      'imagen': 'https://i.imgur.com/cV0ecY6.jpeg',
      'tiempo': '6 h',
      'likes': '12,4 mil',
      'comentarios': '843',
      'descripcion': '🌺 Naturaleza y belleza.',
      'lugar': 'Villa de Leyva, Boyacá',
    },
    {
      'usuario': 'nails.34',
      'avatar': 'https://i.imgur.com/85dHiia.jpeg',
      'imagen': 'https://i.imgur.com/ah3LifL.jpeg',
      'tiempo': '8 h',
      'likes': '5.310',
      'comentarios': '212',
      'descripcion': "Tlas mejores uñas",
      'meGusta': true,
    },
    {
      'usuario': 'encantos_by.salam',
      'avatar': 'https://i.imgur.com/HEzXhvH.jpeg',
      'imagen': 'https://i.imgur.com/ASPIui1.jpeg',
      'tiempo': '10 h',
      'likes': '48,9 mil',
      'comentarios': '2.104',
      'descripcion': 'Atardeceres que valen más que cualquier clase 🌅',
      'lugar': 'Guatapé, Antioquia',
      'verificado': true,
    },
    {
      'usuario': 'marilyn_el_achkar',
      'avatar': 'https://i.imgur.com/blNsr8l.jpeg',
      'imagen': 'https://i.imgur.com/J8oSv7t.jpeg',
      'tiempo': '12 h',
      'likes': '9.077',
      'comentarios': '531',
      'descripcion': 'Setup nuevo desbloqueado 🎮 ¿qué le falta?',
      'verificado': true,
    },
    {
      'usuario': 'camilita:_',
      'avatar': 'https://i.imgur.com/ChDRJlv.jpeg',
      'imagen': 'https://i.imgur.com/qGNv4PP.jpeg',
      'tiempo': '14 h',
      'likes': '3.456',
      'comentarios': '78',
      'descripcion': 'Plan perfecto: lluvia, café y un libro ☕📚',
      'meGusta': true,
    },
    {
      'usuario': 'robinson_peña.',
      'avatar': 'https://i.imgur.com/LWicK5h.jpeg',
      'imagen': 'https://i.imgur.com/QMuZ8lO.jpeg',
      'tiempo': '16 h',
      'likes': '15,2 mil',
      'comentarios': '980',
      'descripcion': 'amor de mi vida',
      'lugar': ' Bogotá',
    },
    {
      'usuario': 'vip.car',
      'avatar': 'https://i.imgur.com/Pe3akh4.jpeg',
      'imagen': 'https://i.imgur.com/PjKL1gH.jpeg',
      'tiempo': '18 h',
      'likes': '7.801',
      'comentarios': '305',
      'descripcion': '🚘 Calidad y buen precio.',
    },
    {
      'usuario': 'Dulceamor',
      'avatar': 'https://i.imgur.com/ZEvQFWV.jpeg',
      'imagen': 'https://i.imgur.com/EAFKn3z.jpeg',
      'tiempo': '1 d',
      'likes': '2.215',
      'comentarios': '64',
      'descripcion': '🍓 ¡Endulza tu día con nuestras fresas!',
      'meGusta': true,
    },
    {
      'usuario': 'moreno_04_0',
      'avatar': 'https://i.imgur.com/Ft73NYi.jpeg',
      'imagen': 'https://i.imgur.com/YGxwmd4.jpeg',
      'tiempo': '1 d',
      'likes': '21,7 mil',
      'comentarios': '1.320',
      'descripcion': ' 🏔️',
      'lugar': 'Boyacá, Colombia',
      'verificado': true,
    },
    {
      'usuario': 'gabi_moreno134',
      'avatar': 'https://i.imgur.com/RpfYSZG.jpeg',
      'imagen': 'https://i.imgur.com/BXn4C2S.jpeg',
      'tiempo': '2 d',
      'likes': '88,3 mil',
      'comentarios': '4.502',
      'descripcion': '🙃',
    },
    {
      'usuario': 'camilo.Salazar_',
      'avatar': 'https://i.imgur.com/CUYy3tN.jpeg',
      'imagen': 'https://i.imgur.com/mYRBxqI.jpeg',
      'tiempo': '2 d',
      'likes': '6.940',
      'comentarios': '187',
      'descripcion': 'Pizza casera desde cero 🍕 receta en mi perfil',
      'meGusta': true,
    },
    {
      'usuario': 'stefajaramillo23',
      'avatar': 'https://i.pravatar.cc/150?img=8',
      'imagen': 'https://i.imgur.com/ttcmlUF.jpeg',
      'tiempo': '3 d',
      'likes': '11,6 mil',
      'comentarios': '702',
      'descripcion': 'amor de mi vida',
      'verificado': true,
    },
    {
      'usuario': 'criader.laesperanza',
      'avatar': 'https://i.imgur.com/4NWXcqd.jpeg',
      'imagen': 'https://i.imgur.com/860S2DV.jpeg',
      'tiempo': '4 d',
      'likes': '4.088',
      'comentarios': '143',
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