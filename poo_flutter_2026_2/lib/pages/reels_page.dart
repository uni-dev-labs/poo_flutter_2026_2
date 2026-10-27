import 'package:flutter/material.dart';
import 'package:prueba_poo/data/datos.dart';
import 'package:prueba_poo/widget/columna_centrada.dart';
import 'package:prueba_poo/widget/historia_usuario.dart';

/// Pantalla de Reels: se desliza hacia arriba/abajo, una pantalla por reel.
class ReelsPage extends StatelessWidget {
  final int indiceInicial;
  final bool conBotonAtras;
  const ReelsPage({
    super.key,
    this.indiceInicial = 0,
    this.conBotonAtras = false,
  });

  @override
  Widget build(BuildContext context) {
    return ColumnaCentrada(
      anchoMaximo: 430,
      child: Stack(
      children: [
        PageView.builder(
          scrollDirection: Axis.vertical,
          controller: PageController(initialPage: indiceInicial),
          itemCount: reels.length,
          itemBuilder: (context, i) => _ReelItem(reel: reels[i]),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                if (conBotonAtras)
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text('Reels',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                ),
                const Spacer(),
                const Icon(Icons.camera_alt_outlined, color: Colors.white),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ],
      ),
    );
  }
}

class _ReelItem extends StatefulWidget {
  final ReelDato reel;
  const _ReelItem({required this.reel});

  @override
  State<_ReelItem> createState() => _ReelItemState();
}

class _ReelItemState extends State<_ReelItem> {
  bool _like = false;
  bool _siguiendo = false;
  bool _pausado = false;

  @override
  Widget build(BuildContext context) {
    final r = widget.reel;
    return GestureDetector(
      onTap: () => setState(() => _pausado = !_pausado),
      onDoubleTap: () => setState(() => _like = true),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            r.urlPortada,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(color: Colors.grey[900]),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black87],
              ),
            ),
          ),
          if (_pausado)
            const Center(
              child: Icon(Icons.play_arrow, color: Colors.white70, size: 90),
            ),
          // Botones laterales
          Positioned(
            right: 10,
            bottom: 24,
            child: Column(
              children: [
                _Accion(
                  icono: _like ? Icons.favorite : Icons.favorite_border,
                  color: _like ? Colors.red : Colors.white,
                  texto: formatoNumero(r.meGusta + (_like ? 1 : 0)),
                  onTap: () => setState(() => _like = !_like),
                ),
                _Accion(
                  icono: Icons.chat_bubble_outline,
                  texto: formatoNumero(r.comentarios),
                  onTap: () {},
                ),
                _Accion(icono: Icons.send_outlined, texto: '', onTap: () {}),
                _Accion(icono: Icons.more_vert, texto: '', onTap: () {}),
              ],
            ),
          ),
          // Info inferior
          Positioned(
            left: 14,
            right: 80,
            bottom: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    imagen_usuario(
                        urlImagen: r.urlAvatar, titulo: r.usuario, tamano: 34),
                    const SizedBox(width: 8),
                    Text(r.usuario,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                    OutlinedButton(
                      onPressed: () =>
                          setState(() => _siguiendo = !_siguiendo),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white),
                        minimumSize: const Size(0, 28),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      child: Text(_siguiendo ? 'Siguiendo' : 'Seguir'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(r.descripcion, style: const TextStyle(color: Colors.white)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.music_note, color: Colors.white, size: 14),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(r.audio,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Accion extends StatelessWidget {
  final IconData icono;
  final String texto;
  final Color color;
  final VoidCallback onTap;
  const _Accion({
    required this.icono,
    required this.texto,
    required this.onTap,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Icon(icono, color: color, size: 32),
            if (texto.isNotEmpty)
              Text(texto,
                  style: const TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
