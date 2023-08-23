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
  test('Simple addition', () {
    var five = Money.doller(5);
    var sum = five.plus(five);
    var bank = Bank();
    var reduced = bank.reduce(sum, "USD");
    expect(Money.doller(10), equals(reduced));
  });
  test('Plus returns sum', () {
    var five = Money.doller(5);
    var result = five.plus(five);
    var sum = result as Sum;
    expect(five, equals(sum.augend));
    expect(five, equals(sum.addend));
  });
  test('Reduce sum', () {
    var sum = Sum(Money.doller(3), Money.doller(4));
    var bank = Bank();
    var result = bank.reduce(sum, "USD");
    expect(Money.doller(7), equals(result));
  });
  test('Reduce money', () {
    var bank = Bank();
    var result = bank.reduce(Money.doller(1), "USD");
    expect(result, equals(Money.doller(1)));
  });
  test('Reduce money different currency', () {
    var bank = Bank();
    bank.addRate("CHF", "USD", 2);
    var result = bank.reduce(Money.franc(2), "USD");
    expect(result, equals(Money.doller(1)));
  });
  test("Identity rate", () {
    expect(Bank().rate("USD", "USD"), equals(1));
  });
  test("Mixed addition", (){
    Expression fiveBucks = Money.doller(5);
    Expression tenFrancs = Money.franc(10);
    var bank = Bank();
    bank.addRate("CHF", "USD", 2);
    var result = bank.reduce(fiveBucks.plus(tenFrancs), "USD");
    expect(Money.doller(10), result);
  });
}
