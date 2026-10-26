import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// CLASE PRINCIPAL
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      debugShowCheckedModeBanner: false,
      home: PantallaInstagram(),
    );
  }
}

// CLASE QUE GUARDA LOS DATOS GENERALES
class ContenidoRedSocial {
  String usuario;
  String descripcion;
  int likes;
  int comentarios;
  String lugar;

  ContenidoRedSocial({
    required this.usuario,
    required this.descripcion,
    required this.likes,
    required this.comentarios,
    required this.lugar,
  });
}

// CLASE QUE HEREDA LOS DATOS GENERALES
class DatosPublicacion extends ContenidoRedSocial {
  List<Color> colores;

  DatosPublicacion({
    required super.usuario,
    required super.descripcion,
    required super.likes,
    required super.comentarios,
    required super.lugar,
    required this.colores,
  });
}

// PANTALLA PRINCIPAL
class PantallaInstagram extends StatelessWidget {
  PantallaInstagram({super.key});

  // LAS SIETE HISTORIAS (Movidas fuera del build para mantener estabilidad)
  final List<String> historias = [
    'Historia 1',
    'Historia 2',
    'Historia 3',
    'Historia 4',
    'Historia 5',
    'Historia 6',
    'Historia 7',
  ];

  // LAS CINCO PUBLICACIONES (Movidas fuera del build)
  final List<DatosPublicacion> publicaciones = [
    DatosPublicacion(
      usuario: 'usuario_1',
      descripcion: 'Disfrutando el día',
      likes: 120,
      comentarios: 15,
      lugar: 'Tunja, Colombia',
      colores: [Colors.purple, Colors.deepPurple],
    ),
    DatosPublicacion(
      usuario: 'usuario_2',
      descripcion: 'Un buen recuerdo',
      likes: 85,
      comentarios: 9,
      lugar: 'Colombia',
      colores: [Colors.orange, Colors.red],
    ),
    DatosPublicacion(
      usuario: 'usuario_3',
      descripcion: 'Momentos especiales',
      likes: 230,
      comentarios: 32,
      lugar: 'Boyacá',
      colores: [Colors.blue, Colors.cyan],
    ),
    DatosPublicacion(
      usuario: 'usuario_4',
      descripcion: 'Un día diferente',
      likes: 64,
      comentarios: 7,
      lugar: 'Tunja',
      colores: [Colors.green, Colors.teal],
    ),
    DatosPublicacion(
      usuario: 'usuario_5',
      descripcion: 'Saludos a todos',
      likes: 310,
      comentarios: 42,
      lugar: 'Colombia',
      colores: [Colors.pink, Colors.deepOrange],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                // HISTORIAS
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < historias.length; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.pink,
                                      width: 2,
                                    ),
                                  ),
                                  child: const CircleAvatar(
                                    radius: 28,
                                    backgroundColor: Colors.grey,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  historias[i],
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // MOSTRAR LAS CINCO PUBLICACIONES
                for (int i = 0; i < publicaciones.length; i++)
                  PublicacionWidget(
                    key: ObjectKey(publicaciones[i]),
                    datos: publicaciones[i],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// WIDGET DE CADA PUBLICACION
class PublicacionWidget extends StatefulWidget {
  final DatosPublicacion datos;

  const PublicacionWidget({
    super.key,
    required this.datos,
  });

  @override
  State<PublicacionWidget> createState() => _PublicacionWidgetState();
}

// ESTADO INDEPENDIENTE DE CADA PUBLICACION
class _PublicacionWidgetState extends State<PublicacionWidget> {
  int imagenActual = 0;

  // GUARDA LOS LIKES DE ESTA PUBLICACION
  late int likesActuales;

  // INDICA SI YA SE HA PULSADO EL CORAZON
  bool tieneLike = false;

  @override
  void initState() {
    super.initState();
    // COPIAMOS LOS LIKES INICIALES DE LA PUBLICACION
    likesActuales = widget.datos.likes;
  }

  // METODO PARA DAR/QUITAR LIKE DINÁMICAMENTE
  void darLike() {
    setState(() {
      if (tieneLike) {
        likesActuales -= 1;
        tieneLike = false;
      } else {
        likesActuales += 1;
        tieneLike = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CABECERA DE LA PUBLICACION
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.datos.usuario,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.datos.lugar,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.more_vert),
              ],
            ),
          ),

          // IMAGENES DESLIZABLES
          SizedBox(
            height: 350,
            child: PageView(
              onPageChanged: (int pagina) {
                setState(() {
                  imagenActual = pagina;
                });
              },
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: widget.datos.colores,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.image,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        widget.datos.colores[1],
                        widget.datos.colores[0],
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.photo_camera,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // BOTONES Y CORAZON REACTIVO
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // BOTON DE LIKE
                IconButton(
                  onPressed: darLike,
                  icon: Icon(
                    tieneLike ? Icons.favorite : Icons.favorite_border,
                  ),
                  color: tieneLike ? Colors.red : Colors.black,
                  iconSize: 27,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 30,
                    minHeight: 40,
                  ),
                  tooltip: 'Me gusta',
                ),

                const SizedBox(width: 12),

                const Icon(
                  Icons.chat_bubble_outline,
                  size: 26,
                ),

                const SizedBox(width: 15),

                const Icon(
                  Icons.send_outlined,
                  size: 26,
                ),

                const Spacer(),

                // PUNTOS DE LAS IMAGENES
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 9,
                      color: imagenActual == 0
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.circle,
                      size: 9,
                      color: imagenActual == 1
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  ],
                ),

                const Spacer(),

                const Icon(
                  Icons.bookmark_border,
                  size: 27,
                ),
              ],
            ),
          ),

          // CANTIDAD DE LIKES ACTUALIZADA
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              '$likesActuales Me gusta',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 6),

          // DESCRIPCION
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              '${widget.datos.usuario} ${widget.datos.descripcion}',
            ),
          ),

          const SizedBox(height: 6),

          // COMENTARIOS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Ver los ${widget.datos.comentarios} comentarios',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}