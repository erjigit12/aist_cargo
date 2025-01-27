import 'package:aist_cargo/src/feature/feature.dart';
import 'package:flutter/cupertino.dart';
import 'app_routes.dart';
import 'unknown_page.dart';

class RouteGenerator {
  static Route? onGenerate(RouteSettings settings) {
    final route = settings.name;

    switch (route) {
      case AppRoutes.login:
        return CupertinoPageRoute(builder: (_) => const LoginPage());

      case AppRoutes.signup:
        return CupertinoPageRoute(builder: (_) => const SignUpPage());

      case AppRoutes.main:
        return CupertinoPageRoute(builder: (_) => const MainView());

      case AppRoutes.createDelivery:
        return CupertinoPageRoute(builder: (_) => const CreateDeliveryPage());

      case AppRoutes.addCardPage:
        return CupertinoPageRoute(builder: (_) => const AddCardPage());

      case AppRoutes.senderSubscriptionPage:
        return CupertinoPageRoute(
            builder: (_) => const SenderSubscriptionPage());

      case AppRoutes.placeOrderPage:
        return CupertinoPageRoute(builder: (_) => const PlaceOrderPage());

      default:
        return errorRoute();
    }
  }

  static Route? errorRoute() =>
      CupertinoPageRoute(builder: (_) => const UnknownPage());
}
