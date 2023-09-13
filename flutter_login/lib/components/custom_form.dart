import 'package:flutter/material.dart';
import 'package:flutter_login/components/custom_text_form_field.dart';
import 'package:flutter_login/size.dart';

class CustomForm extends StatelessWidget {
  // 1. 글로벌 Key
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          CustomTextFromField("Email"),
          SizedBox(height: medium_gap),
          CustomTextFromField("Password"),
          SizedBox(height: large_gap),
          TextButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                Navigator.pushNamed(context, "/home");
              }
            },
            child: Text("Login"),
          )
        ],
      ),
    );
  }
}
