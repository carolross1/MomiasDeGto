import 'package:flutter_test/flutter_test.dart';
import 'package:momias_guanajuato/logica/personaje.dart';
import 'package:momias_guanajuato/logica/calaverita.dart';
import 'package:momias_guanajuato/logica/motor_juego.dart';

void main() {
  test('recolectar una calaverita suma puntos y la marca como recolectada', () {
    final personaje = Personaje(x: 100, y: 100);
    final calaverita = Calaverita(x: 105, y: 105);
    final puntos = MotorJuego.recolectarSiCorresponde(personaje, [calaverita]);
    expect(puntos, 50);
    expect(calaverita.recolectada, true);
  });

  test('una calaverita ya recolectada no vuelve a sumar puntos', () {
    final personaje = Personaje(x: 100, y: 100);
    final calaverita = Calaverita(x: 105, y: 105)..recolectada = true;
    final puntos = MotorJuego.recolectarSiCorresponde(personaje, [calaverita]);
    expect(puntos, 0);
  });
}
