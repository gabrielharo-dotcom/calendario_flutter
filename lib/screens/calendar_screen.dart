import 'package:flutter/material.dart';
import '../theme/orbit_theme.dart';
import '../widgets/glass_panel.dart';
import '../widgets/spatial_background.dart';

/// Pantalla principal del Calendario Móvil.
/// Construida según la rúbrica de evaluación:
/// - Uso primordial de Row y Column para la diagramación estructural.
/// - Glassmorfismo, Liquid Glass y UI Espacial.
/// - Paleta de colores: Blanco puro y Celeste Cielo.
/// - Tipografía: Outfit (geométrica, moderna y espacial).
class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            // 1. Fondo ambiental espacial (Nebulosas celestes, órbitas y estrellas)
            const Positioned.fill(child: SpatialBackground()),

            // 2. Contenido principal con SafeArea y desplazamiento fluido
            SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 440),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        key: const Key('calendar-scroll'),
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 96),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Cabecera móvil superior (Row principal de navegación de la app)
                            const _MobileAppBar(),
                            const SizedBox(height: 12),

                            // Selector de Mes y Año (Row con botones orbitales y Column central)
                            const _MonthYearSelector(),
                            const SizedBox(height: 12),

                            // Cuadrícula del Calendario (Column de 5 Rows dentro de GlassPanel)
                            const _LiquidCalendarCard(),
                            const SizedBox(height: 18),

                            // Cabecera de la sección de eventos (Row)
                            const _EventsSectionHeader(),
                            const SizedBox(height: 10),

                            // Lista de eventos visuales del mes (Column con 3 tarjetas de cristal líquido)
                            for (var i = 0; i < agendaEvents.length; i++) ...[
                              _EventCard(
                                event: agendaEvents[i],
                                index: i,
                              ),
                              if (i < agendaEvents.length - 1)
                                const SizedBox(height: 10),
                            ],
                          ],
                        ),
                      ),

                      // Dock flotante de navegación inferior (Liquid Glass Dock)
                      const Positioned(
                        left: 16,
                        right: 16,
                        bottom: 12,
                        child: _MobileFloatingDock(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

// ============================================================================
// 1. CABECERA SUPERIOR MÓVIL (Uso de Row para elementos de control)
// ============================================================================
class _MobileAppBar extends StatelessWidget {
  const _MobileAppBar();

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Botón de menú lateral en cristal líquido (Row con Icono)
          const GlassPanel(
            radius: 16,
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.menu_rounded,
              color: OrbitColors.spaceDark,
              size: 20,
            ),
          ),

          // Título central con identidad espacial (Column con Row de subtítulo)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: OrbitColors.skyVibrant,
                      boxShadow: [
                        BoxShadow(
                          color: OrbitColors.skyGlow,
                          blurRadius: 6,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'ÓRBITA MÓVIL',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.8,
                      color: OrbitColors.skyNavy,
                    ),
                  ),
                ],
              ),
              const Text(
                'Calendario Espacial',
                style: TextStyle(
                  fontSize: 10,
                  color: OrbitColors.textSecondary,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),

          // Avatar de tripulación con halo celeste y cristal líquido
          GlassPanel(
            radius: 16,
            padding: const EdgeInsets.all(3),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFFFFFFF),
                    Color(0xFFBAE6FD),
                    Color(0xFF38BDF8),
                  ],
                ),
                border: Border.all(color: Colors.white, width: 1.5),
              ),
              child: const Icon(
                Icons.person_rounded,
                size: 19,
                color: OrbitColors.skyDeep,
              ),
            ),
          ),
        ],
      );
}

// ============================================================================
// 2. SELECTOR DE MES Y AÑO (Row con controles y Column con tipografía)
// ============================================================================
class _MonthYearSelector extends StatelessWidget {
  const _MonthYearSelector();

  @override
  Widget build(BuildContext context) => Row(
        children: [
          // Botón mes anterior (Cristal líquido con flecha celeste)
          const GlassPanel(
            radius: 18,
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.chevron_left_rounded,
              size: 20,
              color: OrbitColors.skyDeep,
            ),
          ),
          const SizedBox(width: 8),

          // Columna central con Mes, Año y lema inspiracional
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Flexible(
                      child: Text(
                        'Septiembre',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.6,
                          color: OrbitColors.spaceDark,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2.5,
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFE0F2FE), Color(0xFFBAE6FD)],
                        ),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: OrbitColors.white.withValues(alpha: 0.9),
                          width: 1,
                        ),
                      ),
                      child: const Text(
                        '2026',
                        style: TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w700,
                          color: OrbitColors.skyNavy,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                const Text(
                  'Organiza tu órbita y eventos del mes',
                  style: TextStyle(
                    fontSize: 10.5,
                    color: OrbitColors.textSecondary,
                    letterSpacing: 0.2,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // Botón mes siguiente (Cristal líquido con flecha celeste)
          const GlassPanel(
            radius: 18,
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.chevron_right_rounded,
              size: 20,
              color: OrbitColors.skyDeep,
            ),
          ),
        ],
      );
}

