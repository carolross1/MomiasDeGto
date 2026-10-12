import 'personaje.dart';

class MotorFisica {
  static const double gravedad = 0.8;
  static const double impulsoSalto = -12;

  static void aplicarGravedad(Personaje personaje) {
    personaje.velocidadY += gravedad;
    personaje.y += personaje.velocidadY;
  }

  static void saltar(Personaje personaje) {
    if (personaje.enElSuelo) {
      personaje.velocidadY = impulsoSalto;
      personaje.enElSuelo = false;
    }
  }
}
