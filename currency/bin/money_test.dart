import 'package:test/test.dart';

import 'money.dart';

void main() {
  test('Multiplication', () {
    final five = Money.doller(5);
    expect(five.times(2), equals(Money.doller(10)));
    expect(five.times(3), equals(Money.doller(15)));
  });
  test('Equality', () {
    expect(Money.doller(5), equals(Money.doller(5)));
    expect(Money.doller(5), isNot(equals(Money.doller(6))));
    expect(Money.doller(5), isNot(equals(Money.franc(5))));
  });
  test('Currency', () {
    expect(Money.doller(1).currency, equals("USD"));
    expect(Money.franc(1).currency, equals("CHF"));
  });
}
