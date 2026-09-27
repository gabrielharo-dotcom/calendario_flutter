import 'package:flutter/material.dart';
import '../theme/orbit_theme.dart';

/// Marco móvil realista para visualización en navegador (Flutter Web en pantalla ancha).
/// En dispositivos móviles o pantallas estrechas se adapta al 100% del área disponible.
class MobilePreview extends StatelessWidget {
  final Widget child;

  const MobilePreview({super.key, required this.child});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFDCEEFB),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Container(
                width: 412,
                height: 890,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(54),
                  border: Border.all(
                    color: const Color(0xFFE2E8F0),
                    width: 2.5,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3D0369A1),
                      blurRadius: 50,
                      offset: Offset(0, 24),
                      spreadRadius: 4,
                    ),
                    BoxShadow(
                      color: Color(0x22000000),
                      blurRadius: 16,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(46),
                  child: Container(
                    color: OrbitColors.skyIce,
                    child: Stack(
                      children: [
                        // Contenido de la aplicación móvil
                        Positioned.fill(
                          child: MediaQuery(
                            data: MediaQuery.of(context).copyWith(
                              size: const Size(392, 870),
                              padding: const EdgeInsets.only(top: 44, bottom: 24),
                              viewPadding: const EdgeInsets.only(top: 44, bottom: 24),
                            ),
                            child: child,
                          ),
                        ),

                        // Barra de estado móvil superior con Dynamic Island
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 44,
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '9:41',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: OrbitColors.spaceDark,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                                // Dynamic Island (Píldora superior)
                                Container(
                                  width: 104,
                                  height: 26,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF0F172A),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 10,
                                        height: 10,
                                        margin: const EdgeInsets.only(right: 10),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFF1E293B),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.signal_cellular_alt_rounded,
                                        size: 15, color: OrbitColors.spaceDark),
                                    SizedBox(width: 4),
                                    Icon(Icons.wifi_rounded,
                                        size: 15, color: OrbitColors.spaceDark),
                                    SizedBox(width: 5),
                                    Icon(Icons.battery_full_rounded,
                                        size: 18, color: OrbitColors.spaceDark),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Indicador de barra inferior (Home Indicator)
                        Positioned(
                          bottom: 8,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              width: 120,
                              height: 4.5,
                              decoration: BoxDecoration(
                                color: OrbitColors.spaceDark.withValues(alpha: 0.7),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
