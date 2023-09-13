import 'package:flutter/material.dart';
import 'package:market_kurly_ui/routes.dart';
import 'package:market_kurly_ui/screens/splash/splash_screen.dart';
import 'package:market_kurly_ui/theme.dart';

void main() {
  runApp(const MarketKurly());
}

class MarketKurly extends StatelessWidget {
  const MarketKurly({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Market Kurly UI',
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: route,
    );
  }
}
