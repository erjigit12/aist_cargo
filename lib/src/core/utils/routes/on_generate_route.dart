import 'package:aist_cargo/src/feature/feature.dart';
import 'package:flutter/cupertino.dart';
import 'app_routes.dart';
import 'unknown_page.dart';

class RouteGenerator {
  static Route? onGenerate(RouteSettings settings) {
    final route = settings.name;
    final Object? arguments = settings.arguments;
    final args = (arguments is Map<String, dynamic>) ? arguments : {};

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

      case AppRoutes.isSubscribed:
        final args = settings.arguments as Map<String, dynamic>;
        return CupertinoPageRoute(
          builder: (_) => IsSubscribedPage(
            appBar: args['appBar'] as String,
            deliverOrSend: args['deliverOrSend'] as bool,
          ),
        );

      case AppRoutes.addCard:
        return CupertinoPageRoute(builder: (_) => const AddCardPage());

      case AppRoutes.senderSubscription:
        return CupertinoPageRoute(
            builder: (_) => const SenderSubscriptionPage());

      case AppRoutes.placeOrder:
        final args = settings.arguments as Map<String, dynamic>;
        return CupertinoPageRoute(
          builder: (_) => PlaceOrderPage(
            packageOptions: args['packageOptions'] as List<PackageOption>,
            deliverOrSend: args['deliverOrSend'] as bool,
          ),
        );

      case AppRoutes.editProfile:
        return CupertinoPageRoute(builder: (_) => const EditProfilePage());

      case AppRoutes.mySubscription:
        return CupertinoPageRoute(
            builder: (_) =>
                MySubscriptionPage(appBarTitle: args['title'] as String));

      case AppRoutes.tripsOrParcels:
        return CupertinoPageRoute(
            builder: (_) => TripsOrParcelsPage(
                  title: args['title'] as String,
                  isParcel: args['isParcel'] as bool,
                ));

      default:
        return errorRoute();
    }
  }

  static Route? errorRoute() =>
      CupertinoPageRoute(builder: (_) => const UnknownPage());
}
