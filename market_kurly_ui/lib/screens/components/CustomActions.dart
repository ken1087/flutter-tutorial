import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_kurly_ui/screens/components/StackIcon.dart';

class CustomActions extends StatelessWidget {
  const CustomActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        children: [
          SizedBox(
            width: 38,
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/pin.svg",
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 38,
            child: StackIcon(
              imgPath: "assets/icons/shopping-cart.svg",
              onPress: () {},
              counter: "2",
            ),
          )
        ],
      ),
    );
  }
}
