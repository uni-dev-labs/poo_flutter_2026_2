
import 'package:flutter/material.dart';
import 'package:prueba_poo/widget/ImagenUsuario.dart';
import 'package:prueba_poo/widget/contenedor_de_titulo.dart';

void main() {
  runApp(const MyApp(title: 'Instagram'));
}

class MyApp extends StatelessWidget {
  final String title;

  const MyApp({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0D1014),
        colorScheme: const ColorScheme.dark(
          primary: Colors.white,
          surface: Color(0xFF0D1014),
        ),
      ),
      home: const MyHomePage(title: 'Instagram'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título original
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    child: ContenedorDeTitulo(
                      titulo: 'hola chicos',
                      color: Colors.transparent,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Encabezado de la publicación
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.fromBorderSide(
                              BorderSide(
                                color: Colors.orange,
                                width: 2,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(2),
                            child: CircleAvatar(
                              radius: 17,
                              backgroundImage: NetworkImage(
                                'https://i.pravatar.cc/150?img=13',
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 8),

                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Aduardo Enrique',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' • 2 d',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Icon(Icons.more_horiz, size: 25),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Imagen principal
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: AspectRatio(
                        aspectRatio: 0.78,
                        child: ImagenUsuario(
                          urlImagen:
                              'https://images.unsplash.com/photo-1523580494863-6f3031224c94?w=900',
                        ),
                      ),
                    ),
                  ),

                  // Indicadores decorativos
                  const SizedBox(height: 10),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 7,
                        color: Color(0xFF536DFE),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.circle,
                        size: 6,
                        color: Colors.white38,
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.circle,
                        size: 6,
                        color: Colors.white38,
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.circle,
                        size: 6,
                        color: Colors.white38,
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Botones de interacción
                  const BotonesPublicacion(),

                  const SizedBox(height: 12),

                  // Descripción
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'descripcion',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                '📣 '
                          
                          ),
                        ],
                      ),
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Botones interactivos de la publicación
class BotonesPublicacion extends StatefulWidget {
  const BotonesPublicacion({super.key});

  @override
  State<BotonesPublicacion> createState() =>
      _BotonesPublicacionState();
}

class _BotonesPublicacionState extends State<BotonesPublicacion> {
  bool meGusta = false;
  bool guardado = false;
  int likes = 109;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          // Me gusta
          InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () {
              setState(() {
                meGusta = !meGusta;
                likes += meGusta ? 1 : -1;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 2,
              ),
              child: Row(
                children: [
                  Icon(
                    meGusta
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: meGusta ? Colors.red : Colors.white,
                    size: 27,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '$likes',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 14),

          // Comentarios
          InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Sección de comentarios'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Icon(
                    Icons.mode_comment_outlined,
                    size: 25,
                  ),
                  SizedBox(width: 5),
                  Text('3', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ),

          const SizedBox(width: 14),

          // Republicar
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Opción de republicar'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            icon: const Icon(Icons.repeat, size: 25),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(
              minWidth: 32,
              minHeight: 40,
            ),
          ),

          const SizedBox(width: 8),

          // Compartir
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Opción de compartir'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            icon: const Icon(Icons.send_outlined, size: 24),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(
              minWidth: 32,
              minHeight: 40,
            ),
          ),

          const Spacer(),

          // Guardar
          IconButton(
            onPressed: () {
              setState(() {
                guardado = !guardado;
              });
            },
            icon: Icon(
              guardado ? Icons.bookmark : Icons.bookmark_border,
              size: 27,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(
              minWidth: 32,
              minHeight: 40,
            ),
          ),
        ],
      ),
    );
  }
}