// ============================================================================
// 3. TARJETA DE CRISTAL LÍQUIDO DEL CALENDARIO
//    (Estructurada con Column de cabecera, 5 Rows de semanas y Row de pie)
// ============================================================================
class _LiquidCalendarCard extends StatelessWidget {
  const _LiquidCalendarCard();

  @override
  Widget build(BuildContext context) => GlassPanel(
        key: const Key('month-glass'),
        luminous: true,
        radius: 26,
        padding: const EdgeInsets.fromLTRB(8, 12, 8, 10),
        child: Column(
          children: [
            // Row de los días de la semana (LUN a DOM)
            const Row(
              children: [
                _WeekdayLabel('LUN'),
                _WeekdayLabel('MAR'),
                _WeekdayLabel('MIÉ'),
                _WeekdayLabel('JUE'),
                _WeekdayLabel('VIE'),
                _WeekdayLabel('SÁB'),
                _WeekdayLabel('DOM'),
              ],
            ),
            const SizedBox(height: 6),

            // Cuadrícula del calendario: Requisito del laboratorio
            // Una Column conteniendo 5 Rows (una por cada semana)
            Column(
              children: [
                for (var week = 0; week < 5; week++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.5),
                    child: Row(
                      children: [
                        for (var weekday = 0; weekday < 7; weekday++)
                          Expanded(
                            child: _DayCell(index: week * 7 + weekday),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),

            // Divisor sutil de cristal líquido (Línea con gradiente blanco)
            Container(
              height: 1.2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withValues(alpha: 0.0),
                    Colors.white.withValues(alpha: 0.9),
                    Colors.white.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Row inferior del calendario: Resumen del Día Destacado (Requisito)
            Row(
              children: [
                const SizedBox(width: 4),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: OrbitColors.buttonLiquidGradient,
                  ),
                  child: const Icon(
                    Icons.auto_awesome_rounded,
                    size: 11,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 7),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Martes 22 · Día destacado',
                        style: TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w600,
                          color: OrbitColors.textPrimary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Punto focal de la órbita mensual',
                        style: TextStyle(
                          fontSize: 9,
                          color: OrbitColors.textMuted,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: OrbitColors.skySoft.withValues(alpha: 0.7),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  child: const Text(
                    '3 misiones',
                    style: TextStyle(
                      fontSize: 9.5,
                      fontWeight: FontWeight.w700,
                      color: OrbitColors.skyNavy,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
              ],
            ),
          ],
        ),
      );
}

// Etiqueta individual para día de la semana
class _WeekdayLabel extends StatelessWidget {
  final String label;

  const _WeekdayLabel(this.label);

  @override
  Widget build(BuildContext context) => Expanded(
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 9.5,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.6,
              color: OrbitColors.textMuted,
            ),
          ),
        ),
      );
}

// ============================================================================
// CELDA INDIVIDUAL DE DÍA (Con diseño para eventos y Día Destacado)
// ============================================================================
class _DayCell extends StatelessWidget {
  final int index;

  const _DayCell({required this.index});

  @override
  Widget build(BuildContext context) {
    // Septiembre 2026: comienza en Martes (índice 1). El índice 0 es 31 de Agosto.
    final inMonth = index >= 1 && index <= 30;
    final dayNumber = index == 0
        ? 31
        : index > 30
            ? index - 30
            : index;

    final isSelected = inMonth && dayNumber == highlightedDay;
    final eventCount = inMonth ? (calendarEventDays[dayNumber] ?? 0) : 0;
    final hasEvent = eventCount > 0;

    return Semantics(
      label:
          '$dayNumber de ${inMonth ? 'septiembre' : index == 0 ? 'agosto' : 'octubre'} de 2026${isSelected ? ', día destacado' : ''}${hasEvent ? ', $eventCount eventos' : ''}',
      selected: isSelected,
      excludeSemantics: true,
      child: SizedBox(
        height: 40,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: 34,
            height: 36,
            decoration: isSelected
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    gradient: OrbitColors.activeDayGradient,
                    border: Border.all(
                      color: Colors.white,
                      width: 1.5,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x660EA5E9),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(0, 4),
                      ),
                    ],
                  )
                : hasEvent
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: Colors.white.withValues(alpha: 0.75),
                        border: Border.all(
                          color: OrbitColors.skyGlow.withValues(alpha: 0.7),
                          width: 1,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x180284C7),
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ],
                      )
                    : null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$dayNumber',
                  style: TextStyle(
                    fontSize: isSelected ? 13 : 12.5,
                    fontWeight: isSelected
                        ? FontWeight.w800
                        : (hasEvent ? FontWeight.w600 : FontWeight.w400),
                    color: isSelected
                        ? Colors.white
                        : inMonth
                            ? OrbitColors.spaceDark
                            : OrbitColors.textMuted.withValues(alpha: 0.5),
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 2),

                // Indicador de eventos (Punto brillante con resplandor)
                SizedBox(
                  height: 3.5,
                  child: isSelected
                      ? Container(
                          width: 3.5,
                          height: 3.5,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        )
                      : hasEvent
                          ? Container(
                              width: 3.5,
                              height: 3.5,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: OrbitColors.skyVibrant,
                                boxShadow: [
                                  BoxShadow(
                                    color: OrbitColors.skyGlow,
                                    blurRadius: 4,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// 4. CABECERA DE LA SECCIÓN DE EVENTOS (Uso de Row para título y acción)
// ============================================================================
class _EventsSectionHeader extends StatelessWidget {
  const _EventsSectionHeader();

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 17,
                decoration: BoxDecoration(
                  gradient: OrbitColors.buttonLiquidGradient,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Eventos del mes',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.4,
                  color: OrbitColors.spaceDark,
                ),
              ),
            ],
          ),
          // Botón interactivo "Ver todos" en píldora de cristal líquido
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3.5),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: OrbitColors.skySoft,
                width: 1,
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Ver todos',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: OrbitColors.skyDeep,
                  ),
                ),
                SizedBox(width: 3),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 8.5,
                  color: OrbitColors.skyDeep,
                ),
              ],
            ),
          ),
        ],
      );
}

