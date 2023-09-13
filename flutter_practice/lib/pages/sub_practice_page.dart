import 'package:flutter/material.dart';
import 'package:flutter_practice/components/practice_tabbar.dart';

class SubPracticePage extends StatelessWidget {
  const SubPracticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Pop--data:${arguments}",
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
