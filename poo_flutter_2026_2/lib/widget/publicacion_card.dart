import 'package:flutter/material.dart';
import 'package:prueba_poo/data/datos.dart';
import 'package:prueba_poo/widget/historia_usuario.dart';

class PublicacionCard extends StatefulWidget {
  final Publicacion publicacion;
  const PublicacionCard({super.key, required this.publicacion});

  @override
  State<PublicacionCard> createState() => _PublicacionCardState();
}

class _PublicacionCardState extends State<PublicacionCard>
    with AutomaticKeepAliveClientMixin {
  bool _like = false;
  bool _guardado = false;
  bool _corazonGrande = false;

  // Carrusel: 1 foto a la vez (viewportFraction 1).
  final PageController _pageController = PageController();
  int _paginaActual = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _darLike({bool soloActivar = false}) {
    setState(() {
      _like = soloActivar ? true : !_like;
    });
  }

  void _dobleToque() {
    _darLike(soloActivar: true);
    setState(() => _corazonGrande = true);
    Future.delayed(const Duration(milliseconds: 700), () {
      if (mounted) setState(() => _corazonGrande = false);
    });
  }

  Widget _fotoRed(String url) => Image.network(
        url,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (_, __, ___) => Container(
          color: Colors.grey[300],
          child: const Icon(Icons.image_not_supported,
              color: Colors.grey, size: 48),
        ),
        loadingBuilder: (context, child, progreso) =>
            progreso == null ? child : Container(color: Colors.grey[200]),
      );

  Widget _puntos(int total) => Row(
        children: List.generate(
          total,
          (i) => AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 2.5),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: i == _paginaActual ? Colors.blue : Colors.white38,
            ),
          ),
        ),
      );

  // Mantiene vivo el estado (corazón, página del carrusel) al hacer scroll.
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final p = widget.publicacion;
    final likes = p.meGusta + (_like ? 1 : 0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Cabecera
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 4, 8),
          child: Row(
            children: [
              imagen_usuario(urlImagen: p.urlAvatar, titulo: p.usuario, tamano: 34),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(p.usuario,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                    if (p.ubicacion != null)
                      Text(p.ubicacion!, style: const TextStyle(fontSize: 11)),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_horiz),
                onPressed: () {},
              ),
            ],
          ),
        ),
        // Foto: dinámica = carrusel + doble toque (like); estática = foto fija
        if (p.dinamico)
          GestureDetector(
            onDoubleTap: _dobleToque,
            child: AspectRatio(
              aspectRatio: 1,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: p.urlFotos.length,
                    onPageChanged: (i) => setState(() => _paginaActual = i),
                    itemBuilder: (_, i) => _fotoRed(p.urlFotos[i]),
                  ),
                  // Contador 1/4
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${_paginaActual + 1}/${p.urlFotos.length}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  // Corazón grande al dar doble toque
                  IgnorePointer(
                    child: AnimatedScale(
                      scale: _corazonGrande ? 1 : 0,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOutBack,
                      child: const Icon(Icons.favorite,
                          color: Colors.white, size: 100),
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          AspectRatio(aspectRatio: 1, child: _fotoRed(p.urlFoto)),
        // Acciones
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            children: [
              IconButton(
                // Solo las publicaciones dinámicas aceptan corazón
                onPressed: p.dinamico ? () => _darLike() : null,
                icon: Icon(
                  _like ? Icons.favorite : Icons.favorite_border,
                  color: _like
                      ? Colors.red
                      : (p.dinamico ? Colors.white : Colors.white38),
                  size: 28,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.chat_bubble_outline, size: 26),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send_outlined, size: 26),
              ),
              const Spacer(),
              if (p.dinamico && p.urlFotos.length > 1) _puntos(p.urlFotos.length),
              const Spacer(),
              IconButton(
                onPressed: () => setState(() => _guardado = !_guardado),
                icon: Icon(
                  _guardado ? Icons.bookmark : Icons.bookmark_border,
                  size: 28,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${formatoNumero(likes)} Me gusta',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  children: [
                    TextSpan(
                        text: '${p.usuario} ',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: p.descripcion),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text('Ver los ${p.comentarios} comentarios',
                  style: const TextStyle(color: Colors.grey, fontSize: 13)),
              const SizedBox(height: 2),
              Text(p.tiempo,
                  style: const TextStyle(color: Colors.grey, fontSize: 11)),
              const SizedBox(height: 14),
            ],
          ),
        ),
      ],
    );
  }
}
