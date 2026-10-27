import 'package:flutter/material.dart';

void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Inicio(),
    );
  }
}

class PantallaHistoria extends StatelessWidget {
  String nombre;
  String foto;

  PantallaHistoria(this.nombre, this.foto);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(nombre),
      ),
      body: Center(
        child: Image.network(
          foto,
          width: double.infinity,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class ItemHistoria extends StatefulWidget {
  String nombre;
  String foto;

  ItemHistoria(this.nombre, this.foto);

  @override
  State<ItemHistoria> createState() => EstadoItemHistoria();
}

class EstadoItemHistoria extends State<ItemHistoria> {

  Widget crearPantalla(BuildContext c) {
    return PantallaHistoria(widget.nombre, widget.foto);
  }

  void abrir() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: crearPantalla),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: abrir,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: Colors.pink,
              child: CircleAvatar(
                radius: 29,
                backgroundImage: NetworkImage(widget.foto),
              ),
            ),
            SizedBox(height: 4),
            Text(widget.nombre),
          ],
        ),
      ),
    );
  }
}

// Pantalla principal
class Inicio extends StatelessWidget {

  Widget crearPublicacion(String usuario, String texto, String foto) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=' + usuario),
              ),
              SizedBox(width: 8),
              Text(usuario),
            ],
          ),
        ),
        // CAMBIO 1: antes tenía height: 250. Ahora AspectRatio mantiene la proporción horizontal
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            foto,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(usuario + ': ' + texto),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> nombresHistorias = [
      'Anita', 'Carlos', 'Sofii', 'David', 'Laura', 'Pedro', 'Camiii'
    ];


    List<String> fotosHistorias = [
      'https://picsum.photos/seed/historia1/400/700',
      'https://picsum.photos/seed/historia2/400/700',
      'https://picsum.photos/seed/historia3/400/700',
      'https://picsum.photos/seed/historia4/400/700',
      'https://picsum.photos/seed/historia5/400/700',
      'https://picsum.photos/seed/historia6/400/700',
      'https://picsum.photos/seed/historia7/400/700'
    ];

    List<String> usuarios = [
      '@anaaa.linda', '@carlos.vargas4', '@sofiaaa.alv', '@davidd.44.silva', '@lauraa.valeria3',
      '@pedro.perez456', '@camilaa.andreaa', '@juan_vargass3', '@valentinaaaa4.li', '@andres.felipe.alv',
      '@danielaa.sofiiila', '@felipe.rojas.98', '@maria.duenas.34', '@santiago.benitez123', '@paulaa.rojas.56'
    ];

    List<String> descripciones = [
      'Mi primer post en Flutter',
      'Estudiando para el parcial',
      'Buen dia a todos',
      'Tomando cafe con los amigos',
      'Atardecer en Tunja',
      'Dia de gimnasio',
      'Cocinando algo rico',
      'Con mi perro en el parque',
      'Viaje de fin de semana',
      'Programando toda la noche',
      'Mi libro favorito',
      'Partido de futbol',
      'Cumpleanos de mi mama',
      'Dia de lluvia',
      'Domingo de descanso'
    ];

    List<String> fotosPosts = [
      'https://icare.dk/wp-content/uploads/Balack-cat-scaled.jpeg.webp',
      'https://th.bing.com/th/id/R.2d0da88c24de17c81f1292baef4b6ecd?rik=5VJoaImte4hQJQ&riu=http%3a%2f%2fwww.clubpreparatoriano.com%2fimages%2festudiar.jpeg&ehk=OJxpsfEYkBwcCP%2bCkQjvYZa2lRaG9i8q%2bJToeRJPZGM%3d&risl=&pid=ImgRaw&r=0',
      'https://th.bing.com/th/id/R.c5e85cb1e6e1d151068f71616dad63c3?rik=1LU3Mk9NepaGew&riu=http%3a%2f%2f3.bp.blogspot.com%2f-UeTEaf_sJSc%2fUKemKE9BQaI%2fAAAAAAABQ14%2fsdEph3T-jt0%2fs1600%2fAmanecer-en-el-cielo-Sunset-nubes-y-el-sol-resplandeciente.jpg&ehk=dcL4KANdKdsfRwo1%2bVvNBgw7ugUngrIH070TzgVBaa4%3d&risl=&pid=ImgRaw&r=0',
      'https://tse2.mm.bing.net/th/id/OIP.lN7hftHDtW9xuSn9RmdUbAHaDm?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
      'https://tse1.mm.bing.net/th/id/OIP.D6_Cvl7J7BTFYE4nl0f0kgHaEJ?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
      'https://th.bing.com/th/id/R.42c0c7f83d0ac6b5ab20d18ae0177162?rik=sMP7xNzsl%2bBisw&riu=http%3a%2f%2fgymatlantastudio.com%2fphoto%2fslide5.jpg&ehk=1YSs7tUz8Fggw0D1LIykiL%2b2Qk3HaR%2bRKMpjgoqEe80%3d&risl=&pid=ImgRaw&r=0',
      'https://statics.guiadecocinafacil.com/2026/03/crop/69c40a986ff89__1050x560.webp',
      'https://thumbs.dreamstime.com/b/perros-que-juegan-en-el-parque-91963891.jpg',
      'https://image.urlaubspiraten.de/4x3/image/upload/v1603287411/mediavault_images/q7tkx30xpcinpbrird2j.jpg',
      'https://media.istockphoto.com/id/1445262848/photo/tired-programmer-yawning-coding-and-developing-web-and-software-at-night.jpg?s=612x612&w=0&k=20&c=1RctlUUrfZzcFRyDvT0NoxF1cAqBDEpXMDSIs6NgbPU=',
      'https://media.a24.com/p/26431e7692e3b4453182537c5e8e43dc/adjuntos/296/imagenes/008/172/0008172742/los-mejores-libros-leer.jpeg',
      'https://images.unsplash.com/photo-1767916732786-a83902ffc25c?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://media.istockphoto.com/id/1265576066/photo/family-at-home.jpg?s=612x612&w=0&k=20&c=RsDaCCiDdRk7Fmh9Q12HNHi3R34fVJzftNJcjl3TitQ=',
      'https://www.buenosaires123.com.ar/img/salidas-dia-de-lluvia.jpg',
      'https://picsum.photos/seed/foto15/600/400'
    ];

    List<Widget> historias = [];
    for (int i = 0; i < nombresHistorias.length; i++) {
      historias.add(ItemHistoria(nombresHistorias[i], fotosHistorias[i]));
    }

    List<Widget> publicaciones = [];
    for (int i = 0; i < usuarios.length; i++) {
      publicaciones.add(crearPublicacion(usuarios[i], descripciones[i], fotosPosts[i]));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
      ),
      // CAMBIO 2: el ListView ahora está dentro de Center y ConstrainedBox con ancho máximo de 900
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 900),
          child: ListView(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: historias,
                ),
              ),
              Column(
                children: publicaciones,
              ),
            ],
          ),
        ),
      ),
    );
  }
}