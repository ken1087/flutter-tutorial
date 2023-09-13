import 'package:flutter/material.dart';
import 'package:market_kurly_ui/models/product.dart';
import 'package:market_kurly_ui/screens/recommend/components/card_product_item.dart';
import 'package:market_kurly_ui/screens/recommend/components/stack_product_item.dart';
import 'package:market_kurly_ui/theme.dart';

class RecommendScreen extends StatelessWidget {
  const RecommendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("추천"),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              "베이커리 인기 급상승 랭킹",
              style: textTheme().headline1,
            ),
          ),
          const SizedBox(height: 15),
          // 1. 수평 방향으로 스크롤 되는 영역의 높이 크기를 지정
          Container(
            color: Colors.orange[100],
            height: 270,
            child: ListView.builder(
              // 가로 스크롤
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => StackProductItem(
                width: 160,
                item: productList[index],
                number: index + 1,
              ),
              itemCount: productList.length,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text("후기가 좋은 상품", style: textTheme().headline1),
          ),
          const SizedBox(height: 15),
          // 2. 높이 영역의 크기를 Container위젯을 화ㅓㄹ용해서 지정
          // 물론 SizedBox위젯을 사용해도 되지만 color 속성을 사용하기 위해서 Container를 사용
          Container(
            height: 360,
            color: Colors.red[100],
            child: Center(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 40),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => SizedBox(
                  width: 360,
                  child: CardProductItem(
                    item: productList[index],
                  ),
                ),
                itemCount: productList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
