import 'package:test/test.dart';

import 'money.dart';

void main() {
  test('Multiplication', () {
    var five = Doller(5);
    five.times(2);
    expect(five.amount, equals(10));
  });
}
