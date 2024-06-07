import 'package:clean_architecture_with_riverpod/features/authication_feature/login/presentation/screens_view/login_screen.dart';
import 'package:clean_architecture_with_riverpod/features/authication_feature/sign_up/presentation/screens_view/signup_screen.dart';
import 'package:clean_architecture_with_riverpod/features/splash_feature/presentation/screens_view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart' as r;

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (BuildContext context) => responsiveWidget(const SplashScreen(), context));
      case '/login_screen':
        return MaterialPageRoute(builder: (BuildContext context) => responsiveWidget(const LoginScreen(), context));
      case '/signup_screen':
        return MaterialPageRoute(builder: (BuildContext context) => responsiveWidget(const SignUpScreen(), context));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

/// Responsive Framework Widget
Widget responsiveWidget(Widget page, BuildContext context, {double? value, Color? color}) {
  return r.MaxWidthBox(
    maxWidth: 1300,
    background: ColoredBox(
      color: color ?? Colors.white,
    ),
    alignment: Alignment.bottomCenter,
    child: r.ResponsiveScaledBox(
      width: r.ResponsiveValue<double>(context, conditionalValues: [
        //tested on device widht 184,203,165,170
        // height 361
        r.Condition.between(start: 0, end: 229, value: value ?? 470),

        r.Condition.between(start: 230, end: 320, value: value ?? 440),
        //tested on device widht 360, 450=410
        r.Condition.between(start: 321, end: 480, value: value ?? 410),
        // tested on device width = 540, 617
        r.Condition.between(start: 481, end: 640, value: value ?? 450),
        // 952, 915
        r.Condition.between(start: 641, end: 960, value: value ?? 600),
        //
        r.Condition.between(start: 961, end: 1024, value: value ?? 650),
        // 1030 , 1098, 1277
        r.Condition.between(start: 1025, end: 1280, value: value ?? 700),
        // 1287 ,
        r.Condition.between(start: 1281, end: 1300, value: value ?? 750),
      ]).value,
      child: page,
    ),
  );
}
