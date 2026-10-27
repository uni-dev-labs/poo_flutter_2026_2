import 'package:flutter/material.dart';
import 'package:prueba_poo/data/datos.dart';
import 'package:prueba_poo/widget/columna_centrada.dart';
import 'package:prueba_poo/widget/contenedor_de_titulo.dart';
import 'package:prueba_poo/widget/publicacion_card.dart';

/// Feed: historias arriba y 15 publicaciones (7 dinámicas, 8 estáticas).
class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ColumnaCentrada(
          child: ListView.builder(
            // +1 por la barra de historias del inicio
            itemCount: publicaciones.length + 1,
            itemBuilder: (context, i) {
              if (i == 0) {
                return const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: ContenedorDeTitulo(
                      titulo: 'Tu historia', color: Colors.black),
                );
              }
              return PublicacionCard(
                key: ValueKey('post_$i'),
                publicacion: publicaciones[i - 1],
              );
            },
          ),
        ),
      ),
    );
  }
}
