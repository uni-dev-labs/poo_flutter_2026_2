import 'package:flutter/material.dart';
import 'package:prueba_poo/data/datos.dart';
import 'package:prueba_poo/widget/columna_centrada.dart';

/// Explorar: barra de búsqueda + cuadrícula de fotos.
class BuscarPage extends StatelessWidget {
  const BuscarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.black,
        title: Container(
          height: 38,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            children: [
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 8),
              Text('Buscar', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
      body: ColumnaCentrada(
        anchoMaximo: 900,
        child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: 30,
        itemBuilder: (context, i) => Image.network(
          foto('explorar$i', w: 300, h: 300),
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(color: Colors.grey[800]),
        ),
        ),
      ),
    );
  }
}
