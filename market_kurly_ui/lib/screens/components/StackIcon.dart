import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_kurly_ui/constants.dart';

class StackIcon extends StatelessWidget {
  const StackIcon({
    Key? key,
    required this.imgPath,
    required this.onPress,
    required this.counter,
  }) : super(key: key);

  final String? imgPath;
  final GestureTapCallback onPress;
  final String? counter;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          onPressed: onPress,
          icon: SvgPicture.asset(
            imgPath ?? "assets/icons/shopping-cart.svg",
            color: Colors.white,
          ),
        ),
        Positioned(
          top: 10,
          right: 5,
          child: Container(
            width: 14,
            height: 14,
            child: Container(
              width: 14,
              height: 14,
              child: Center(
                child: Text(
                  "$counter",
                  style: TextStyle(fontSize: 10, color: kPrimaryColor),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        )
      ],
    );
  }
}
