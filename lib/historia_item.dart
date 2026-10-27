import 'package:flutter/material.dart';
import 'modelo_historia.dart';

class HistoriaItem extends StatelessWidget {
  final ModeloHistoria historia;
  final bool vista;
  final VoidCallback alTocar;

  const HistoriaItem({
    super.key,
    required this.historia,
    required this.alTocar,
    this.vista = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: alTocar,
      child: SizedBox(
        width: 86,
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: vista
                    ? null
                    : const LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color(0xFFFFB800),
                          Color(0xFFFF2D55),
                          Color(0xFFC13584),
                        ],
                      ),
                color: vista ? const Color(0xFF2A2F36) : null,
              ),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF0B0F14),
                ),
                child: ClipOval(
                  child: Image.asset(
                    historia.avatar,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    cacheWidth: 200,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              historia.usuario,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                color: vista ? Colors.white54 : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
