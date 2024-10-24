enum Currency {
  dollar('dollar', 'Dollar'),
  naira('naira', 'Naira'),
  none('none', 'None');

  const Currency(this.jsonString, this.displayString);
  final String jsonString;
  final String displayString;
}

extension CurrencyFromString on String? {
  Currency? get jsonCurrency {
    return Currency.values.firstWhere(
          (element) => element.jsonString == this,
      orElse: () => Currency.none,
    );
  }

  Currency? get displayCurrency {
    return Currency.values.firstWhere(
          (element) => element.displayString == this,
      orElse: () => Currency.none,
    );
  }
}