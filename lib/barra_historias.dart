import 'package:flutter/material.dart';
import 'datos_demo.dart';
import 'historia_item.dart';
import 'visor_historia.dart';

class BarraHistorias extends StatefulWidget {
  const BarraHistorias({super.key});

  @override
  State<BarraHistorias> createState() => _BarraHistoriasState();
}

class _BarraHistoriasState extends State<BarraHistorias> {
  final Set<int> _vistas = {};

  Future<void> _abrir(int indice) async {
    setState(() => _vistas.add(indice));
    await Navigator.of(context).push(
      PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (_, _, _) => VisorHistoria(
          historias: historiasDemo,
          indiceInicial: indice,
          alVerHistoria: (i) => setState(() => _vistas.add(i)),
        ),
        transitionsBuilder: (_, anim, _, child) =>
            FadeTransition(opacity: anim, child: child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        itemCount: historiasDemo.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (_, i) => HistoriaItem(
          historia: historiasDemo[i],
          vista: _vistas.contains(i),
          alTocar: () => _abrir(i),
        ),
      ),
    );
  }
}
