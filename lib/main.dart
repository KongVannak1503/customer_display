import 'package:flutter/material.dart';
import 'package:mylekha_cd_app/screens/login/login_screen.dart';

class CustomColors {
  static const Color lightGreen = Color(0xFF06DD90);
  static const Color darkGreen = Color(0xFF14997E);
  static const Color black = Color(0xFF000000);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: CustomColors.lightGreen,
          onPrimary: Colors.white,
          primaryContainer: Color(0xFFE8F5E9),

          onPrimaryContainer: Color(0xFF00210F),
          secondary: CustomColors.darkGreen,
          onSecondary: Colors.white,
          secondaryContainer: Color(0xFF94D8BF),
          onSecondaryContainer: Color(0xFF002116),
          error: Colors.red.shade700,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black,
          outline: Colors.grey.shade400,
          shadow: Colors.black.withAlpha((0.25 * 255).round()),
          inverseSurface: Colors.black,
          inversePrimary: Color(0xFF4CAF50),
          surfaceTint: CustomColors.lightGreen,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoginScreen(),
    );
  }
}
