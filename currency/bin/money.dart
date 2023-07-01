class Doller {
  int amount;
  Doller(this.amount);
  Doller times(int multiplier) {
    //amount *= multiplier;
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
