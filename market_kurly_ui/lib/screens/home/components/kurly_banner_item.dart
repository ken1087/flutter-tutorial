import 'package:flutter/material.dart';
import 'package:market_kurly_ui/models/home_banner.dart';
import 'package:market_kurly_ui/screens/home/components/box_border_text.dart';
import 'package:market_kurly_ui/screens/home/components/number_indicator.dart';

class KurlyBannerItem extends StatefulWidget {
  const KurlyBannerItem({Key? key}) : super(key: key);

  @override
  State<KurlyBannerItem> createState() => _KurlyBannerItemState();
}

class _KurlyBannerItemState extends State<KurlyBannerItem> {
  final List<HomeBanner> list = homeBannerList;

  int currenPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(list[index].bannerImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 16,
                  child: BoxBorderText(
                    title: list[index].eventTitle,
                    subTitle: list[index].eventContent,
                  ),
                )
              ],
            );
          },
          onPageChanged: (value) {
            setState(() {
              currenPage = value;
            });
          },
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: NumberIndicator(
            currentPage: currenPage + 1,
            length: list.length,
          ),
        )
      ],
    );
  }
}
