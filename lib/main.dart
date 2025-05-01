import 'package:flutter/material.dart';
import 'pages/pagina_progresso.dart';

void main() {
  // Ponto de entrada do app: instancia e executa o widget raiz
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Construtor com super key para identificação do widget
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Desativa a tag “DEBUG” no canto superior
      debugShowCheckedModeBanner: false,
      // Define a tela inicial do app
      home: PaginaProgresso(),
    );
  }
}
