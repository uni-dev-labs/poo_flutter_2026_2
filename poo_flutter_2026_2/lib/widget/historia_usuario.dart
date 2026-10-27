import 'package:flutter/material.dart';

class HistoriaUsuario extends StatelessWidget {
  final Color color;
  final String titulo;
  final String? urlImagen;
  final bool conAnillo;
  final bool conMas;

  const HistoriaUsuario({
    super.key,
    required this.color,
    required this.titulo,
    this.urlImagen,
    this.conAnillo = true,
    this.conMas = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 76,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
          Container(
            padding: EdgeInsets.all(conAnillo ? 2.5 : 1.0),
            decoration: conAnillo
                ? const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color(0xFFFEDA75),
                        Color(0xFFFA7E1E),
                        Color(0xFFD62976),
                        Color(0xFF962FBF),
                        Color(0xFF4F5BD5),
                      ],
                    ),
                  )
                : BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300, width: 1.5),
                  ),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: imagen_usuario(urlImagen: urlImagen, titulo: titulo),
            ),
          ),
              if (conMas)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 18),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            titulo,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class imagen_usuario extends StatelessWidget {
  const imagen_usuario({
    super.key,
    required this.urlImagen,
    this.titulo = 'A',
    this.tamano = 60,
  });

  final String? urlImagen;
  final String titulo;
  final double tamano;

  @override
  Widget build(BuildContext context) {
    final inicial = Center(
      child: Text(
        'A',
        style: const TextStyle(color: Colors.white),
      ),
    );
    return Container(
      width: tamano,
      height: tamano,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: urlImagen != null
            ? Image.network(
                urlImagen!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => inicial,
                loadingBuilder: (context, child, progreso) =>
                    progreso == null ? child : inicial,
              )
            : inicial,
      ),
    );
  }
}
