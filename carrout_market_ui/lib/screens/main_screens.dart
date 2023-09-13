import 'package:carrout_market_ui/screens/chatting/chatting_screen.dart';
import 'package:carrout_market_ui/screens/home/home_screen.dart';
import 'package:carrout_market_ui/screens/my_carrot/my_carrot_screen.dart';
import 'package:carrout_market_ui/screens/near_me/near_me_screen.dart';
import 'package:carrout_market_ui/screens/neighborhood_life/neighborhood_lift_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({Key? key}) : super(key: key);

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
          NeighborhoodLifeScreen(),
          NearMeScreen(),
          ChattingScreen(),
          MyCarrotScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            label: "홈",
            icon: Icon(CupertinoIcons.home),
          ),
          const BottomNavigationBarItem(
            label: "동네생활",
            icon: Icon(
              CupertinoIcons.square_on_square,
            ),
          ),
          const BottomNavigationBarItem(
            label: "내 근처",
            icon: Icon(CupertinoIcons.placemark),
          ),
          const BottomNavigationBarItem(
            label: "채팅",
            icon: Icon(CupertinoIcons.chat_bubble_2),
          ),
          const BottomNavigationBarItem(
            label: "나의 당근",
            icon: Icon(CupertinoIcons.person),
          ),
        ],
      ),
    );
  }
}
