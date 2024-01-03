import 'package:flutter/material.dart';
import 'package:vac/constants/consts.dart';
import 'package:vac/views/pages/home.dart';
import 'package:vac/views/pages/splash/splashScreen.dart';
import 'services/router.dart' as router;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalVariable(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vāc',
        theme: ThemeData(
          fontFamily: 'Urbanist',
          primaryColor: const Color(0xFF191A32),
          secondaryHeaderColor: const Color(0xFF171722),
          disabledColor: const Color(0xffa2a7ad),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Color(0xFF343636),
          errorColor: Color(0xFFdd3135),
          dividerColor: const Color(0xFFEFEFEF),
          brightness: Brightness.dark,
          hintColor: const Color(0xFFbebebe),
          scaffoldBackgroundColor: const Color(0xFF343636),
          cardColor: Colors.black,
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF191A32),
            secondary: Color(0xFF191A32),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Color(0xFF191A32),
            ),
          ),
        ),
        onGenerateRoute: (settings) => router.generateRoute(settings),
        home: const SplashScreen());
  }
}
