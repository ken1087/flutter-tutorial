import 'package:carrout_market_ui/models/neighborhood_life.dart';
import 'package:carrout_market_ui/screens/components/image_container.dart';
import 'package:carrout_market_ui/theme.dart';
import 'package:flutter/material.dart';

class LifeHeader extends StatelessWidget {
  const LifeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ImageContainer(
              borderRadius: 6,
              imageUrl: "https://placeimg.com/200/100/any",
              width: 45,
              height: 45,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                lifeTitle,
                style: textTheme().bodyText1,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
