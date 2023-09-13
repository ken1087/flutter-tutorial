import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultSearchField extends StatefulWidget {
  const DefaultSearchField({Key? key}) : super(key: key);

  @override
  State<DefaultSearchField> createState() => _DefaultSearchFieldState();
}

class _DefaultSearchFieldState extends State<DefaultSearchField> {
  // 1. FocusNode 클래스는 StatefulWidget 위젯에서 키보드의 focus상태를
  // 얻고 키보드 이벤트를 처리하는 데 사용할 수 있는 개체
  FocusNode _focusNode = FocusNode();

  // 2. FocusNode의 상태를 저장하기 위한 변수
  bool isFocus = false;

  @override
  void initState() {
    super.initState();
    // 3. Flutter에서 키보드를 해제하는 방법
    // 키보드가 활성화 된 상태에서 앱이 종료되거나 전화가 왔을 떄차람
    // TextFormField의 focus된 상태를 제거하고 사용하지 않는 FocusNode를 제공해서 종료
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    // 4. FocusNode에 이벤트 리스너 추가
    _focusNode.addListener(() => _onFocusChange());
  }

  // 5. 이벤트 리스너가 동작할 때 실행시키는 함수
  void _onFocusChange() {
    print("aaaa");
    setState(() {
      isFocus = !isFocus;
    });
  }

  // 6. Text(취소)를 사용자가 눌렀을 떄, focus된 상태를 제거하기위한 함수
  void _unFocus() {
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            focusNode: _focusNode,
            // 7. 텍스트 필드 focusNode속성에 만들었던 FoucusNoe를 등록
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[100],
              hintText: "검색어를 입력해 주세요",
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Container(
          // 8. 컨테이너 크기를 상태에 따라 정의
          width: isFocus ? 50 : 0,
          // 9. 자식위젯을 focus된 상태에 따라 Text위젯과 SizedBox위젯을
          // 만들어 줍니다. Text위젯에 GestureDetector위젯을 감싸
          // onTap속성에 _unFocus함수를 연결
          child: isFocus
              ? Center(
                  child: GestureDetector(
                    onTap: _unFocus,
                    child: Text(
                      "취소",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )
              : SizedBox(),
        )
      ],
    );
  }
}
