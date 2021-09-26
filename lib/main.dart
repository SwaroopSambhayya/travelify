import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelify/screens/home.dart';
import 'package:travelify/screens/onboarding.dart';
import 'package:travelify/screens/place.dart';
import 'package:travelify/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(
          themeMode: pref.getString("theme") == "dark"
              ? ThemeMode.dark
              : ThemeMode.light),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travelify',
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      darkTheme: MyTheme.darkTheme,
      theme: MyTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: Onboarding(),
    );
  }
}
