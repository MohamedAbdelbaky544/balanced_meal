extension DoubleToStringWithoutDecimal on double {
  String doubleToStringFormatted() {
    String result = toStringAsFixed(2);

    // Remove ".0" from the string
    if (result.endsWith('.0')) {
      result = result.substring(0, result.length - 2);
    }

    return result;
  }
}
