class Money {
  final int amount;
  Money(this.amount);

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
  Doller times(int multiplier) {
    return Doller(amount * multiplier);
  }
}

class Franc extends Money {
  Franc(int amount) : super(amount);
  Franc times(int multiplier) {
    return Franc(amount * multiplier);
  }
}
