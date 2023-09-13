import 'package:flutter/material.dart';
import 'package:market_kurly_ui/screens/components/CustomActions.dart';
import 'package:market_kurly_ui/screens/my_kurly/components/my_kurly_body.dart';

class MyKurlyScreen extends StatelessWidget {
  const MyKurlyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("마이컬리"),
        actions: [CustomActions()],
      ),
      body: SingleChildScrollView(
        child: MyKurlyBody(),
      ),
    );
  }
}
