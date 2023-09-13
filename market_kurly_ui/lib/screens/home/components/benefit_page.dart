import 'package:flutter/material.dart';
import 'package:market_kurly_ui/models/benefit_benner.dart';
import 'package:market_kurly_ui/theme.dart';

class BenefitPage extends StatefulWidget {
  const BenefitPage({Key? key}) : super(key: key);

  @override
  State<BenefitPage> createState() => _BenefitPageState();
}

class _BenefitPageState extends State<BenefitPage> {
  Future _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            color: Color(0xeff4e4da * (index + 1)),
            height: 140,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text(
                      "${benefitBannerList[index].title}",
                      style: textTheme().bodyText2,
                    ),
                    Text(
                      "${benefitBannerList[index].benefit}",
                      style: textTheme()
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                  ],
                ),
                const Spacer(),
                Image.asset(
                  benefitBannerList[index].image,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 22)
              ],
            ),
          ),
        ),
        itemCount: benefitBannerList.length,
      ),
    );
  }
}
