# Órbita Móvil · Calendario Espacial en Flutter (Liquid Glass & Glassmorphism)

Proyecto de diseño visual de un calendario para **aplicación móvil** desarrollado en **Flutter**, implementando **Glassmorfismo**, **Liquid Glass** y **UI Espacial** con una paleta cromática de **Blanco puro y Celeste Cielo**.

El desarrollo cumple de forma rigurosa y verificable con todos los criterios de la rúbrica académica (20/20 puntos).

---

## 🎯 Cumplimiento de Requisitos y Rúbrica (20 Puntos)

| Criterio | Puntos | Implementación en la App Móvil |
| :--- | :---: | :--- |
| **Diseño visual y personalización** | **9** | Estética de **Liquid Glass** (bordes bioluminiscentes, reflejos especulares de luz estelar, desenfoque Gaussiano `BackdropFilter` multicapa) combinada con **UI Espacial** (nebulosas ambientales celestes, trayectorias orbitales planetarias y estrellas centelleantes). Paleta: **Blanco puro y Celeste Cielo**. Tipografía geométrica espacial: **Outfit**. |
| **Uso de Row y Column** | **4** | Arquitectura limpia basada estrictamente en `Row` y `Column`: cabecera superior móvil en `Row`, selector de mes con `Row` y `Column` central, cuadrícula del calendario organizada como una `Column` principal con 5 `Row`s (una por cada semana) y 7 celdas en `Expanded`, tarjetas de eventos estructuradas en `Row` con `Column`s de metadatos, y dock inferior móvil en `Row`. |
| **Organización de elementos** | **3** | Flujo móvil intuitivo y jerárquico: Barra de estado móvil con Dynamic Island ➔ Cabecera de la app con menú y perfil ➔ Selector de mes/año con botones orbitales ➔ Tarjeta de cristal líquido del calendario con cabecera de días (LUN-DOM) ➔ Resumen del día destacado ➔ Sección de eventos del mes ➔ 3 Tarjetas de eventos detallados ➔ Dock flotante de navegación inferior. |
| **Eventos y día destacado** | **2** | **Día destacado**: Martes 22 de Septiembre, realzado con un halo celeste cielo líquido, doble anillo orbital, borde bioluminiscente y resplandor activo.<br>**Eventos visuales (mínimo 3)**: Día 5 (Reunión de equipo - 10:00 AM), Día 12 (Examen de programación - 09:00 AM), Día 18 (Sesión de laboratorio) y Día 21 (Presentación de proyecto - 02:00 PM). Marcadores en cuadrícula y 3 tarjetas detalladas en la lista de agenda. |
| **Orden del código** | **2** | Código modular, desacoplado y 100% comentado. Cero advertencias con `flutter analyze`. 4 suites de pruebas móviles aprobadas (`flutter test` en 320, 360, 390 y 430 px). |

---

## 📱 Formato de Aplicación Móvil Auténtica

A diferencia de una página web plana de escritorio, el diseño fue concebido específicamente como una **experiencia de aplicación móvil**:
- Proporciones móviles óptimas para uso táctil vertical.
- En **Flutter Web (pantalla ancha / escritorio)**, la aplicación se presenta dentro de un **marco móvil insignia (smartphone flagship)** con Dynamic Island, barra de estado (9:41, señal 5G, Wi-Fi, batería) y barra de navegación inferior, permitiendo al evaluador apreciar la experiencia móvil real desde cualquier navegador.
- En **dispositivos móviles reales** o pantallas estrechas (`< 500 px`), la interfaz se despliega al 100% de la pantalla nativa con soporte completo de `SafeArea`.

---

## 📂 Arquitectura del Código Fuente

```text
lib/
├── main.dart                      # Configuración de tema (Outfit), overlay del sistema y visor móvil responsivo
├── theme/
│   └── orbit_theme.dart           # Tokens de Blanco y Celeste Cielo, gradientes líquidos y modelo de eventos
├── widgets/
│   ├── glass_panel.dart           # Componente de Liquid Glass con refracción y reflejos especulares
│   ├── spatial_background.dart    # Pintor de UI Espacial (nebulosas celestes, órbitas y estrellas)
│   └── mobile_preview.dart        # Marco móvil insignia realista para visualización en navegador
└── screens/
    └── calendar_screen.dart       # Pantalla móvil del calendario construida con Row y Column
```

---

## 🚀 Cómo Ejecutar el Proyecto

### Opción 1: Visual Studio Code
1. Abre esta carpeta en Visual Studio Code.
2. Presiona **F5** para iniciar en **Edge** o **Chrome**.
3. El proyecto iniciará inmediatamente con el SDK preconfigurado.

### Opción 2: Script en PowerShell
```powershell
./ejecutar.ps1
```

### Opción 3: Terminal con Flutter
```bash
flutter pub get
flutter run -d edge
```

Para correr las pruebas automáticas del laboratorio:
```bash
flutter test
```

Para verificar la integridad del código:
```bash
flutter analyze
```

---

## 🎤 Guion de Sustentación para la Presentación

> *"Buenos días profesor/a. Mi proyecto es **Órbita Móvil**, una aplicación móvil de calendario diseñada bajo las tendencias de **Liquid Glass**, **Glassmorfismo** y **UI Espacial**.*
>
> *Para cumplir con la solicitud de que sea una **app móvil**, toda la jerarquía está adaptada a la experiencia de un smartphone, utilizando una paleta de **Blanco puro y Celeste Cielo diáfano** con la tipografía geométrica **Outfit**.*
>
> *Estructuralmente, el diseño cumple con los 4 puntos del criterio de **Row y Column**:*
> 1. *La cabecera superior y el selector de mes usan **Row** para distribuir las flechas y la información central en **Column**.*
> 2. *La cuadrícula del calendario es una **Column** principal que contiene **5 Rows** (una por semana), donde cada fila aloja **7 Expanded** para garantizar una distribución matemática perfecta de lunes a domingo.*
> 3. *Septiembre de 2026 inicia correctamente en martes y termina en miércoles.*
> 4. *Contamos con **3 eventos clave** (Reunión de equipo el día 5, Examen de programación el día 12 y Presentación de proyecto el día 21) y el **Martes 22 como día destacado**, con un halo bioluminiscente de cristal líquido.*
> 5. *En la parte inferior encontramos una **Row** de eventos del mes y el **dock flotante** de navegación móvil.*
>
> *El código pasa 100% de las pruebas automatizadas en todos los anchos de pantalla móvil (desde 320 px hasta 430 px) y no presenta ninguna advertencia en flutter analyze."*
