class Money {
  final int amount;
  late final String currency;

  Money(this.amount, this.currency);

  static Money doller(int amount) {
    return Doller(amount, "USD");
  }

  static Money franc(int amount) {
    return Franc(amount, "CHF");
  }

  Money times(int multiplier) {
    return Money(amount * multiplier, currency);
  }

  @override
  bool operator ==(Object other) =>
      other is Money &&
      other.runtimeType == runtimeType &&
      other.amount == amount;

  @override
  int get hashCode => amount.hashCode;
}

class Doller extends Money {
  Doller(int amount, String currency) : super(amount, currency);
  Money times(int multiplier) {
    return Money(amount * multiplier, currency);
  }
}

class Franc extends Money {
  Franc(int amount, String currency) : super(amount, currency);
  Money times(int multiplier) {
    return Money(amount * multiplier, currency);
  }
}
