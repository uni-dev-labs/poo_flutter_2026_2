
import 'package:flutter/material.dart';

class ImagenUsuario extends StatelessWidget {
  const ImagenUsuario({
    super.key,
    required this.urlImagen,
  });

  final String? urlImagen;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}