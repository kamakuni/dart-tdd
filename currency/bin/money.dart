abstract class Expression {
  Money reduce(Bank bank, String to);
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
  final Money augend;
  final Money addend;
  Sum(this.augend, this.addend);

  @override
  Money reduce(Bank bank, String to) {
    var amount = addend.amount + augend.amount;
    return Money(amount, to);
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
