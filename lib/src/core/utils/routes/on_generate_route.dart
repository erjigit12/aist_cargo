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

      case AppRoutes.forgotPassword:
        return CupertinoPageRoute(builder: (_) => const ForgotPasswordPage());

      case AppRoutes.otpCode:
        return CupertinoPageRoute(
            builder: (_) => OtpCodePage(email: settings.arguments as String));

      case AppRoutes.main:
        return CupertinoPageRoute(builder: (_) => const MainView());

      case AppRoutes.createDelivery:
        return CupertinoPageRoute(
            builder: (_) =>
                CreateDeliveryPage(appBar: settings.arguments as String));

      case AppRoutes.addCard:
        return CupertinoPageRoute(builder: (_) => const AddCardPage());

      case AppRoutes.senderSubscription:
        return CupertinoPageRoute(
            builder: (_) => const SenderSubscriptionPage());

      case AppRoutes.placeOrder:
        return CupertinoPageRoute(builder: (_) => const PlaceOrderPage());

      case AppRoutes.tripsOrParcels:
        return CupertinoPageRoute(
            builder: (_) => TripsOrParcelsPage(
                  title: settings.arguments as String,
                ));

      default:
        return errorRoute();
    }
  }

  static Route? errorRoute() =>
      CupertinoPageRoute(builder: (_) => const UnknownPage());
}
