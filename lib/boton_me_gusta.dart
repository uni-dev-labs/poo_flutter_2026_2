import 'package:flutter/material.dart';

class BotonMeGusta extends StatefulWidget {
  final int likesIniciales;

  const BotonMeGusta({super.key, required this.likesIniciales});

  @override
  State<BotonMeGusta> createState() => _BotonMeGustaState();
}

class _BotonMeGustaState extends State<BotonMeGusta>
    with AutomaticKeepAliveClientMixin {
  bool _meGusta = false;

  // Conserva el estado del like aunque la publicación salga de pantalla.
  @override
  bool get wantKeepAlive => true;

  int get _total => widget.likesIniciales + (_meGusta ? 1 : 0);

  String get _textoTotal {
    if (_total >= 1000) {
      final miles = (_total / 1000).toStringAsFixed(1).replaceAll('.', ',');
      return '$miles mil';
    }
    return '$_total';
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: () => setState(() => _meGusta = !_meGusta),
      child: Row(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, anim) =>
                ScaleTransition(scale: anim, child: child),
            child: Icon(
              _meGusta ? Icons.favorite : Icons.favorite_border,
              key: ValueKey(_meGusta),
              size: 28,
              color: _meGusta ? const Color(0xFFFF3040) : Colors.white,
            ),
          ),
          const SizedBox(width: 6),
          Text(_textoTotal),
        ],
      ),
    );
  }
}
