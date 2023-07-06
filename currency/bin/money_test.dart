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
    expect(Franc(5), equals(Franc(5)));
    expect(Franc(5), isNot(equals(Franc(6))));
    expect(Doller(5), isNot(equals(Franc(5))));
  });
  test('FrancMultiplication', () {
    final five = Franc(5);
    expect(five.times(2), equals(Franc(10)));
    expect(five.times(3), equals(Franc(15)));
  });
}
