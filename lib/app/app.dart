import 'package:flutter/material.dart';
import 'package:mod_10_assignment_b9/features/ui/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: _inputDecorationTheme(),
        elevatedButtonTheme: _elevatedButtonThemeData(),
      ),
      initialRoute: HomeScreen.name,
      onGenerateRoute: (RouteSettings settings) {
        late Widget widget;
        if (settings.name == HomeScreen.name) {
          widget = HomeScreen();
        }

        return MaterialPageRoute(
          builder: (BuildContext context) {
            return widget;
          },
        );
      },
    );
  }

  InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey),
      border: _outlineInputBorder(),
      enabledBorder: _outlineInputBorder(),
      focusedBorder: _outlineInputBorder(),
    );
  }

  OutlineInputBorder _outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        width: 1,
        color: Colors.black45,
      ),
    );
  }

  ElevatedButtonThemeData _elevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: 16),
        padding: EdgeInsets.symmetric(vertical: 10),
        backgroundColor: Colors.black45,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        fixedSize: Size.fromWidth(double.maxFinite),
      ),
    );
  }
}
