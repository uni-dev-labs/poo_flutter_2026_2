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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 470),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContenedorDeTitulo(color: Colors.pinkAccent),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                            'https://i.imgur.com/2zWNlOx.jpeg',
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Carla_San_18',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Text('5 h'),
                        Spacer(),
                        Icon(Icons.more_horiz),
                      ],
                    ),
                    SizedBox(height: 10),
                    ImagenUsuario(
                      urlImagen: 'https://i.imgur.com/CnIKiOU.png',
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.favorite_border, size: 28),
                        SizedBox(width: 5),
                        Text('20,8 mil'),
                        SizedBox(width: 15),
                        Icon(Icons.chat_bubble_outline, size: 28),
                        SizedBox(width: 5),
                        Text('1000'),
                        SizedBox(width: 15),
                        Icon(Icons.repeat, size: 28),
                        SizedBox(width: 15),
                        Icon(Icons.send, size: 28),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text('historia de Carlongass'),
                    SizedBox(height: 30),
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
