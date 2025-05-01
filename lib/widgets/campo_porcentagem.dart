import 'package:flutter/material.dart';

class CampoPorcentagem extends StatelessWidget {
  final TextEditingController controller;

  // Recebe o controller que gerencia o texto digitado
  const CampoPorcentagem({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      // Centraliza texto e campo na largura disponível
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Rótulo explicativo acima do campo
        const Text(
          'Digite uma porcentagem (0-100)',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8), // Espaço entre rótulo e campo
        SizedBox(
          // Controla a largura do TextField
          width: 300,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              // Indica valor esperado
              hintText: '0-100',
              filled: true,
              fillColor: Colors.white,
              // Padding interno para compactar altura
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              isDense: true,
              // Borda laranja quando habilitado
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange, width: 2),
              ),
              // Borda laranja quando em foco
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange, width: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
