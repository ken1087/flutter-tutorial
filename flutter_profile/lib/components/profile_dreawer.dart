import 'package:flutter/material.dart';

class ProfileDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        // 해당 위젯이 차지할 수 있는 최대 범위로 확장할 대 사용
        height: double.infinity,
        color: Colors.blue);
  }
}
