import 'package:flutter/material.dart';
import 'package:market_kurly_ui/models/product.dart';
import 'package:market_kurly_ui/screens/components/product_item.dart';
import 'package:market_kurly_ui/screens/home/components/circle_container.dart';

class StackProductItem extends StatelessWidget {
  // 1. Container 위젯의 가로 크기를 지정하지 않고 사용하는 부모의 위젯에서 가로 크기를 정할 수 있게 한다
  final double width;
  final Product item;
  final int number;

  const StackProductItem(
      {Key? key, required this.width, required this.item, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.only(left: 10),
      // 2.
      child: Stack(
        children: [
          ProductItem(product: item),
          Positioned(
            left: 10,
            bottom: 80,
            child: Text(
              "$number",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 85,
            child: CircleContainer(
              iconPath: "assets/icons/star.svg",
            ),
          ),
          // 3. 삼항 연산자를 사용해서 위젯을 구분 짓는다
          // number == 1일 때 투명도를 사용한 Container위젯으로 이미지 영역을 덮기 때문에
          // 아래에 있는 inkWell위젯의 onTap동작을 막을 수 있다
          number == 1
              ? Container(
                  height: 190,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                  child: Center(
                    child: Text(
                      "Coming Soon",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
