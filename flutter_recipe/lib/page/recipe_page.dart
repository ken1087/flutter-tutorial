import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe/components/recipe_list_item.dart';
import 'package:flutter_recipe/components/recipe_menu.dart';
import 'package:flutter_recipe/components/recipe_title.dart';

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. 배경색 white로 설정
      backgroundColor: Colors.white,
      // 2. 비어 있는 Appbar연결
      appBar: _buildRecipeAppBar(),
      body: Padding(
        // 3. 수평으로 여백주기
        padding: const EdgeInsets.symmetric(horizontal: 20),
        // 4. 위에서 아래로 내려가는 구조이기 때문에 Column 위젯 사용
        child: ListView(
          // 5. 왼쪽 정렬
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecipeTitle(),
            RecipeMenu(),
            RecipeListItem("Coffee", "Made Coffee"),
            RecipeListItem("Burger", "Made Burger"),
            RecipeListItem("Pizza", "Made Pizza"),
          ],
        ),
      ),
    );
  }
}

AppBar _buildRecipeAppBar() {
  return AppBar(
    // Appbar 배경색
    backgroundColor: Colors.white,
    // Appbar 그림자 효과 조정
    elevation: 1.0,
    actions: [
      Icon(
        // 쿠퍼티노 아이콘: 검색아이콘
        CupertinoIcons.search,
        color: Colors.black,
      ),
      SizedBox(width: 15),
      Icon(
        // 쿠퍼티노 아이콘: 하트 아이콘
        CupertinoIcons.heart,
        color: Colors.redAccent,
      ),
      SizedBox(width: 15),
    ],
  );
}
