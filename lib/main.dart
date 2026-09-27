import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/calendar_screen.dart';
import 'theme/orbit_theme.dart';
import 'widgets/mobile_preview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: OrbitColors.skyIce,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const CalendarApp());
}

class CalendarApp extends StatelessWidget {
  const CalendarApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Órbita · Calendario Móvil Espacial',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Outfit',
          scaffoldBackgroundColor: OrbitColors.skyIce,
          colorScheme: ColorScheme.fromSeed(
            seedColor: OrbitColors.skyPrimary,
            primary: OrbitColors.skyDeep,
            surface: OrbitColors.skyIce,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: OrbitColors.spaceDark),
            bodyMedium: TextStyle(color: OrbitColors.spaceDark),
            bodySmall: TextStyle(color: OrbitColors.textSecondary),
          ),
        ),
        home: LayoutBuilder(
          builder: (context, constraints) {
            // En Flutter Web con pantalla ancha, presentamos la app dentro
            // de un marco móvil insignia para cumplir con el formato app móvil.
            // En dispositivos móviles reales (o ventanas estrechas), ocupa la pantalla nativa.
            if (kIsWeb && constraints.maxWidth > 500) {
              return const MobilePreview(child: CalendarScreen());
            }
            return const CalendarScreen();
          },
        ),
      );
}
