import 'package:balanced_meal/balace/domain/entities/order_data.dart';
import 'package:flutter/foundation.dart';

class CardController extends ChangeNotifier {
  Set<OrderData> card = {};

  addToCard({
    required OrderData item,
  }) {
    card.add(item);
    ChangeNotifier();
  }

  removeFromCard({
    required OrderData item,
  }) {
    card.remove(item);
    ChangeNotifier();
  }

  bool checkItemInCard({
    required OrderData item,
  }) {
    if (card.contains(item)) {
      return false;
    } else {
      return true;
    }
  }
}
