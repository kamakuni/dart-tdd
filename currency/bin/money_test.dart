import 'package:test/test.dart';

import 'money.dart';

void main() {
  test('Multiplication', () {
    final five = Doller(5);
    expect(five.times(2), equals(Doller(10)));
    expect(five.times(3), equals(Doller(15)));
  });
  test('Equality', () {
    expect(Doller(5), equals(Doller(5)));
    expect(Doller(5), isNot(equals(Doller(6))));
  });
}
