import 'package:flutter/material.dart';
import 'package:market_kurly_ui/models/product.dart';
import 'package:market_kurly_ui/screens/components/product_item.dart';
import 'package:market_kurly_ui/screens/home/components/circle_container.dart';
import 'package:market_kurly_ui/screens/home/components/product_filter_button.dart';

class ThriftyShoppingPage extends StatelessWidget {
  const ThriftyShoppingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // 단일 위젯의 경우 SlicerToBoxAdapter를 사용하는 것이 좋다
        // 하지만 여기서는 여러개의 자식 상자을 만들때 사용하는 SliverList를 사용한다
        SliverList(
          delegate: SliverChildListDelegate(
            [
              SizedBox(
                height: 120,
                child: Image.asset(
                  "assets/images/kurly_banner_1.jpg",
                  fit: BoxFit.fitWidth,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  child: ProductFilterButton(),
                  width: 100,
                ),
              ),
            ],
          ),
        ),
        // 다른 Sliver위젯의 측면에 패딩을 적용하는 Sliver
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 30.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.6,
            ),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Stack(
                children: [
                  ProductItem(
                    product: productList[index],
                  ),
                  Positioned(
                    bottom: 90,
                    right: 10,
                    child: CircleContainer(
                      iconPath: 'assets/icons/shopping-cart.svg',
                    ),
                  )
                ],
              );
            }, childCount: productList.length),
          ),
        )
      ],
    );
  }
}
