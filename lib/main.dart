import 'package:flutter/material.dart';
import 'package:prueba_poo/widget/contenedor_de_titulo.dart';
import 'package:prueba_poo/widget/imagen_usuario.dart';

void main() {
  runApp(const MyApp(title: 'prueba de aplicacion'));
}

class MyApp extends StatelessWidget {

  final String title;

  const MyApp({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.red),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ContenedorDeTitulo(titulo: "hola chicos", color: Colors.transparent),
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                color: Colors.red,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            ImagenUsuario(urlImagen: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReI-vtE0f8CEynSImBO8CPsjJhKhfH-AYJX9YBmQ2py3yfqgTG1aOm8GX6&s=10"),
                            Text("Pedro perez", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Icon(Icons.verified, color: Colors.blue, size: 16),
                            Text("•7 h", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
                          ]
                        ),
                        Icon(Icons.menu),
                      ]
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}