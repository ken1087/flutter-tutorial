import 'package:flutter/material.dart';

PreferredSize appBarBottomList() {
  var height = 0.5;

  return PreferredSize(
    child: Divider(
      thickness: height,
      height: height,
      color: Colors.grey,
    ),
    preferredSize: Size.fromHeight(height),
  );
}
