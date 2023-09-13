import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page(),
    );
  }
}

class Page extends StatelessWidget {
  const Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Row(
                children: [
                  Text("Do you", style: TextStyle(fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text("build a",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text("Snowman?",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
                child: Image.asset("assets/flutter.png", fit: BoxFit.cover)),
            SizedBox(
              height: 2,
            ),
            Expanded(
                child: Image.asset("assets/flutter.png", fit: BoxFit.cover)),
          ],
        ),
      ),
    );
  }
}
