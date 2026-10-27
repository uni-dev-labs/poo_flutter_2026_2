import 'package:flutter/material.dart';
import 'package:prueba_poo/data/datos.dart';
import 'package:prueba_poo/widget/columna_centrada.dart';
import 'package:prueba_poo/widget/historia_usuario.dart';

/// Perfil de "camila" con su cuadrícula de publicaciones.
class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  Widget _dato(String n, String t) => Column(
        children: [
          Text(n, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          Text(t, style: const TextStyle(fontSize: 13)),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.black,
        title: const Text('camila', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ],
      ),
      body: ColumnaCentrada(
        anchoMaximo: 900,
        child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const imagen_usuario(urlImagen: urlCamila, titulo: 'camila', tamano: 86),
                _dato('4', 'Publicaciones'),
                _dato('1.208', 'Seguidores'),
                _dato('530', 'Seguidos'),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Camila', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 2, 16, 12),
            child: Text('Bogotá 🇨🇴 · Flutter & POO 💙'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                      foregroundColor: Colors.white,
                      elevation: 0,
                    ),
                    child: const Text('Editar perfil'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                      foregroundColor: Colors.white,
                      elevation: 0,
                    ),
                    child: const Text('Compartir perfil'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemCount: 12,
            itemBuilder: (context, i) => Image.network(
              foto('perfil$i', w: 300, h: 300),
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(color: Colors.grey[800]),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
