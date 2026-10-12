import 'personaje.dart';
import 'calaverita.dart';

class MotorJuego {
  static const int puntosPorCalaverita = 50;

  static int recolectarSiCorresponde(Personaje personaje, List<Calaverita> calaveritas) {
    var puntos = 0;
    for (final c in calaveritas) {
      if (!c.recolectada && personaje.rectangulo.intersectaCon(c.rectangulo)) {
        c.recolectada = true;
        puntos += puntosPorCalaverita;
      }
    }
    return puntos;
  }
}
