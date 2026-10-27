import 'package:flutter/material.dart';
import 'modelo_historia.dart';
import 'barras_progreso_historia.dart';

/// Pantalla completa que reproduce las historias una tras otra.
/// Toque a la derecha = siguiente, a la izquierda = anterior,
/// mantener presionado = pausa.
class VisorHistoria extends StatefulWidget {
  final List<ModeloHistoria> historias;
  final int indiceInicial;
  final ValueChanged<int> alVerHistoria;

  const VisorHistoria({
    super.key,
    required this.historias,
    required this.indiceInicial,
    required this.alVerHistoria,
  });

  @override
  State<VisorHistoria> createState() => _VisorHistoriaState();
}

class _VisorHistoriaState extends State<VisorHistoria>
    with SingleTickerProviderStateMixin {
  late final AnimationController _control;
  late int _usuario;
  int _imagen = 0;

  ModeloHistoria get _actual => widget.historias[_usuario];

  @override
  void initState() {
    super.initState();
    _usuario = widget.indiceInicial;
    _control = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addStatusListener((estado) {
        if (estado == AnimationStatus.completed) _siguiente();
      });
    _iniciar();
  }

  void _iniciar() {
    final usuario = _usuario;
    // Se avisa después del frame para no llamar setState durante build.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) widget.alVerHistoria(usuario);
    });
    _control.forward(from: 0);
  }

  void _siguiente() {
    if (_imagen < _actual.imagenes.length - 1) {
      setState(() => _imagen++);
      _control.forward(from: 0);
    } else if (_usuario < widget.historias.length - 1) {
      setState(() {
        _usuario++;
        _imagen = 0;
      });
      _iniciar();
    } else {
      Navigator.of(context).pop();
    }
  }

  void _anterior() {
    if (_imagen > 0) {
      setState(() => _imagen--);
      _control.forward(from: 0);
    } else if (_usuario > 0) {
      setState(() {
        _usuario--;
        _imagen = 0;
      });
      _iniciar();
    } else {
      _control.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _control.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 470),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapUp: (d) {
                final ancho = context.size?.width ?? 1;
                if (d.localPosition.dx < ancho / 3) {
                  _anterior();
                } else {
                  _siguiente();
                }
              },
              onLongPressStart: (_) => _control.stop(),
              onLongPressEnd: (_) => _control.forward(),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    _actual.imagenes[_imagen],
                    fit: BoxFit.contain,
                    cacheWidth: 1200,
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    right: 8,
                    child: BarrasProgresoHistoria(
                      total: _actual.imagenes.length,
                      actual: _imagen,
                      animacion: _control,
                    ),
                  ),
                  Positioned(
                    top: 22,
                    left: 12,
                    right: 4,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: AssetImage(_actual.avatar),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            _actual.usuario,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(blurRadius: 4, color: Colors.black),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
