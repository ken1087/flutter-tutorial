import 'package:carrout_market_ui/screens/main_screens.dart';
import 'package:carrout_market_ui/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CarrotMarketUI());
}

class CarrotMarketUI extends StatelessWidget {
  const CarrotMarketUI({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'carrot_market_ui',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: MainScreens(),
    );
  }
}
