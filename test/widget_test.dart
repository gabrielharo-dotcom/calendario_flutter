import 'package:calendario_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    final font = FontLoader('Outfit')
      ..addFont(rootBundle.load('assets/fonts/Outfit.ttf'));
    await font.load();
  });

  for (final size in [
    const Size(320, 700),
    const Size(360, 800),
    const Size(390, 844),
    const Size(430, 932)
  ]) {
    testWidgets('Diseño móvil ${size.width.toInt()} x ${size.height.toInt()}',
        (tester) async {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(const CalendarApp());
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);

      // Verificación de Requisitos: Mes y Año visibles
      expect(find.text('Septiembre'), findsOneWidget);
      expect(find.text('2026'), findsOneWidget);

      // Verificación de Días de la Semana
      for (final day in ['LUN', 'MAR', 'MIÉ', 'JUE', 'VIE', 'SÁB', 'DOM']) {
        expect(find.text(day), findsOneWidget);
      }

      // Verificación de Requisitos: Mínimo 3 eventos visuales
      expect(find.text('Reunión de equipo'), findsOneWidget);
      expect(find.text('Examen de programación'), findsOneWidget);
      expect(find.text('Presentación de proyecto'), findsOneWidget);

      // Verificación de Glassmorphism (BackdropFilter)
      expect(find.byType(BackdropFilter), findsWidgets);

      // Verificación de Imágenes de los 3 eventos
      expect(find.byType(Image), findsNWidgets(3));

      // Verificación de Alineación de Septiembre 2026: Comienza en Martes y finaliza en Miércoles
      final first = find.byWidgetPredicate((w) =>
          w is Semantics &&
          (w.properties.label?.startsWith('1 de septiembre') ?? false));
      final last = find.byWidgetPredicate((w) =>
          w is Semantics &&
          (w.properties.label?.startsWith('30 de septiembre') ?? false));
      expect(tester.getCenter(first).dx,
          closeTo(tester.getCenter(find.text('MAR')).dx, 1));
      expect(tester.getCenter(last).dx,
          closeTo(tester.getCenter(find.text('MIÉ')).dx, 1));

      // Verificación de Requisitos: 1 Día destacado (Día 22)
      final selected = find.byWidgetPredicate(
          (w) => w is Semantics && w.properties.selected == true);
      expect(selected, findsOneWidget);

      // Verificación de desplazamiento y barra de navegación inferior móvil
      await tester.drag(
          find.byKey(const Key('calendar-scroll')), const Offset(0, -600));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(find.text('Calendario'), findsOneWidget);
    });
  }
}
