import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20),
        _buildHeaderAvatar(),
        SizedBox(width: 20),
        _buildHeaderProfile(),
      ],
    );
  }
}

Widget _buildHeaderAvatar() {
  return SizedBox(
    width: 100,
    height: 100,
    child: CircleAvatar(
      backgroundImage: AssetImage("assets/avatar.png"),
    ),
  );
}

Widget _buildHeaderProfile() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Kang in",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
      ),
      Text(
        "Programmer",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      Text(
        "saitama",
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    ],
  );
}
