import 'package:flutter/material.dart';

/// Centra el contenido con un ancho máximo (como Instagram en PC).
class ColumnaCentrada extends StatelessWidget {
  final Widget child;
  final double anchoMaximo;
  const ColumnaCentrada({super.key, required this.child, this.anchoMaximo = 470});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: anchoMaximo),
        child: child,
      ),
    );
  }
}
