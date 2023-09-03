abstract class Expression {
  Money reduce(Bank bank, String to);
  Expression plus(Expression addend);
  Expression times(int multiplier);
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

  Expression times(int multiplier) {
    return Money(amount * multiplier, currency);
  }

  @override
  Expression plus(Expression addend) {
    return Sum(this, addend);
  }

  @override
  Money reduce(Bank bank, String to) {
    //return this;
    int rate = bank.rate(currency, to);
    return Money(amount ~/ rate, to);
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
  final Map<Pair, int> _rates = {};
  Money reduce(Expression source, String to) {
    return source.reduce(this, to);
  }

  void addRate(String from, String to, int rate) {
    _rates[Pair(from, to)] = rate;
  }

  int rate(String from, String to) {
    if (from == to) return 1;
    if (!_rates.containsKey(Pair(from, to))) throw Exception();
    return _rates[Pair(from, to)]!;
  }
}

class Sum implements Expression {
  final Expression augend;
  final Expression addend;
  Sum(this.augend, this.addend);

  @override
  Money reduce(Bank bank, String to) {
    var amount = addend.reduce(bank, to).amount + augend.reduce(bank, to).amount;
    return Money(amount, to);
  }

  @override
  Expression plus(Expression addend) {
    return Sum(this, addend);
  }
  Exception times(int multiplier) {
    return Sum(augend.times(multiplier), addend.times(multiplier))
  }
}

class Pair {
  final String _from;
  final String _to;
  Pair(this._from, this._to);

  @override
  bool operator ==(Object other) =>
      other is Pair && other._from == _from && other._to == _to;

  @override
  int get hashCode => 0;
}
