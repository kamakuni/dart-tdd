class Doller {
  final int _amount;
  Doller(this._amount);
  Doller times(int multiplier) {
    return Doller(_amount * multiplier);
  }

  @override
  bool operator ==(Object other) =>
      other is Doller &&
      other.runtimeType == runtimeType &&
      other._amount == _amount;

  @override
  int get hashCode => _amount.hashCode;
}

class Franc {
  final int _amount;
  Franc(this._amount);
  Franc times(int multiplier) {
    return Franc(_amount * multiplier);
  }

  @override
  bool operator ==(Object other) =>
      other is Franc &&
      other.runtimeType == runtimeType &&
      other._amount == _amount;

  @override
  int get hashCode => _amount.hashCode;
}
