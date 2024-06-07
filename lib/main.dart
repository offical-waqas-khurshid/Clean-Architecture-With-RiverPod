import 'package:clean_architecture_with_riverpod/routes/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('es')],
      path: 'assets/app_translation',
      fallbackLocale: const Locale('en'),
      child: const ProviderScope(child: HomeScreen()),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: '/',
      onGenerateRoute: AppRouter.generateRoute,
      builder: (context, child) {
        return ResponsiveBreakpoints.builder(
          child: BouncingScrollWrapper.builder(context, child!),
          breakpoints: [
            const Breakpoint(start: 0, end: 229, name: "m1"),
            const Breakpoint(start: 230, end: 320, name: "m2"),
            const Breakpoint(start: 321, end: 480, name: "m3"),
            const Breakpoint(start: 481, end: 640, name: "m4"),
            const Breakpoint(start: 641, end: 960, name: "m5"),
            const Breakpoint(start: 961, end: 1024, name: "m6"),
            const Breakpoint(start: 1025, end: 1280, name: "m7"),
            const Breakpoint(start: 1281, end: 1300, name: "m8"),
          ],
        );
      },
    );
  }
}
