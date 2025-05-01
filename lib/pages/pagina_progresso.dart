import 'package:flutter/material.dart';
import '../widgets/indicador_circular.dart';
import '../widgets/campo_porcentagem.dart';

// StatefulWidget que controla a tela de progresso
class PaginaProgresso extends StatefulWidget {
  const PaginaProgresso({super.key});

  @override
  State<PaginaProgresso> createState() => _PaginaProgressoState();
}

class _PaginaProgressoState extends State<PaginaProgresso>
    with SingleTickerProviderStateMixin {
  // Controlador de animação para gerir a interpolação de 0 a 1 em 2 segundos
  late final AnimationController _controller;
  // Animação que varia de 0 a 1 atrelada ao _controller
  late final Animation<double> _animation;
  // Valor alvo normalizado (0.0–1.0) com base na entrada do usuário
  double _target = 0.0;
  // Controlador para o campo de texto onde o usuário digita a porcentagem
  final TextEditingController _inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inicializa o controlador com duração de 2 segundos
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    // Cria uma animação Tween de 0 a 1
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  // Função que valida a entrada, ajusta o target e inicia a animação
  void _startAnimation() {
    final input = double.tryParse(_inputController.text);
    if (input != null && input >= 0 && input <= 100) {
      // Normaliza para 0.0–1.0 e atualiza o estado
      setState(() => _target = input / 100);
      // Reinicia a animação a partir de zero
      _controller.forward(from: 0);
    } else {
      // Exibe mensagem de erro em caso de valor inválido
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Digite um valor entre 0 e 100.')),
      );
    }
  }

  @override
  void dispose() {
    // Libera recursos dos controladores
    _controller.dispose();
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Define a cor de fundo da tela
      backgroundColor: Colors.grey[600],
      body: Center(
        child: SizedBox(
          width: 300, // Largura fixa para alinhar todos os elementos
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centraliza verticalmente
            crossAxisAlignment:
                CrossAxisAlignment.center, // Centraliza horizontalmente
            children: [
              // Título da página
              const Text(
                'Medidor de Progresso',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40), // Espaçamento vertical
              // Widget animado que redesenha o IndicadorCircular conforme o valor de _animation
              AnimatedBuilder(
                animation: _animation,
                builder: (_, __) {
                  // Calcula progresso atual entre 0 e target
                  final prog = _animation.value * _target;
                  return SizedBox(
                    width: 250,
                    height: 250,
                    // Indicador customizado que desenha círculo e texto centralizado
                    child: IndicadorCircular(
                      progress: prog,
                      percentage: prog * 100,
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),

              // Widget de entrada de texto para o usuário digitar a porcentagem
              CampoPorcentagem(controller: _inputController),
              const SizedBox(height: 24), // Espaço antes do botão
              // Botão que dispara _startAnimation
              ElevatedButton(
                onPressed: _startAnimation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Cor de fundo do botão
                  minimumSize: const Size(200, 50), // Tamanho mínimo do botão
                ),
                child: const Text(
                  'Iniciar',
                  style: TextStyle(fontSize: 18), // Tamanho do texto no botão
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
