import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode;
  ThemeProvider({this.themeMode});
  void toggleTheme(bool value) async {
    themeMode = value ? ThemeMode.dark : ThemeMode.light;

    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("themeMode", value ? "dark" : "light");
  }
}

class MyTheme {
  static final darkTheme = ThemeData(
    primaryColor: Colors.black,

    visualDensity: VisualDensity.adaptivePlatformDensity,
    cardColor: Colors.black,
    scaffoldBackgroundColor: Color(0xff383838),
    fontFamily: "Poppins",
    accentColor: Colors.orange,
    colorScheme: ColorScheme.dark(
      primary: Colors.orange,
    ),
    iconTheme: IconThemeData(color: Colors.white),

    // inputDecorationTheme: InputDecorationTheme(
    //   border: OutlineInputBorder(
    //     borderSide: BorderSide(color: Colors.transparent),
    //   ),
    //)
  );
  static final lightTheme = ThemeData(
    primaryColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    cardColor: Colors.white,
    fontFamily: "Poppins",
    scaffoldBackgroundColor: Colors.grey[50],
    colorScheme:
        ColorScheme.light(primary: Colors.orange, onPrimary: Colors.black),
    iconTheme: IconThemeData(color: Colors.black),
    accentColor: Colors.orange,
  );
}
