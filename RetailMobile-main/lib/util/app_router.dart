import 'package:flutter/material.dart';
import 'package:tecxlabs_trading_app/feature/Authentiction/ui/login_screen.dart';
import 'package:tecxlabs_trading_app/feature/Authentiction/ui/pin_screen.dart';
import 'package:tecxlabs_trading_app/feature/create_order/ui/order_screen.dart';
import 'package:tecxlabs_trading_app/feature/dashboard/ui/dashboard.dart';

class Routes {
  static const loginScreen = '/login';
  static const pinScreen = '/pin';
  static const dashboardScreen = '/dashboard';
  static const createOrder = '/createOrder';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(
            settings: RouteSettings(name: loginScreen),
            builder: (BuildContext context) => LoginScreen());

      case pinScreen:
        return MaterialPageRoute(
            settings: RouteSettings(name: pinScreen),
            builder: (BuildContext context) => PinLoginScreen());

      case dashboardScreen:
        return MaterialPageRoute(
            settings: RouteSettings(name: dashboardScreen),
            builder: (BuildContext context) => Dashboard());
      case createOrder:
        return MaterialPageRoute(
            settings: RouteSettings(name: dashboardScreen),
            builder: (BuildContext context) => OrderScreen());

      default:
        return MaterialPageRoute(
            settings: RouteSettings(name: loginScreen),
            builder: (BuildContext context) => LoginScreen());
    }
  }
}
