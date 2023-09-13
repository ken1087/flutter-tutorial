import 'package:flutter/material.dart';
import 'package:flutter_login/size.dart';

class CustomTextFromField extends StatelessWidget {
  final String text;

  const CustomTextFromField(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        SizedBox(height: small_gap),
        TextFormField(
          // 1. 느낌표는 null이 절대 아니다 라고 컴파일러에게 알려주는 것
          // 값이 없으면 Please enter some text경고 표시
          validator: (value) =>
              value!.isEmpty ? "Please enter some text" : null,
          // 2. 해당 TextFormField가 비밀번호 입력 양식이면 **** 처리해주기
          obscureText: text == "Password" ? true : false,
          decoration: InputDecoration(
              hintText: "Enter $text",
              // 3. 기본 TextFormField 디자인
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              // 4. 손가락 터치시 TextFormField 디자인
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              // 5. 에러발생시 TextFormField 디자인
              errorBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              // 6. 에러가 발생 후 손가락을 터치했을 때 TextFormField 디자인
              focusedErrorBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        )
      ],
    );
  }
}
