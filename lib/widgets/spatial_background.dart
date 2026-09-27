import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Fondo ambiental con estética de UI Espacial: nebulosas celestes translúcidas,
/// órbitas planetarias y estrellas centelleantes sobre una base de blanco y celeste cielo.
class SpatialBackground extends StatelessWidget {
  const SpatialBackground({super.key});

  @override
  Widget build(BuildContext context) => const RepaintBoundary(
        child: CustomPaint(
          painter: _SpatialSkyPainter(),
          size: Size.infinite,
        ),
      );
}

class _SpatialSkyPainter extends CustomPainter {
  const _SpatialSkyPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final area = Offset.zero & size;

    // 1. Gradiente base celestial: Blanco nacarado a celeste cielo diáfano
    final baseGradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFF6FCFF),
        Color(0xFFE2F4FE),
        Color(0xFFCDEEFE),
        Color(0xFFF2FAFF),
      ],
      stops: [0.0, 0.35, 0.75, 1.0],
    ).createShader(area);

    canvas.drawRect(area, Paint()..shader = baseGradient);

    // Función auxiliar para dibujar nebulosas de energía celeste líquida
    void drawNebula(Offset center, double radius, Color glowColor) {
      canvas.drawCircle(
        center,
        radius,
        Paint()
          ..shader = RadialGradient(
            colors: [
              glowColor.withValues(alpha: 0.45),
              glowColor.withValues(alpha: 0.18),
              glowColor.withValues(alpha: 0.0),
            ],
            stops: const [0.0, 0.5, 1.0],
          ).createShader(Rect.fromCircle(center: center, radius: radius)),
      );
    }

    // Nebulosas espaciales superiores e inferiores
    drawNebula(Offset(size.width * 0.88, size.height * 0.15), size.width * 0.75,
        const Color(0xFF7DD3FC));
    drawNebula(Offset(size.width * 0.08, size.height * 0.48), size.width * 0.65,
        const Color(0xFFBAE6FD));
    drawNebula(Offset(size.width * 0.85, size.height * 0.82), size.width * 0.70,
        const Color(0xFF38BDF8));
    drawNebula(Offset(size.width * 0.25, size.height * 0.95), size.width * 0.55,
        const Color(0xFFBAE6FD));

    // 2. Órbitas cósmicas celestiales (trayectorias elípticas finas)
    canvas.save();
    canvas.translate(size.width * 0.5, size.height * 0.28);
    canvas.rotate(-0.25);

    for (var i = 0; i < 3; i++) {
      final orbitRect = Rect.fromCenter(
        center: Offset.zero,
        width: size.width * (1.35 + i * 0.32),
        height: size.width * (0.65 + i * 0.22),
      );

      final orbitPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = i == 1 ? 1.8 : 1.0
        ..color = Colors.white.withValues(alpha: i == 1 ? 0.65 : 0.35);

      canvas.drawOval(orbitRect, orbitPaint);

      // Partícula de órbita (pequeño nodo planetario)
      final angle = i * 1.8 + 0.4;
      final nodeX = (orbitRect.width / 2) * math.cos(angle);
      final nodeY = (orbitRect.height / 2) * math.sin(angle);
      canvas.drawCircle(
        Offset(nodeX, nodeY),
        3.0 + i,
        Paint()..color = Colors.white.withValues(alpha: 0.85),
      );
      canvas.drawCircle(
        Offset(nodeX, nodeY),
        6.0 + i * 2,
        Paint()
          ..color = const Color(0xFF38BDF8).withValues(alpha: 0.35)
          ..style = PaintingStyle.fill,
      );
    }
    canvas.restore();

    // 3. Estrellas y destellos estelares (Constelación espacial sutil)
    final starCoordinates = [
      const Offset(0.14, 0.12),
      const Offset(0.85, 0.08),
      const Offset(0.22, 0.26),
      const Offset(0.92, 0.42),
      const Offset(0.09, 0.68),
      const Offset(0.88, 0.72),
      const Offset(0.18, 0.88),
      const Offset(0.78, 0.94),
    ];

    for (var index = 0; index < starCoordinates.length; index++) {
      final starPos = starCoordinates[index];
      final center = Offset(size.width * starPos.dx, size.height * starPos.dy);
      final isMajor = index % 2 == 0;
      final maxRadius = isMajor ? 5.5 : 3.5;

      // Resplandor difuso de la estrella
      canvas.drawCircle(
        center,
        maxRadius * 2.2,
        Paint()..color = const Color(0x3538BDF8),
      );

      // Estrella de 4 puntas
      final path = Path();
      for (var i = 0; i < 8; i++) {
        final angle = i * math.pi / 4;
        final r = i.isEven ? maxRadius : (maxRadius * 0.25);
        final pt = center + Offset(math.cos(angle) * r, math.sin(angle) * r);
        if (i == 0) {
          path.moveTo(pt.dx, pt.dy);
        } else {
          path.lineTo(pt.dx, pt.dy);
        }
      }
      path.close();

      canvas.drawPath(
        path,
        Paint()..color = Colors.white.withValues(alpha: isMajor ? 0.95 : 0.80),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
