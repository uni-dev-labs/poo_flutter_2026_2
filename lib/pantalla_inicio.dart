import 'package:flutter/material.dart';
import 'barra_historias.dart';
import 'datos_demo.dart';
import 'tarjeta_publicacion.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 470),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: publicacionesDemo.length + 1,
              itemBuilder: (context, i) {
                if (i == 0) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 24),
                    child: BarraHistorias(),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: TarjetaPublicacion(
                    publicacion: publicacionesDemo[i - 1],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