// ============================================================================
// 5. TARJETA INDIVIDUAL DE EVENTO (Glassmorphism, Liquid Glass y Spatial UI)
//    (Estructurada con Row principal conteniendo Columnas de información)
// ============================================================================
class _EventCard extends StatelessWidget {
  final OrbitEvent event;
  final int index;

  const _EventCard({
    required this.event,
    required this.index,
  });

  @override
  Widget build(BuildContext context) => GlassPanel(
        key: Key('event-$index'),
        radius: 20,
        padding: const EdgeInsets.all(11),
        child: Row(
          children: [
            // Píldora de fecha / Icono en cristal líquido
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFFFFFFF),
                    Color(0xFFDDF2FD),
                    Color(0xFFBAE6FD),
                  ],
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 1.5,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x2238BDF8),
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/icons/${event.icon}.png',
                filterQuality: FilterQuality.high,
                excludeFromSemantics: true,
              ),
            ),
            const SizedBox(width: 11),

            // Columna central: Detalles completos del evento
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row con categoría y hora del evento protegida contra desbordamiento
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 1.5,
                        ),
                        decoration: BoxDecoration(
                          color: event.accentColor.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          event.category.toUpperCase(),
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.4,
                            color: event.accentColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        width: 3,
                        height: 3,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: OrbitColors.textMuted,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          '${event.time} (${event.duration})',
                          style: const TextStyle(
                            fontSize: 9.5,
                            fontWeight: FontWeight.w500,
                            color: OrbitColors.textSecondary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),

                  // Título del evento
                  Text(
                    event.title,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.3,
                      color: OrbitColors.spaceDark,
                      height: 1.15,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2.5),

                  // Subtítulo / Detalle del evento
                  Text(
                    event.detail,
                    style: const TextStyle(
                      fontSize: 10,
                      color: OrbitColors.textSecondary,
                      height: 1.2,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 6),

            // Indicador de avance lateral con chevron espacial
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.7),
                border: Border.all(
                  color: OrbitColors.skySoft,
                  width: 1,
                ),
              ),
              child: const Icon(
                Icons.chevron_right_rounded,
                size: 16,
                color: OrbitColors.skyDeep,
              ),
            ),
          ],
        ),
      );
}

// ============================================================================
// 6. DOCK FLOTANTE DE NAVEGACIÓN INFERIOR (Mobile Liquid Glass Dock)
//    (Estructurada con Row principal conteniendo 3 secciones de la app móvil)
// ============================================================================
class _MobileFloatingDock extends StatelessWidget {
  const _MobileFloatingDock();

  @override
  Widget build(BuildContext context) => GlassPanel(
        radius: 28,
        luminous: true,
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
        child: Row(
          children: [
            // Pestaña Activa: Calendario (Píldora líquida celeste cielo)
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: OrbitColors.buttonLiquidGradient,
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.8),
                    width: 1.2,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x440284C7),
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_month_rounded,
                      size: 17,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Calendario',
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Pestaña Inactiva: Eventos (Column con Icono y Texto)
            Expanded(
              flex: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.event_note_rounded,
                    size: 19,
                    color: OrbitColors.textSecondary,
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Eventos',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: OrbitColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            // Pestaña Inactiva: Perfil (Column con Icono y Texto)
            Expanded(
              flex: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.person_outline_rounded,
                    size: 19,
                    color: OrbitColors.textSecondary,
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Perfil',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: OrbitColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
