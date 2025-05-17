extension FormatToNormal on String {
  ///For Example
  ///
  ///'oneTime'=> One Time
  ///
  /// 'OneTime'=> One Time
  ///
  /// 'onetime'=> Onetime
  ///
  /// 'onetime vds'=> Onetime vds
  String formatToNormal() {
    String result = replaceAll('_', ' ').capitalize;

    // for (int i = 1; i < length; i++) {
    //   if (this[i] == this[i].toUpperCase()) {
    //     result += ' ${this[i].toUpperCase()}';
    //   } else {
    //     result += this[i];
    //   }
    // }

    return result;
  }

  String get capitalize {
    return (length > 1) ? this[0].toUpperCase() + substring(1) : toUpperCase();
  }
}
