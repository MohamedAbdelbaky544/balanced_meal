import 'package:balanced_meal/core/presentation/utils/generated/translation/translations.dart';

import 'package:flutter/material.dart';

extension Translation on BuildContext {
  Translations get translation => Translations.of(this)!;
}
