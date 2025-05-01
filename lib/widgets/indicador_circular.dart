import 'package:flutter/material.dart';
import 'dart:math';

class IndicadorCircular extends StatelessWidget {
  final double progress; // Progresso normalizado (0.0–1.0)
  final double percentage; // Porcentagem real (0–100) para exibir

  const IndicadorCircular({
    super.key,
    required this.progress,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      // Define tamanho fixo do canvas
      size: const Size(200, 200),
      // Chama o painter que desenha círculo e texto
      painter: _CircularProgressPainter(
        progress: progress,
        percentage: percentage,
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double progress;
  final double percentage;

  // Recebe progresso (0–1) e porcentagem (0–100)
  _CircularProgressPainter({required this.progress, required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;

    // Pincel para o círculo de fundo (borda branca)
    final backgroundPaint =
        Paint()
          ..color = Colors.white
          ..strokeWidth = 12
          ..style = PaintingStyle.stroke;

    // Pincel para o arco de progresso (borda laranja)
    final progressPaint =
        Paint()
          ..color = Colors.orange
          ..strokeWidth = 12
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    // Desenha o círculo de fundo
    canvas.drawCircle(center, radius, backgroundPaint);

    // Desenha o arco proporcional ao progresso
    final sweepAngle = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // Inicia no topo do círculo
      sweepAngle, // Ângulo do arco
      false,
      progressPaint,
    );

    // Prepara texto centralizado com a porcentagem atual
    final tp = TextPainter(
      text: TextSpan(
        text: '${percentage.toStringAsFixed(0)}%',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: size.width);

    // Desenha o texto centralizado no meio do círculo
    tp.paint(
      canvas,
      Offset(center.dx - tp.width / 2, center.dy - tp.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
