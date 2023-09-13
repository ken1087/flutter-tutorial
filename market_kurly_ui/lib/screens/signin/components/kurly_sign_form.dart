import 'package:flutter/material.dart';
import 'package:market_kurly_ui/constants.dart';
import 'package:market_kurly_ui/screens/components/DefaultButton.dart';
import 'package:market_kurly_ui/screens/signin/components/form_error.dart';

class KurlySignForm extends StatefulWidget {
  const KurlySignForm({Key? key}) : super(key: key);

  @override
  State<KurlySignForm> createState() => _KurlySignFormState();
}

class _KurlySignFormState extends State<KurlySignForm> {
  // 1. GlobalKey는 Form태그 안에 연결이 된다. Form 태그를 사용하는 이유는
  // Form 태그안에 있는 모든 입력받는 요소들에 있는 값들의 상태를 관리하기 위해 사용
  // GlobalKey를 통해서 모든 요소의 값을 한 번에 관리할 수 있다
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // 2. 미리 정의한 유효성 검사에 실패한 유형들을 담는 String타입의 리스트
  final List<String> errors = [];
  // 3. 사용자가 입력할 id
  String? id;
  // 4. 사용자가 입력할 password
  String? password;
  // 5. id를 입력하지 않았을 경우 실패한 유형
  String kIdNull = "아이디를 입력해 주세요";
  // 6. password를 입력하지 않았을 경우 실패한 유형
  String kPasswordNull = "비밀번호를 입력해 주세요";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 7. 아이디를 입력받을 TextFormField
            _buildIdlField(),
            SizedBox(height: 12),
            // 8. 패스워드를 입력받을 TextFormField
            _buildPasswordField(),
            SizedBox(height: 20),
            DefaultButton(
              text: "로그인",
              press: () {
                // 9. form의 유효성을 검사하는 부분
                if (_formKey.currentState!.validate() && errors.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("유효성 검사 확인"),
                  ));
                }
              },
            ),
            SizedBox(height: 10),
            // 10. 유효성 검사에 실패한 항목을 위젯으로 만들어 표시
            FormError(errors: errors),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1),
    );
  }

  TextFormField _buildIdlField() {
    return TextFormField(
      onSaved: (newValue) => id = newValue,
      onChanged: (value) {
        if (value.isNotEmpty & errors.contains(kIdNull)) {
          setState(() {
            errors.remove(kIdNull);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty & !errors.contains(kIdNull)) {
          setState(() {
            errors.add(kIdNull);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        border: outlineInputBorder(kTextColor),
        focusedBorder: outlineInputBorder(kPrimaryColor),
        errorBorder: outlineInputBorder(kPrimaryColor),
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.only(left: 16, top: 15, bottom: 15),
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.grey[400], fontSize: 18),
        hintText: kIdNull,
      ),
    );
  }

  TextFormField _buildPasswordField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty & errors.contains(kPasswordNull)) {
          setState(() {
            errors.remove(kPasswordNull);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty & !errors.contains(kPasswordNull)) {
          setState(() {
            errors.add(kPasswordNull);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        border: outlineInputBorder(kTextColor),
        focusedBorder: outlineInputBorder(kPrimaryColor),
        errorBorder: outlineInputBorder(kPrimaryColor),
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.only(left: 16, top: 15, bottom: 15),
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.grey[400], fontSize: 18),
        hintText: kPasswordNull,
      ),
    );
  }
// 1.
}
