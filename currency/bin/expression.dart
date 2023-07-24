import 'money.dart';

abstract class Expression {}

class Sum implements Expression {
  final Money augend;
  final Money addend;
  Sum(this.augend, this.addend);
}
