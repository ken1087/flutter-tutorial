import 'package:flutter/material.dart';
import 'package:market_kurly_ui/screens/details/details_screen.dart';
import 'package:market_kurly_ui/screens/main_screens.dart';
import 'package:market_kurly_ui/screens/signin/signin_screen.dart';
import 'package:market_kurly_ui/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> route = {
  SplashScreen.routeName: (context) => SplashScreen(),
  MainScreens.routeName: (context) => MainScreens(),
  SignInScreen.routeName: (context) => SignInScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
};
