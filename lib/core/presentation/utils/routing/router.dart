import 'package:balanced_meal/balace/presentation/pages/details_page.dart';
import 'package:balanced_meal/balace/presentation/pages/order_page.dart';
import 'package:balanced_meal/balace/presentation/pages/order_summary_page.dart';
import 'package:balanced_meal/balace/presentation/pages/welcome_page.dart';
import 'package:balanced_meal/core/presentation/utils/routing/route_info.dart';

class Routes {
  Routes._();
  static Routes I = Routes._();
  final List<RouteInfo> route = [
    RouteInfo(
      path: DetailsPage.path,
      builder: (context, state) => const DetailsPage(),
    ),
    RouteInfo(
      path: WelcomePage.path,
      builder: (context, state) => const WelcomePage(),
    ),
    RouteInfo(
      path: OrderPage.path,
      builder: (context, state) => OrderPage(
        calories: double.parse(state.uri.queryParameters['calories']!),
      ),
    ),
    RouteInfo(
      path: OrderSummaryPage.path,
      builder: (context, state) => const OrderSummaryPage(),
    ),
  ];
}
