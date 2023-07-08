abstract class Money {
  final int amount;

  Money(this.amount);

  static Doller doller(int amount) {
    return Doller(amount);
  }

  static Franc franc(int amount) {
    return Franc(amount);
  }

  String currency();
  Money times(int multiplier);

  @override
  bool operator ==(Object other) =>
      other is Money &&
      other.runtimeType == runtimeType &&
      other.amount == amount;

  @override
  int get hashCode => amount.hashCode;
}

class Doller extends Money {
  Doller(int amount) : super(amount);

  @override
  String currency() {
    return "USD";
  }

  @override
  Money times(int multiplier) {
    return Doller(amount * multiplier);
  }
}

class Franc extends Money {
  Franc(int amount) : super(amount);

  @override
  String currency() {
    return "CHF";
  }

  @override
  Money times(int multiplier) {
    return Franc(amount * multiplier);
  }
}
