abstract class Expression {}

class Money implements Expression {
  final int amount;
  late final String currency;

  Money(this.amount, this.currency);

  static Money doller(int amount) {
    return Money(amount, "USD");
  }

  static Money franc(int amount) {
    return Money(amount, "CHF");
  }

  Money times(int multiplier) {
    return Money(amount * multiplier, currency);
  }

  Expression plus(Money addend) {
    return Sum(this, addend);
  }

  @override
  bool operator ==(Object other) =>
      other is Money && other.amount == amount && other.currency == currency;

  @override
  int get hashCode => amount.hashCode;

  @override
  String toString() => amount.toString() + " " + currency;
}

class Bank {
  Money reduce(Expression source, String to) {
    var sum = source as Sum;
    var amount = sum.addend.amount + sum.augend.amount;
    return Money(amount, to);
  }
}

class Sum implements Expression {
  final Money augend;
  final Money addend;
  Sum(this.augend, this.addend);
}
