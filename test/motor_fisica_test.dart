import 'package:flutter_test/flutter_test.dart';
import 'package:momias_guanajuato/logica/personaje.dart';
import 'package:momias_guanajuato/logica/motor_fisica.dart';
import 'package:momias_guanajuato/logica/rectangulo.dart';

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

  test('el personaje aterriza sobre una plataforma al caer sobre ella', () {
    // Pie anterior = 65 + 32 = 97 (arriba de la plataforma en y=100),
    // pie actual = 70 + 32 = 102 (ya la cruzo): aterriza.
    final personaje = Personaje(x: 10, y: 70)..velocidadY = 5;
    const plataforma = Rectangulo(x: 0, y: 100, ancho: 100, alto: 20);
    MotorFisica.resolverColisionConPiso(personaje, [plataforma], 65);
    expect(personaje.enElSuelo, true);
    expect(personaje.y, 100 - personaje.alto);
    expect(personaje.velocidadY, 0);
  });

  test('el personaje no aterriza si todavia esta muy por encima de la plataforma', () {
    final personaje = Personaje(x: 10, y: 50)..velocidadY = 5;
    const plataforma = Rectangulo(x: 0, y: 100, ancho: 100, alto: 20);
    MotorFisica.resolverColisionConPiso(personaje, [plataforma], 45);
    expect(personaje.enElSuelo, false);
  });
}
