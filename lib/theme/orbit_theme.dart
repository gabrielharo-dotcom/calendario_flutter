import 'package:flutter/material.dart';

/// Paleta de colores astronómica: Blanco puro y Celeste Cielo con acentos líquidos.
/// Cumple con la especificación de diseño espacial y glassmorfismo líquido.
abstract final class OrbitColors {
  // Blancos y reflejos de cristal líquido
  static const white = Color(0xFFFFFFFF);
  static const glassSurface = Color(0xDDFFFFFF);
  static const glassTranslucent = Color(0x70FFFFFF);
  static const glassHighlight = Color(0xF5FFFFFF);
  static const glassRefraction = Color(0x35BAE6FD);
  static const glassBorder = Color(0xE0FFFFFF);

  // Escala Celeste Cielo y Hielo Cósmico
  static const skyIce = Color(0xFFF2F9FD);
  static const skySoft = Color(0xFFD6F0FF);
  static const skyGlow = Color(0xFF93D8FC);
  static const skyPrimary = Color(0xFF38BDF8);
  static const skyVibrant = Color(0xFF0EA5E9);
  static const skyDeep = Color(0xFF0284C7);
  static const skyNavy = Color(0xFF0369A1);

  // Azules espaciales para tipografía de máxima legibilidad y contraste
  static const spaceDark = Color(0xFF0A2540);
  static const textPrimary = Color(0xFF0E2E47);
  static const textSecondary = Color(0xFF4C728E);
  static const textMuted = Color(0xFF7D9EAF);

  // Gradientes líquidos característicos
  static const liquidSkyGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFE8F7FF), Color(0xFFBAE6FD), Color(0xFF7DD3FC)],
  );

  static const buttonLiquidGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF67CBF8), Color(0xFF0EA5E9), Color(0xFF0284C7)],
  );

  static const activeDayGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFBAE6FD),
      Color(0xFF38BDF8),
      Color(0xFF0284C7),
    ],
  );
}

/// Modelo de evento visual para el calendario.
class OrbitEvent {
  final int day;
  final String dayLabel;
  final String title;
  final String detail;
  final String time;
  final String duration;
  final String category;
  final String icon;
  final Color accentColor;

  const OrbitEvent({
    required this.day,
    required this.dayLabel,
    required this.title,
    required this.detail,
    required this.time,
    required this.duration,
    required this.category,
    required this.icon,
    required this.accentColor,
  });
}

/// Lista de eventos requeridos (mínimo 3 eventos visuales).
const agendaEvents = <OrbitEvent>[
  OrbitEvent(
    day: 5,
    dayLabel: '05 SEP',
    title: 'Reunión de equipo',
    detail: 'Sincronización de tripulación y metas del proyecto',
    time: '10:00 a.m.',
    duration: '45 min',
    category: 'Estrategia',
    icon: 'rocket',
    accentColor: OrbitColors.skyDeep,
  ),
  OrbitEvent(
    day: 12,
    dayLabel: '12 SEP',
    title: 'Examen de programación',
    detail: 'Evaluación práctica de interfaces y widgets Flutter',
    time: '09:00 a.m.',
    duration: '90 min',
    category: 'Académico',
    icon: 'notebook',
    accentColor: OrbitColors.skyVibrant,
  ),
  OrbitEvent(
    day: 21,
    dayLabel: '21 SEP',
    title: 'Presentación de proyecto',
    detail: 'Demostración de UI Espacial con Liquid Glass y Flutter',
    time: '02:00 p.m.',
    duration: '60 min',
    category: 'Evaluación 20 pts',
    icon: 'bulb',
    accentColor: OrbitColors.skyPrimary,
  ),
];

/// Mapa de días que contienen eventos en el mes (clave: día, valor: número de eventos).
const Map<int, int> calendarEventDays = {
  5: 1,
  12: 1,
  18: 1,
  21: 1,
};

/// Día destacado del mes (1 día destacado requerido).
const int highlightedDay = 22;
