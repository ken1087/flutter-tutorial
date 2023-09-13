import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_kurly_ui/models/product.dart';
import 'package:market_kurly_ui/screens/components/product_item.dart';
import 'package:market_kurly_ui/screens/home/components/circle_container.dart';
import 'package:market_kurly_ui/screens/home/components/product_filter_button.dart';

class NewProductPage extends StatelessWidget {
  const NewProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      // 1. 슬아이더를 직접 제공하여 목록, 그리드 및 확장 헤더와 같은 다양한 스크롤 효과를 생성
      child: CustomScrollView(
        slivers: <Widget>[
          // 7. CupertinoSliverRefreshControl 위젯은 콘텐츠 컨트롤을
          // 새로 고치기 위해 IOS 스타일의 끌어 오기를 구현
          // 안드로이드 폰에서는 동작 불가
          // 다음 작업 금주혜택 화면 만들기에서 안드로이드와 IOS에서 같이 동작하는 위젯 학습
          CupertinoSliverRefreshControl(
            onRefresh: () {
              return Future<void>.delayed(const Duration(seconds: 1));
            },
          ),
          // 2. CustomScrollView와 통합되는 머티리얼 디아인 앱
          // 앱이 스크롤 될 때마다 형태를 바꾸거나 사라지는 효과를 만들 때 사용할 수 있다
          SliverAppBar(
            backgroundColor: Colors.white,
            actions: [
              SizedBox(
                child: ProductFilterButton(),
                width: 100,
              ),
            ],
          ),
          // 3. 한 화면에 리스트 뷰와 그리드 뷰만 있다면 각 항목당 개별적으로 스크롤만 가능
          // 다 같이 스크롤 하고 싶거나 더 복잡한 스크롤 뷰 효과를 만들고 싶을 때
          // 슬리버 리스트와 슬리버 그리드를 사용한다
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              // 4. 그리드 뷰에 들어올 하나의 항목에 최대 크기를 지정하고
              // 이 값에 따라 교차 축의 범위를 균등하게 나눈다
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 30,
              crossAxisSpacing: 8,
              childAspectRatio: 0.6,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // 5. Productitem 위젯을 Stack 위젯으로 감싸 위젯을 더 추가해서 꾸밈
                return Stack(
                  children: [
                    ProductItem(product: productList[index]),
                    Positioned(
                      bottom: 90,
                      right: 10,
                      child: CircleContainer(
                        iconPath: "assets/icons/shopping-cart.svg",
                      ),
                    )
                  ],
                );
              },
              // 6. 자식의 위젯의 총개수
              childCount: productList.length,
            ),
          ),
        ],
      ),
    );
  }
}
