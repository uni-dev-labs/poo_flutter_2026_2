import 'package:flutter/material.dart';

class PiePublicacion extends StatelessWidget {
  final String usuario;
  final String texto;

  const PiePublicacion({super.key, required this.usuario, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 14),
      child: Text.rich(
        TextSpan(children: [
          TextSpan(
            text: '$usuario ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: texto),
        ]),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
