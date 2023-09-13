import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_kurly_ui/constants.dart';
import 'package:market_kurly_ui/models/nav_item.dart';
import 'package:market_kurly_ui/screens/category/category_screen.dart';
import 'package:market_kurly_ui/screens/home/home_screen.dart';
import 'package:market_kurly_ui/screens/my_kurly/my_kurly_screen.dart';
import 'package:market_kurly_ui/screens/recommend/recommend_screen.dart';
import 'package:market_kurly_ui/screens/search/search_screen.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({Key? key}) : super(key: key);

  static String routeName = '/main_screens';

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(),
          RecommendScreen(),
          CategoryScreen(),
          SearchScreen(),
          MyKurlyScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        onTap: onTaped,
        items: List.generate(
          navItems.length,
          (index) => _buildBottomNavigationBarItem(
            icon: navItems[index].icon,
            label: navItems[index].label,
            isActive: navItems[index].id == _selectedIndex,
          ),
        ),
      ),
    );
  }

  void onTaped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _buildBottomNavigationBarItem({
    String? icon,
    String? label,
    bool isActive = false,
    GestureTapCallback? press,
  }) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        width: 38,
        height: 38,
        child: IconButton(
          onPressed: press,
          icon: SvgPicture.asset(
            icon ?? "assets/icons/star.svg",
            color: isActive ? kPrimaryColor : Colors.black,
          ),
        ),
      ),
      label: label,
    );
  }
}
