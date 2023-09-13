import 'package:flutter/material.dart';
import 'package:flutter_airbnb/styles.dart';

class CommonFormField extends StatelessWidget {
  final prefixText;
  final hintText;

  // 1. requierd 키워드는 선택적 매개변수 {} 안에서 꼭 받아야 하는 값을 설정할 수 있습니다.
  const CommonFormField({required this.prefixText, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          // 2. TextFormField 내부 세로 정렬
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            // 3. TextFormField 내부에 패딩을 준다
            contentPadding: EdgeInsets.only(top: 30, left: 20, bottom: 10),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
        ),
        // 4. Positioned를 사용한 이유는 TextFormField 공간에 글자를 삽입하기 위해서
        Positioned(
          top: 8,
          left: 20,
          child: Text(
            prefixText,
            style: overLine(),
          ),
        ),
      ],
    );
  }
}
