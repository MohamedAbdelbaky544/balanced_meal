import 'package:balanced_meal/balace/domain/entities/order_data.dart';
import 'package:flutter/foundation.dart';

class CardController extends ChangeNotifier {
  Set<OrderData> card = {};
  double price = 0;

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
      ChangeNotifier();
      return false;
    } else {
      ChangeNotifier();
      return true;
    }
  }

  void getCardPrice() {
    for (var element in card) {
      price += element.totalPrice * element.quantity;
    }
    ChangeNotifier();
  }
}
