import 'package:test/test.dart';

import 'money.dart';

void main() {
  test('Multiplication', () {
    var five = Doller(5);
    var product = five.times(2);
    expect(product.amount, equals(10));
    product = five.times(3);
    expect(product.amount, equals(15));
  });
  test('Equality', () {
    expect(Doller(5), equals(Doller(5)));
    expect(Doller(5), isNot(equals(Doller(6))));
  });
}
