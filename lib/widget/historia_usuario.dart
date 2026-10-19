import 'package:flutter/material.dart';

class HistoriaUsuario extends StatelessWidget {
  final Color color;
  final String titulo;
  final String? urlImagen;

  const HistoriaUsuario({
    super.key,
    required this.color,
    required this.titulo,
    this.urlImagen,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: urlImagen != null 
              ? Image.network(urlImagen!, fit: BoxFit.fill)
              : Center(child: Text("A", style: TextStyle(color: Colors.black))),
          ),
        ),
        Text(
          titulo,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}