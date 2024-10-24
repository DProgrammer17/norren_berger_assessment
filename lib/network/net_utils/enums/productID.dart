enum ProductID {
  cin('CIN', 'Cin'),
  dfxi('DFXI', 'Dfxi'),
  mfi('MFI', 'Mfi'),
  none('NONE', 'None');

  const ProductID(this.jsonString, this.displayString);
  final String jsonString;
  final String displayString;
}

extension ProductIDFromString on String? {
  ProductID? get jsonProductID {
    return ProductID.values.firstWhere(
          (element) => element.jsonString == this,
      orElse: () => ProductID.none,
    );
  }

  ProductID? get displayProductID {
    return ProductID.values.firstWhere(
          (element) => element.displayString == this,
      orElse: () => ProductID.none,
    );
  }
}