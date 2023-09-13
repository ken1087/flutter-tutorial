import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_kurly_ui/constants.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    Key? key,
    this.iconPath,
  }) : super(key: key);

  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.5),
        color: kPrimaryColor.withOpacity(0.6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: SvgPicture.asset(
          iconPath ?? "assets/icons/star.svg",
          color: Colors.white,
        ),
      ),
    );
  }
}
