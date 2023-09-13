import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_kurly_ui/models/list_category_menu.dart';

// 1. StatefullWidget도 생성자를 만들고 데이터를 넘겨받을 수 있다
class ExtendsIconTextCard extends StatefulWidget {
  final ListCategoryMenu item;

  const ExtendsIconTextCard({Key? key, required this.item}) : super(key: key);

  @override
  _ExtendsIconTextCardState createState() => _ExtendsIconTextCardState(item);
}

class _ExtendsIconTextCardState extends State<ExtendsIconTextCard> {
  // 2.State를 상속받는 객체에서도 생성자를 만들어 주고 SatefullWidget에서
  // 넘겨받은 데이터를 멤버 변수로 지정
  _ExtendsIconTextCardState(this.item);

  // 3.모델 클래스에 만들었던 ListCategoryMenu클래스 타입의 변수를 선언
  final ListCategoryMenu item;

  // 4.확장될 컨테이너의 현재 상태를 저장할 변수
  bool isShow = false;

  // 5.setState메서드를 이용해서 isShow변수의 값을 변경하는 메서드
  void toggle() {
    setState(() {
      isShow = !isShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(width: 8),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: SvgPicture.asset(item.icon),
                ),
                const SizedBox(width: 15),
                Text(item.title),
                const Spacer(),
                SizedBox(
                  width: 30,
                  child: IconButton(
                    // 6.사용자가 아이콘 버튼을 눌렀을 경우 toggle() 메서드 실행
                    onPressed: () {
                      toggle();
                    },
                    icon: SvgPicture.asset(
                      "assets/icons/down.svg",
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
          ),
          // 7. Flutter에서는 애니메이션 기능을 아주 간단하게 만들 수 있다
          // 여기서는 AnimatedContainer위젯을 이용해서 duration, curve속성 정의
          // duration속성은 애니메이션의 완료될 떄 까지의 시간을 정의
          // curve는 물리적인 속도를 정의할 수 있다.
          AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            curve: Curves.fastOutSlowIn,
            height: isShow ? 100 : 0,
            decoration: BoxDecoration(color: Colors.blue[200]),
            child: Center(child: Text("${item.title}")),
          )
        ],
      ),
    );
  }
}
