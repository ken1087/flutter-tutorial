import 'package:flutter/material.dart';
import 'package:market_kurly_ui/constants.dart';
import 'package:market_kurly_ui/models/grid_category_menu.dart';
import 'package:market_kurly_ui/models/list_category_menu.dart';
import 'package:market_kurly_ui/screens/category/components/extends_icon_text_card.dart';
import 'package:market_kurly_ui/screens/category/components/image_text_card.dart';
import 'package:market_kurly_ui/screens/components/CustomActions.dart';
import 'package:market_kurly_ui/screens/components/TextMenuCard.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("카테고리"),
        actions: [CustomActions()],
        automaticallyImplyLeading: false,
      ),
      body: CustomScrollView(
        // 패딩을 줄 때 SliverPadding을 사용한다.
        // 상단과 하단에 패딩을 주기 위해
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            // CustomScrollView안에 단일 위젯을 생성할 때는
            // SliverToBoxAdapter위젯을 사용하는게 좋다
            sliver: SliverToBoxAdapter(
              // 자식 위젯(TextMenuCard) 위젯의 크기를 제한
              child: SizedBox(
                height: 60,
                // TextMenuCard
                child: TextMenuCard(
                  title: "자주 사는 상품",
                  icon: "assets/icons/right-arrow.svg",
                  textColor: kPrimaryColor,
                  iconColor: kPrimaryColor,
                  press: () {},
                ),
              ),
            ),
          ),
          // SliverList
          // 하나의 위젯이 아닌 여러 개의 위젯이 필요할 때 SliverList위젯을 활용
          SliverList(
            delegate: SliverChildListDelegate(
              // Listd의 map함수를 활용해서 우리가 정의한 ExtendsIconTextCard 위젯을 담은
              // List를 만들어 낼 수 있다.
              List.generate(
                listCategoryMenuList.length,
                (index) => ExtendsIconTextCard(
                  item: listCategoryMenuList[index],
                ),
              ),
            ),
          ),
          // SLiverGrid
          SliverToBoxAdapter(
            child: Divider(height: 12, color: Colors.grey[200], thickness: 12),
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 40),
            // Slivers안에 그리드 형식의 위젯을 만들 때, SliverGrid를 사용
            // 사용법은 일반 Grid위젯과 같다
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 10,
                // SliverGrid안에 위젯의 크기를 1 : 1비율로 설정
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ImageTextCard(item: gridCategoryMenuList[index]);
                },
                childCount: gridCategoryMenuList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
