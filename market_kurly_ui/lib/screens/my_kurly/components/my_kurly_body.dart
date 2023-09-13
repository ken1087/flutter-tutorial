import 'package:flutter/material.dart';
import 'package:market_kurly_ui/models/text_menu.dart';
import 'package:market_kurly_ui/screens/components/TextMenuCard.dart';
import 'package:market_kurly_ui/screens/my_kurly/components/my_kurly_header.dart';

class MyKurlyBody extends StatelessWidget {
  const MyKurlyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyKurlyHeader(),
        buildPaddingTextMenuCard("비회원 주문 조회", () {}),
        SizedBox(
          height: 330,
          child: ListView.separated(
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) => SizedBox(
              height: 55,
              child: TextMenuCard(
                title: textMenuList[index].text,
                icon: textMenuList[index].icon,
                press: () {},
              ),
            ),
            separatorBuilder: (context, index) => Divider(
              height: 0,
            ),
            itemCount: textMenuList.length,
          ),
        ),
        buildPaddingTextMenuCard("컬리 소개", () {})
      ],
    );
  }

  Padding buildPaddingTextMenuCard(String text, GestureTapCallback press) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        height: 55,
        child: TextMenuCard(
          title: text,
          icon: "assets/icons/right-arrow.svg",
          press: press,
          textColor: Colors.black,
        ),
      ),
    );
  }
}
