import 'package:flutter/material.dart';

class RecipeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        // 새로 스크롤
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          // 수평으로 설정
          child: Row(
            children: [
              _buildMenuItem(Icons.food_bank, "ALL"),
              SizedBox(width: 25),
              _buildMenuItem(Icons.emoji_food_beverage, "Coffee"),
              SizedBox(width: 25),
              _buildMenuItem(Icons.fastfood, "Burger"),
              SizedBox(width: 25),
              _buildMenuItem(Icons.local_pizza, "Pizza"),
            ],
          ),
        ));
  }
}

// 하나의 메뉴
Widget _buildMenuItem(IconData mIcon, String text) {
  return Container(
    width: 60,
    height: 80,
    // 테두리
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black12)),
    // 수직으로 설정
    child: Column(
      // 센터 정렬
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(mIcon, color: Colors.redAccent, size: 30),
        SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(color: Colors.black87),
        )
      ],
    ),
  );
}
