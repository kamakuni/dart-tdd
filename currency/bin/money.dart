abstract class Expression {
  Money reduce(String to);
}

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
  Money reduce(String to) {
    return this;
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
    if (source is Money) return source.reduce(to);
    var sum = source as Sum;
    return sum.reduce(to);
  }
}

class Sum implements Expression {
  final Money augend;
  final Money addend;
  Sum(this.augend, this.addend);

  @override
  Money reduce(String to) {
    var amount = addend.amount + augend.amount;
    return Money(amount, to);
  }
}
