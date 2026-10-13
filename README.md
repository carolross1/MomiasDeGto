# Momias de Guanajuato: la leyenda

Plataformas con física real (gravedad, salto, colisiones y enemigos que patrullan) construido
100% con TDD en Flutter. Toda la lógica vive en `lib/logica/` como Dart puro y se prueba antes de
tocar un solo widget.

## Estructura

```
lib/
  logica/          Dart puro (probado con TDD)
    rectangulo.dart      colisión AABB
    personaje.dart
    momia.dart
    calaverita.dart
    motor_fisica.dart    gravedad, salto, aterrizaje, límites, meta
    motor_combate.dart   stomp vs golpe
    estado_juego.dart
    motor_juego.dart     orquesta todo
  presentation/
    juego_screen.dart    cámara, sprites, controles
  main.dart
test/
  rectangulo_test.dart
  motor_fisica_test.dart
  momia_test.dart
  motor_combate_test.dart
  motor_juego_test.dart
```

## Rondas TDD (un commit por ronda)

| Ronda | Tema |
|---|---|
| 1 | Colisión entre rectángulos (AABB) |
| 2 | Gravedad y salto |
| 3 | Aterrizar sobre una plataforma |
| 4 | Movimiento horizontal con límites del nivel |
| 5 | La momia patrulla entre dos límites |
| 6 | Combate: saltar encima derrota, chocar de lado golpea |
| 7 | Recolectar calaveritas |
| 8 | Detectar la meta (Callejón del Beso) |
| 9 | Vidas y Game Over (pruebas en rojo) |
| 10 | MotorJuego: el bucle que integra todo |

## Cómo ejecutar

```bash
flutter pub get
flutter test
flutter run
```

Mantén presionados los botones de izquierda/derecha para caminar y el de arriba para saltar.
Salta encima de las momias para derrotarlas, recolecta las calaveritas y llega al final del nivel.


## Evidencias

<p align="center">
  <img width="300" height="478" alt="Evidencia 1: pantalla del juego" src="https://github.com/user-attachments/assets/f0b86a19-705b-48a9-afd1-d37f27343d46" />
  &nbsp;&nbsp;&nbsp;
  <img width="300" height="478" alt="Evidencia 2: pruebas pasando" src="https://github.com/user-attachments/assets/5dcb37c3-8122-4284-902d-951fd7639f03" />
</p>
