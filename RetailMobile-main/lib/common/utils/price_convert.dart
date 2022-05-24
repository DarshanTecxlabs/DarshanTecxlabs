class PriceConvert {
  PriceConvert._();
  static String convert(num value) {
    return (value / 100).toStringAsFixed(2);
  }
}
