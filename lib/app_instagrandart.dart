import 'package:flutter/material.dart';
import 'pantalla_inicio.dart';

class AppInstagrandart extends StatelessWidget {
  const AppInstagrandart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagrandart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0B0F14),
      ),
      home: const PantallaInicio(),
    );
  }
}
