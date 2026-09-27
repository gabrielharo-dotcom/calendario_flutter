import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/orbit_theme.dart';

/// Componente de Cristal Líquido (Liquid Glass & Glassmorphism).
/// Proporciona desenfoque de fondo Gaussiano, reflejos especulares de luz,
/// bordes bioluminiscentes y refracción celeste cielo.
class GlassPanel extends StatelessWidget {
  final Widget child;
  final double radius;
  final EdgeInsetsGeometry padding;
  final bool luminous;
  final Color? glowColor;
  final double blur;
  final Border? customBorder;

  const GlassPanel({
    super.key,
    required this.child,
    this.radius = 26,
    this.padding = EdgeInsets.zero,
    this.luminous = false,
    this.glowColor,
    this.blur = 24,
    this.customBorder,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveGlow = glowColor ??
        (luminous
            ? const Color(0x3538BDF8)
            : const Color(0x1C229FE4));

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          // Sombra ambiental celeste cielo (difusa y etérea)
          BoxShadow(
            color: effectiveGlow,
            blurRadius: luminous ? 32 : 24,
            offset: const Offset(0, 10),
            spreadRadius: luminous ? -2 : -6,
          ),
          // Reflejo especular superior/izquierdo que simula luz estelar
          BoxShadow(
            color: OrbitColors.white.withValues(alpha: 0.85),
            blurRadius: 5,
            offset: const Offset(-1, -1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: luminous ? blur + 6 : blur,
            sigmaY: luminous ? blur + 6 : blur,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              // Gradiente líquido: blanco translúcido arriba que desvanece a celeste cristalino
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  OrbitColors.white.withValues(alpha: luminous ? 0.92 : 0.82),
                  OrbitColors.white.withValues(alpha: luminous ? 0.55 : 0.40),
                  const Color(0xFFE3F4FE).withValues(alpha: luminous ? 0.65 : 0.48),
                ],
                stops: const [0.0, 0.55, 1.0],
              ),
              border: customBorder ??
                  Border.all(
                    color: OrbitColors.white.withValues(alpha: 0.95),
                    width: 1.35,
                  ),
            ),
            child: Stack(
              children: [
                // Línea de refracción líquida en la arista superior
                Positioned(
                  top: 0,
                  left: radius * 0.8,
                  right: radius * 0.8,
                  child: Container(
                    height: 1.5,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0x00FFFFFF),
                          Color(0xE6FFFFFF),
                          Color(0x00FFFFFF),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: padding,
                  child: child,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
