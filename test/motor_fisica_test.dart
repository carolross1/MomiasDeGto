import 'package:flutter_test/flutter_test.dart';
import 'package:momias_guanajuato/logica/personaje.dart';
import 'package:momias_guanajuato/logica/motor_fisica.dart';

void main() {
  test('aplicarGravedad aumenta la velocidad vertical y mueve al personaje hacia abajo', () {
    final personaje = Personaje(x: 0, y: 0);
    MotorFisica.aplicarGravedad(personaje);
    expect(personaje.velocidadY, MotorFisica.gravedad);
    expect(personaje.y, MotorFisica.gravedad);
  });

  test('saltar solo funciona si el personaje esta en el suelo', () {
    final personaje = Personaje(x: 0, y: 0)..enElSuelo = true;
    MotorFisica.saltar(personaje);
    expect(personaje.velocidadY, MotorFisica.impulsoSalto);
    expect(personaje.enElSuelo, false);
  });

  test('saltar no hace nada si el personaje ya esta en el aire', () {
    final personaje = Personaje(x: 0, y: 0)..enElSuelo = false;
    MotorFisica.saltar(personaje);
    expect(personaje.velocidadY, 0);
  });
}
