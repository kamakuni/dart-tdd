class Money {
  final int amount;
  Money(this.amount);
}

class Doller extends Money {
  Doller(int amount) : super(amount);
  Doller times(int multiplier) {
    return Doller(amount * multiplier);
  }

  @override
  bool operator ==(Object other) =>
      other is Doller &&
      other.runtimeType == runtimeType &&
      other.amount == amount;

  @override
  int get hashCode => amount.hashCode;
}

class Franc extends Money {
  Franc(int amount) : super(amount);
  Franc times(int multiplier) {
    return Franc(amount * multiplier);
  }

  @override
  bool operator ==(Object other) =>
      other is Franc &&
      other.runtimeType == runtimeType &&
      other.amount == amount;

  @override
  int get hashCode => amount.hashCode;
}
