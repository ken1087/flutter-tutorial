import 'package:flutter/material.dart';
import 'package:market_kurly_ui/models/grid_category_menu.dart';

class ImageTextCard extends StatelessWidget {
  final GridCategoryMenu item;

  const ImageTextCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 1,
      // 1. Card위젯의 기본 라운드 처리된 모양을 제거
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      // 2. Card위젯이 기본 margin값을 0으로 처리
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          // 3. 이미지 영역으로 표시할 부분에 Expanded위젯의 flex속성을 3으로 정의
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(item.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // 4. 텍스트로 표시할 부분에 Expanded위젯의 flex속성을 1로 정의
          // Card위젯은 기본적으로 자식 위젯의 크기에 따라 카드 위젯의 크기가 결정되지만
          // 자식 위젯도 크기를 고정된 크기로 정하지 않는다
          // 이유는 사용하는 부모 위젯에서 크기에 제약을 설정할 수 있게 하기 위함
          // 그리고 Card위젯의 기본 라운드 처리된 모양을 제거
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  item.title,
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
