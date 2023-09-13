import 'package:carrout_market_ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyCarrotHeader extends StatelessWidget {
  const MyCarrotHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1. Card위젯은 입체감과 모서리에 곡선이 필요한 위젯을 만들 때 사용
    // Card 위젯 자체에는 크기를 지정할 수 없다
    // 부모 위젯의 제약과 자식 위젯의 크기에 따라 결정된다.
    //  Card 위젯은 기본적으로 margin을 가지고 있다
    // margin이 필요없을때는 EdgeInsets.zero을 넣어주도록 한다
    return Card(
      elevation: 0.5,
      margin: EdgeInsets.zero,
      // 2. Card 위젯의 모서리 곡선을 없애기 위해 사용한다
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      // 3. Card 위젯 세로와 가로의 패딩 값을 설정한다
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        // 4. Card 위젯의 내부 콘텐츠의 레이아웃 구조를 Column으로 만들어 준다
        child: Column(
          children: [
            // 5. Container로 레이아웃을 먼저 그려주고, 잠시 후에 Row위젯과 그 자식 위젯들로 교체
            _buildProfileRow(),
            const SizedBox(height: 30),
            // 6.
            _buildProfileButton(),
            const SizedBox(height: 30),
            // 7.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildRoundTextButton('판매내역', FontAwesomeIcons.receipt),
                _buildRoundTextButton('구매내역', FontAwesomeIcons.shoppingBag),
                _buildRoundTextButton('관심목록', FontAwesomeIcons.heart),
              ],
            )
          ],
        ),
      ),
    );
  }

  // 5.
  Widget _buildProfileRow() {
    return Row(
      children: [
        // 1. Stack위젯과 Positioned위젯을 활용해서 이미지 위에 다른 위젯을 쌓고 꾸며 줄 수 있다
        Stack(
          children: [
            SizedBox(
              width: 65,
              height: 65,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.5),
                child: Image.network(
                  "https://placeimg.com/200/100/people",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[100],
                ),
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 15,
                ),
              ),
            )
          ],
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("developer", style: textTheme().headline2),
            SizedBox(height: 10),
            Text("좌동 #00912"),
          ],
        )
      ],
    );
  }

  // 6.
  Widget _buildProfileButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFD4D5DD),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        height: 45,
        child: Center(
          child: Text(
            "프로필 보기",
            style: textTheme().subtitle1,
          ),
        ),
      ),
    );
  }

  // 7.
  Widget _buildRoundTextButton(String title, IconData iconData) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromRGBO(225, 226, 208, 1),
            border: Border.all(color: Color(0xFFD4D5DD), width: 0.5),
          ),
          child: Icon(
            iconData,
            color: Colors.orange,
          ),
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: textTheme().subtitle1,
        ),
      ],
    );
  }
}
