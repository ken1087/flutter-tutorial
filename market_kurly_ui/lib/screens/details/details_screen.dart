import 'package:flutter/material.dart';
import 'package:market_kurly_ui/constants.dart';
import 'package:market_kurly_ui/models/product.dart';
import 'package:market_kurly_ui/models/product_details_arguments.dart';
import 'package:market_kurly_ui/screens/components/DefaultButton.dart';
import 'package:market_kurly_ui/screens/details/components/body.dart';
import 'package:market_kurly_ui/theme.dart';

class DetailsScreen extends StatelessWidget {
  // route의 경로
  static String routeName = "/details";

  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "${arguments.product.title}",
          style: textTheme().subtitle1?.copyWith(color: Colors.black),
        ),
      ),
      // body부분
      body: Body(
        product: arguments.product,
      ),
      // 하단의 노치 영역과 위젯 사이에 충분한 패딩을 주기 위해 사용
      bottomNavigationBar: SafeArea(
        // bottomNavigationBar 크기에 제약을 주기 위해 사용
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 양쪽에 패딩 추가
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DefaultButton(
                text: "구매하기",
                color: kPrimaryColor,
                press: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
