import 'package:flutter/material.dart';

class BarrasProgresoHistoria extends StatelessWidget {
  final int total;
  final int actual;
  final Animation<double> animacion;

  const BarrasProgresoHistoria({
    super.key,
    required this.total,
    required this.actual,
    required this.animacion,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(total, (i) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: AnimatedBuilder(
                animation: animacion,
                builder: (_, _) => LinearProgressIndicator(
                  minHeight: 3,
                  value: i < actual ? 1 : (i == actual ? animacion.value : 0),
                  backgroundColor: Colors.white30,
                  valueColor: const AlwaysStoppedAnimation(Colors.white),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
