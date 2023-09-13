import 'package:flutter/material.dart';
import 'package:market_kurly_ui/constants.dart';
import 'package:market_kurly_ui/screens/components/CustomActions.dart';
import 'package:market_kurly_ui/screens/home/components/benefit_page.dart';
import 'package:market_kurly_ui/screens/home/components/kurly_page.dart';
import 'package:market_kurly_ui/screens/home/components/new_product_page.dart';
import 'package:market_kurly_ui/screens/home/components/thrity_shopping_page.dart';
import 'package:market_kurly_ui/theme.dart';

class HomeScreen extends StatelessWidget {
  final List<String> categories = ['컬리추천', "신상품", "금주혜택", "알뜰쇼핑"];

  @override
  Widget build(BuildContext context) {
    // 2. TabBar또는 TabBarView를 공유하는 데 사용되는 상속된 위젯
    return DefaultTabController(
      // 3. 초기 탭 인덱스
      initialIndex: 0,
      // 4. 탭 개수
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Kurly"),
          actions: [
            CustomActions(),
          ],
          bottom: PreferredSize(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(width: 0.3, color: Colors.grey),
                ),
              ),
              child: TabBar(
                tabs: List.generate(
                  categories.length,
                  (index) => Tab(
                    text: categories[index],
                  ),
                ),
                // 선택된 탭의 텍스트 색
                labelColor: kPrimaryColor,
                // 선택되지 않은 탭의 텍스트 색
                unselectedLabelColor: kSecondaryColor,
                labelStyle: textTheme().headline2?.copyWith(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                // 선택한 탭의 아래의 색
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 2, color: kPrimaryColor),
                ),
              ),
            ),
            preferredSize: Size.fromHeight(42),
          ),
        ),
        body: TabBarView(
          children: [
            KurlyPage(),
            NewProductPage(),
            BenefitPage(),
            ThriftyShoppingPage(),
          ],
        ),
      ),
    );
  }
}
