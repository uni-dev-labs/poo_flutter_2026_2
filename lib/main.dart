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
      'usuario': 'Gabb_San_18',
      'avatar': 'https://i.imgur.com/8ljZmFA.jpeg',
      'imagen': 'https://i.imgur.com/P8tGJka.jpeg',
      'tiempo': '1 d',
      'likes': '25,3 mil',
      'comentarios': '3520',
      'descripcion': 'My parents',
    },
    {
      'usuario': 'feid',
      'avatar': 'https://i.imgur.com/xxVcQNY.jpeg',
      'imagen': 'https://i.imgur.com/XscfJeh.jpeg',
      'tiempo': '16 minutos',
      'likes': '1.842',
      'comentarios': '344',
      'descripcion': 'BABYXXITA MOR COMING SOOOOOON',
      'verificado': true,
    },
    {
      'usuario': 'mariaelvirar_',
      'avatar': 'https://i.imgur.com/UHRvMKb.jpeg',
      'imagen': 'https://i.imgur.com/wE94qcU.jpeg',
      'tiempo': '1 dia',
      'likes': '17,4 mil',
      'comentarios': '33',
      'descripcion': 'de amarrillo y con manguito',
      
    },
    {
      'usuario': 'isabelarivera',
      'avatar': 'https://i.imgur.com/TKLE2Y6.jpeg',
      'imagen': 'https://i.imgur.com/xGJzat8.jpeg',
      'tiempo': '6 dias',
      'likes': '5.800',
      'comentarios': '652',
      'descripcion': "WOW",
      'meGusta': true,
    },
    {
      'usuario': 'kellyreales22',
      'avatar': 'https://i.imgur.com/e6A6mCz.jpeg',
      'imagen': 'https://i.imgur.com/WpUsEPW.jpeg',
      'tiempo': '17 h',
      'likes': '48,7 mil',
      'comentarios': '2.104',
      'descripcion': 'tú hada negrita de confianza',
      'verificado': true,
    },
    {
      'usuario': 'mafearcilia',
      'avatar': 'https://i.imgur.com/85WxbIe.jpeg',
      'imagen': 'https://i.imgur.com/9Jwoxm5.jpeg',
      'tiempo': '24 h',
      'likes': '9.063',
      'comentarios': '980',
      'descripcion': ' Mafecita en la nieve en su version mas feliz',
      'verificado': true,
    },
    {
      'usuario': 'nailsart',
      'avatar': 'https://i.imgur.com/uHL131q.jpeg',
      'imagen': 'https://i.imgur.com/t4kvnzr.jpeg',
      'tiempo': '7 dias',
      'likes': '3.647',
      'comentarios': '520',
      'descripcion': 'Sol',
      'meGusta': true,
    },
    {
      'usuario': 'sara_aguirre',
      'avatar': 'https://i.imgur.com/3EubCsD.jpeg',
      'imagen': 'https://i.imgur.com/G4HSmLJ.jpeg',
      'tiempo': '24 h',
      'likes': '15,2 mil',
      'comentarios': '100',
      'descripcion': ' Octubre ',
      'lugar': 'Movistar Arena, Bogotá',
    },
    {
      'usuario': 'isabellacortes',
      'avatar': 'https://i.imgur.com/kPJkSvG.jpeg',
      'imagen': 'https://i.imgur.com/juW28hJ.jpeg',
      'tiempo': '21 h',
      'likes': '7.900',
      'comentarios': '580',
      'descripcion': 'Otoño',
    },
    {
      'usuario': 'sombrerosmed',
      'avatar': 'https://i.imgur.com/LqI29K4.jpeg',
      'imagen': 'https://i.imgur.com/89E3rmC.jpeg',
      'tiempo': '10 d',
      'likes': '3500',
      'comentarios': '79',
      'descripcion':'hat',
      'meGusta': true,
    },
    {
      'usuario': 'm__anushik',
      'avatar': 'https://i.imgur.com/0yXlrIP.jpeg',
      'imagen': 'https://i.imgur.com/0ueCiYy.jpeg',
      'tiempo': '25 d',
      'likes': '7 mil',
      'comentarios': 'Colombia',
      'verificado': true,
    },
    {
      'usuario': 'romina',
      'avatar': 'https://i.imgur.com/5qQc5gv.jpeg',
      'imagen': 'https://i.imgur.com/NoM3eLD.jpeg',
      'tiempo': '11 d',
      'likes': '70,5 mil',
      'comentarios': 'Pictures',
      
    },
    {
      'usuario': 'Maria.Salome',
      'avatar': 'https://i.imgur.com/IY8rr85.jpeg',
      'imagen': 'https://i.imgur.com/KeWjiDb.jpeg',
      'tiempo': '2 h',
      'likes': '7.000',
      'comentarios': '580',
      'descripcion': 'Mi segunda carrera',
      'meGusta': true,
    },
    {
      'usuario': 'luna.mariana',
      'avatar': 'https://i.imgur.com/iUjujkP.jpeg',
      'imagen': 'https://i.imgur.com/jZ05xV0.jpeg',
      'tiempo': '3 d',
      'likes': '118',
      'comentarios': '100',
      'descripcion': 'My date',
      'verificado': true,
    },
    {
      'usuario': 'carlos.felipe',
      'avatar': 'https://i.imgur.com/xZKBCaM.jpeg',
      'imagen': 'https://i.imgur.com/hbAbErr.jpeg',
      'tiempo': '4 h',
      'likes': '5000',
      'comentarios': '43',
      'descripcion': 'My love',
      
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
          // Encabezado: avatar con aro, usuario, tiempo y los 3 puntitos
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

          // Imagen del post
          ImagenUsuario(urlImagen:p['imagen']),
          const SizedBox(height: 10),

          // Botones: like, comentar, repost, enviar y guardar a la derecha
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

          // Descripción con el usuario en negrita
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